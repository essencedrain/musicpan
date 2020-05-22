<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="./includes/header.jsp"%>
    
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            <h2>Collapsible Sidebar Using Bootstrap 4</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

            <div class="line"></div>
            
            <h2>테스트1</h2>
            <p>테스트</p>


            <div class="line"></div>

            <h2>테스트2</h2>
            <p>테스트</p>

            <div class="line"></div>
            
            <h2>테스트3</h2>
            <p>테스트</p>
            <!-- =================================================================================================  -->
            <!-- end  -->
            <!-- =================================================================================================  -->
        </div>
        <!-- =================================================================================================  -->
        <!-- end Content  -->
        <!-- =================================================================================================  -->
    </div>
    <!-- =================================================================================================  -->
    <!-- end wrapper  -->
    <!-- =================================================================================================  -->
    <div class="overlay"></div>


<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ FORM ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->
<form id="loginForm" method='post' action="/login">  
      <input type='hidden' name='username' id="username">
      <input type='hidden' name='password' id="password">
      <input type='checkbox' id="remember-me" name='remember_me' style="opacity:0; position:absolute; left:9999px;">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<form id="logoutForm" method='post' action="/customLogout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->



<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

    <!-- =================================================================================================  -->
    <!-- 로그인버튼 이벤트  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function () {
        	
        	var csrfHeaderName ="${_csrf.headerName}"; 
            var csrfTokenValue="${_csrf.token}";
            
        	$(document).ajaxSend(function(e, xhr, options) { 
                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
              }); 
        	
            $('#loginBtn').on('click', function () {
                
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


<%@include file="./includes/footer.jsp"%>
