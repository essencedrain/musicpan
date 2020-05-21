<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    
    
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Collapsible sidebar using Bootstrap 4</title>

    <!-- Bootstrap 4.1 -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:500,700,900&display=swap&subset=korean" rel="stylesheet">
    <!-- Scrollbar Custom CSS -->
    <link rel="stylesheet" href="/resources/css/jquery.mCustomScrollbar.min.css">

    <!-- animate css -->
    <link rel="stylesheet" href="/resources/css/animate.css">
    <!--  sweetalert2  -->
    <link rel="stylesheet" href="/resources/css/sweetalert2.min.css">

    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/resources/css/style.css">

    <!-- Font Awesome JS -->
    <script defer src="/resources/js/solid.js"></script>
    <script defer src="/resources/js/fontawesome.js"></script>
    <!-- jQuery -->
    <script src="/resources/js/jquery.min.js"></script>

</head>

<body>
    <!-- =================================================================================================  -->
    <!-- start wrapper  -->
    <!-- =================================================================================================  -->
    <div class="wrapper">
        <!-- =================================================================================================  -->
        <!-- start Sidebar  -->
        <!-- =================================================================================================  -->
        <nav id="sidebar">
            <div id="dismiss">
                <i class="fas fa-arrow-left"></i>
            </div>

            <div class="sidebar-header">
                <h3>Bootstrap Sidebar</h3>
            </div>

            <ul class="list-unstyled components">
                <p>Dummy Heading</p>
                <li class="active">
                    <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false">Home</a>
                    <ul class="collapse list-unstyled" id="homeSubmenu">
                        <li>
                            <a href="#">Home 1</a>
                        </li>
                        <li>
                            <a href="#">Home 2</a>
                        </li>
                        <li>
                            <a href="#">Home 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">About</a>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">Pages</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="#">Page 1</a>
                        </li>
                        <li>
                            <a href="#">Page 2</a>
                        </li>
                        <li>
                            <a href="#">Page 3</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="#">Portfolio</a>
                </li>
                <li>
                    <a href="#">Contact</a>
                </li>
            </ul>

            <ul class="list-unstyled CTAs">
                <li>
                    <a href="https://bootstrapious.com/tutorial/files/sidebar.zip" class="download">Download source</a>
                </li>
                <li>
                    <a href="https://bootstrapious.com/p/bootstrap-sidebar" class="article">Back to article</a>
                </li>
            </ul>
        </nav>
        <!-- =================================================================================================  -->
        <!-- end Sidebar  -->
        <!-- =================================================================================================  -->

        <!-- =================================================================================================  -->
        <!-- start Content  -->
        <!-- =================================================================================================  -->
        <div id="content">
            <!-- =================================================================================================  -->
            <!-- start navbar  -->
            <!-- =================================================================================================  -->
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fas fa-align-left"></i>
                    </button>
                    <span>&nbsp;&nbsp;뮤직판</span>
                    <button class="btn btn-dark d-inline-block d-lg-none ml-auto" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-align-justify"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                            <li class="nav-item active">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Page</a>
                            </li>
                            <li class="nav-item">
                            	<sec:authorize access="isAuthenticated()">
                                	<a id="logoutBtn" class="nav-link" href="#">로그아웃</a>
                                </sec:authorize>
                                <sec:authorize access="isAnonymous()">
                                	<a id="loginBtn" class="nav-link" href="#">로그인</a>
                                </sec:authorize>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- =================================================================================================  -->
            <!-- end navbar  -->
            <!-- =================================================================================================  -->


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
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ FORM ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->
<form id="loginForm" method='post' action="/login">  
      <input type='hidden' name='username' id="username">
      <input type='hidden' name='password' id="password">
      <input type='checkbox' id="remember-me" name='remember-me' style="opacity:0; position:absolute; left:9999px;">
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>

<form id="logoutForm" method='post' action="/customLogout">
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- =================================================================================================  -->
    

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
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

            $('#loginBtn').on('click', function () {
                Swal.fire({
                    title: '로그인',
                    html: '<input type="text" id="username_temp" class="swal2-input" placeholder="아이디"></input>'
                        +'<input type="password" id="password_temp" class="swal2-input" placeholder="비밀번호"></input>'
                        +'<label class="form-check-label"><input type="checkbox" id="remember_temp"> 자동로그인</input></label>'
                        ,
                    confirmButtonText: '로그인',
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
                    	
                        $('#username').val(result.value.username);
                        $('#password').val(result.value.password);
                        
                        //자동로그인 체크박스 확인
                        if(result.value.remember){
                            $('#remember-me').attr("checked", true);
                        }
                        
                        $("#loginForm").submit();
                        
                        
                    	/*
                    	*/
                    	
                    	/*
            	        Swal.fire(
							"아이디: " + result.value.username + "\n"
							+ "비밀번호: " + result.value.password + "\n"
							+ "자동로그인: " + result.value.remember
						);
						*/
                     });
            });

        });
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
</body>

</html>
