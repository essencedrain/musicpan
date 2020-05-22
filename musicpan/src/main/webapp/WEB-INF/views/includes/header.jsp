<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>        
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>뮤직판</title>

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

	
	<!-- font awesome -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
	
    <!-- Our Custom CSS -->
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <!-- Font Awesome JS -->
    <!--  
    <script defer src="/resources/js/solid.js"></script>
    <script defer src="/resources/js/fontawesome.js"></script>
    -->
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