<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- Popper.JS -->
    <script src="/resources/js/popper.min.js"></script>
    <!-- Bootstrap JS -->
    <script src="/resources/js/bootstrap.min.js"></script>
    <!-- jQuery Custom Scroller  -->
    <script src="/resources/js/jquery.mCustomScrollbar.concat.min.js"></script>
    <!--  sweetalert2 js file  -->
    <script src="/resources/js/sweetalert2.min.js"></script>
    <!--  wow js file  -->
    <script src="/resources/js/wow.js"></script>
    <script>
        new WOW().init();
    </script>
    
    
    
<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

	<!-- =================================================================================================  -->
    <!-- 사이드바  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function () {
            $("#sidebar").mCustomScrollbar({
                theme: "minimal"
            });

            $('#dismiss, .overlay').on('click', function () {
                $('#sidebar').removeClass('active');
                $('.overlay').removeClass('active');
            });

            $('#sidebarCollapse').on('click', function () {
                $('#sidebar').addClass('active');
                $('.overlay').addClass('active');
                $('.collapse.in').toggleClass('in');
                $('a[aria-expanded=true]').attr('aria-expanded', 'false');
            });
        });
    </script>
    <!-- =================================================================================================  -->

	
    <!-- =================================================================================================  -->
    <!-- 로그인버튼 이벤트  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function () {
        	
        	//======================================================================
    	    // csrf
    	  	//======================================================================
        	var csrfHeaderName ="${_csrf.headerName}"; 
            var csrfTokenValue="${_csrf.token}";
            
        	$(document).ajaxSend(function(e, xhr, options) { 
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
            }); 
    	  	//======================================================================
        	
            $('#loginBtn').on('click', function () {
                
            	console.log("footer prevPage : "+"${prevPage}");
            	
            	Swal.fire({
                    title: '로그인',
                    html: '<input type="text" id="username_temp" class="swal2-input" placeholder="아이디"></input>'
                        +'<input type="password" id="password_temp" class="swal2-input" placeholder="비밀번호"></input>'
                        +'<label class="form-check-label"><input type="checkbox" id="remember_temp"> 자동로그인</input></label>'
                        ,
                    confirmButtonText: '로그인',
                    closeOnConfirm: false, //It does close the popup when I click on close button
                    closeOnCancel: false,
                    allowOutsideClick: false,
                    showCloseButton: true,
                    showCancelButton: true,
                    cancelButtonText:'취소',
                    preConfirm: () => {
                        let username = Swal.getPopup().querySelector('#username_temp').value
                        let password = Swal.getPopup().querySelector('#password_temp').value
                        let remember = $('input:checkbox[id="remember_temp"]').is(":checked")

                        if (username === '' || password === '') {
                        Swal.showValidationMessage(`아이디/비번을 입력하세요`)
                        }
                        return {username: username, password: password, remember: remember}
                    }
                    }).then((result) => {
                    	
                    	//스윗얼럿2 모달창 자동로그인 체크확인
                    	//체크되어 있으면 form에 체크박스 체크처리
                    	if(result.value.remember){
                            $('#remember-me').attr("checked", true);
                        }
                    	
                    	$.ajax({
                			url:"/login",
                			type :  "POST",
                			dataType : "json",
                			data : {
                				id : result.value.username,
                				pwd : result.value.password,
                				remember_me : $("#remember-me").prop("checked")
                			},
                			success : function(response){
                				if(response.code == "200"){
                					// 정상 처리 된 경우
                					window.location = response.item.url;	//이전페이지로 돌아가기
                				} else {
                					Swal.fire({
                				  		  position: 'center',
                				  		  icon: 'error',
                				  		  title: "아이디 또는 비밀번호가 일치하지 않습니다.",
                				  		  showConfirmButton: false,
                				  		  timer: 1200
                						}).then( (result) => {$('#loginBtn').trigger("click")});
                				}
                			},
                			error : function(a,b,c){
                				console.log(a,b,c);
                			}
                			
                		});//$.ajax
                   	});//Swal.fire.then
            	});//$('#loginBtn').on('click'
	        });//$(document).ready(function ()
    </script>
    <!-- =================================================================================================  -->



	<!-- =================================================================================================  -->
    <!-- 로그아웃버튼 이벤트  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function(){
            $('#logoutBtn').on('click', function(){
                $("#logoutForm").submit();
            });
        });
    </script>
    <!-- =================================================================================================  -->
    
    
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->
</body>

</html>
