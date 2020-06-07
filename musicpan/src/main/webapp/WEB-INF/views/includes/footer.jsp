<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 컨텐츠 페이지 전용 -->
<!-- scroll to top -->
<div class="utilBtns back-to-top">
	<div>
		<a id="back-to-top1" href="#" class="btn btn-outline-dark btn-sm" role="button"><i class="fas fa-chevron-up back-to-top_i"></i></a>
	</div>
	<div>
		<a id="back-to-top2" href="#" class="btn btn-outline-dark btn-sm" role="button"><i class="far fa-comment-dots"></i></a>
	</div>
	<div>
		<a id="back-to-top3" href="#" class="btn btn-outline-dark btn-sm" role="button"><i class="fas fa-list-ul"></i></a>
	</div>
</div>
<!-- scroll to top -->

<!-- 그외 페이지 -->
<!-- scroll to top -->
<div class="utilBtns back-to-top99">
	<div>
		<a id="back-to-top91" href="#" class="btn btn-outline-dark btn-sm" role="button"><i class="fas fa-chevron-up back-to-top_i"></i></a>
	</div>
</div>
<!-- scroll to top -->

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ FORM ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->
<form id="logoutForm" method='post' action="/customLogout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->
    
    
    
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
	<!-- 카운터 테스트 -->
	<!-- =================================================================================================  -->
	<script type="text/javascript">
	$(document).ready(function () {
		console.log("전체방문자 : ${countAll} // 오늘방문자 : ${countToday}");
	});
	</script>
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
    <!-- csrf  -->
    <!-- =================================================================================================  -->
	    <script type="text/javascript">
	    $(document).ready(function(){
	    	var csrfHeaderName ="${_csrf.headerName}"; 
	        var csrfTokenValue="${_csrf.token}";
	        
	    	$(document).ajaxSend(function(e, xhr, options) { 
	            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
	        }); 
	    });
    </script>
    <!-- =================================================================================================  -->
    
	<!-- =================================================================================================  -->
    <!-- sweetalert 단축  -->
    <!-- =================================================================================================  -->
	    <script type="text/javascript">
	 	function swa(flag, msg){
	 		if(flag=="success"){
	 			Swal.fire({
	 	    		  position: 'center',
	 	    		  icon: 'success',
	 	    		  title: msg,
	 	    		  showConfirmButton: false,
	 	    		  timer: 1000
	 	    		});
	 		}else if(flag=="error"){
	 			Swal.fire({
	 	    		  position: 'center',
	 	    		  icon: 'error',
	 	    		  title: msg,
	 	    		  showConfirmButton: false,
	 	    		  timer: 1000
	 	    		});
	 		}
	 	}
	   	</script>
    <!-- =================================================================================================  -->
	
	

	<!-- =================================================================================================  -->
    <!-- 로그아웃버튼 이벤트  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function(){
            $('#logoutBtn').on('click', function(e){
            	e.preventDefault();
                $("#logoutForm").submit();
            });
            $('#logoutBtn2').on('click', function(e){
            	e.preventDefault();
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
