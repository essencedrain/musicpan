<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>        
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="description" content="뮤직카우 곡, 가격 데이터 조회 사이트">
	<meta property="og:type" content="website"> 
	<meta property="og:title" content="뮤직타우(MusicTau)">
	<meta property="og:description" content="뮤직카우 곡, 가격 데이터 조회 사이트">
	<meta property="og:image" content="http://www.musictau.com/resources/img/MusicTau2.png">
	<meta property="og:url" content="http://www.musictau.com">
    <title>뮤직타우</title>

    <!-- Bootstrap 4.1 -->
    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <!-- google font -->
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:100,500,700,900&display=swap&subset=korean" rel="stylesheet">
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
    
    <!-- google ad -->
	<script data-ad-client="ca-pub-1417324415717357" async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
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
                <h3 class="font-weight-bold"><a href="/">뮤직타우</a></h3>
            </div>

            <ul class="list-unstyled components">
                <li>
                    <a href="/">홈</a>
                </li>
				<li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">타우테이블 <i class="fas fa-angle-down"></i></a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="/tables/priceInfo">가격 정보</a>
                        </li>
                        <li>
                            <a href="/tables/metaInfo">곡 정보</a>
                        </li>
                        <li>
                            <a href="/tables/tauVolume">거래량 정보</a>
                        </li>
                        <li>
                            <a href="/tables/auctionInfo">옥션 정보</a>
                        </li>
                        <li>
                            <a href="/tables/tauPickV1"><i class="far fa-id-card"></i> 타우픽 V1</a>
                        </li>
                    </ul>
                </li>
				<!--
				<li>
                    <a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false">게시판</a>
                    <ul class="collapse list-unstyled" id="pageSubmenu">
                        <li>
                            <a href="/board/free/list">자유게시판</a>
                        </li>
                        <li>
                            <a href="#">게시판(예정)</a>
                        </li>
                        <li>
                            <a href="#">게시판(예정)</a>
                        </li>
                    </ul>
                </li>
                -->
                <li>
                    <a href="/board/free/list">자유 게시판</a>
                </li>
                <li>
                    <a href="/board/analysis/list">정보·분석 게시판</a>
                </li>
            </ul>
			
			
            <ul class="list-unstyled CTAs">
            	<sec:authorize access="isAuthenticated()">
            		<li>
	                    <a href="/mypage" class="download">마이페이지</a>
	                </li>
	                <li>
	                    <a href="#" class="article logoutBtn">로그아웃</a>
	                </li>
            	</sec:authorize>
            	<sec:authorize access="isAnonymous()">
	                <li>
	                    <a href="/customLogin" class="download">로그인</a>
	                </li>
	                <li>
	                    <a href="/register" class="article">회원가입</a>
	                </li>
                </sec:authorize>
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
            <nav class="navbar navbar-expand-md navbar-light bg-light">
                <div class="container-fluid">

                    <button type="button" id="sidebarCollapse" class="btn btn-primary">
                        <i class="fas fa-align-left"></i>
                    </button>
                    <span class="nav_heading mr-auto"><a href="/">&nbsp;&nbsp;<img class="BigTitleImg" src="/resources/img/MusicTau1.png"></a></span>
                    
                    <sec:authorize access="isAuthenticated()">
	                    <div class="d-inline-block d-md-none ml-auto">
	                    	<button class="btn btn-outline-dark" type="button" onclick="location.href='/mypage';"><i class="fas fa-user"></i></button>
	                    	<button class="btn btn-outline-dark logoutBtn" type="button"><i class="fas fa-sign-out-alt"></i></button>
	                    </div>	
                    </sec:authorize>
                    <sec:authorize access="isAnonymous()">
	 					<button class="btn btn-outline-dark d-inline-block d-md-none ml-auto" type="button" onclick="location.href='/customLogin';"><i class="fas fa-sign-in-alt"></i></button>
                    </sec:authorize>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="nav navbar-nav ml-auto">
                        	<li class="nav-item dropdown">
						        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						        타우테이블
					        </a>
					        <div class="dropdown-menu">
						        <a class="dropdown-item" href="/tables/priceInfo">가격 정보</a>
						        <a class="dropdown-item" href="/tables/metaInfo">곡 정보</a>
						        <a class="dropdown-item" href="/tables/tauVolume">거래량 정보</a>
						        <a class="dropdown-item" href="/tables/auctionInfo">옥션 정보</a>
						        <div class="dropdown-divider"></div>
						        <a class="dropdown-item" href="/tables/tauPickV1"><i class="far fa-id-card"></i> 타우픽 V1</a>
					        </div>
						    </li>
                        	<li class="nav-item dropdown">
						        <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
						        게시판
					        </a>
					        <div class="dropdown-menu">
						        <a class="dropdown-item" href="/board/free/list">자유게시판</a>
						        <a class="dropdown-item" href="/board/analysis/list">정보·분석 게시판</a>
					        </div>
						    </li>
                            <sec:authorize access="isAuthenticated()">
	                            <li class="nav-item">
	                            	<a class="nav-link" href="/mypage">마이페이지</a>
	                            </li>
                            </sec:authorize>
                            <li class="nav-item">
                            	<sec:authorize access="isAuthenticated()">
                                	<a class="nav-link logoutBtn" href="#">로그아웃</a>
                                </sec:authorize>
                                <sec:authorize access="isAnonymous()">
                                	<a class="nav-link" href="/customLogin">로그인</a>
                                </sec:authorize>
                            </li>
                            <li class="nav-item">
                                <sec:authorize access="isAnonymous()">
                                	<a class="nav-link" href="/register">회원가입</a>
                                </sec:authorize>
                            </li>
                            
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- =================================================================================================  -->
            <!-- end navbar  -->
            <!-- =================================================================================================  -->