<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
    
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
			<div class="container">
		        <div class="py-5 text-center">
		            <h1>회원가입</h2>
		        </div>
		
		        <div class="col-md-12 order-md-1">
		            <h4 class="mb-3">회원정보</h4>
		            <form class="needs-validation" action="/member/register" method="POST">
		
		
		                <div class="mb-3">
		                    <label for="username">아이디</label>
		                    <div class="input-group">
		                        <input type="text" class="form-control" id="username" placeholder="Username" required name="user-id">
		                        <div class="invalid-feedback" style="width: 100%;">Your username is required.</div>
		                    </div>
		                </div>
		                
		                <div class="mb-3">
		                    <label for="password">비밀번호</label> 
		                    <input type="password" class="form-control" id="password" placeholder="" value="" required name="user-password">
		                    <div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
		                </div>
		                
		                <div class="mb-3">
		                    <label for="password">비밀번호 확인</label> 
		                    <input type="password" class="form-control" id="password" placeholder="" value="" required name="user-password">
		                    <div class="invalid-feedback">유효한 비밀번호가 필요합니다.</div>
		                </div>
		
		
		                <div class="mb-3">
		                    <label for="firstName">닉네임</label> 
		                    <input type="text" class="form-control" id="real-name" placeholder="" value="" required name="user-real-name">
		                    <div class="invalid-feedback">유효한 이름을 입력해야합니다.</div>
		                </div>
		
		                <div class="mb-3">
		                    <label for="email">이메일</label>
		                    <input type="email" class="form-control" id="email" placeholder="you@example.com" name="user-email">
		                    <div class="invalid-feedback">올바른 이메일을 입력하세요.</div>
		                </div>
		
		                <hr class="mb-4">
		                <button class="btn btn-primary btn-lg btn-block" type="submit">가입하기</button>
		                <hr class="mb-4">
		
		            </form>
		        </div>
		
		    </div>
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
      <input type='checkbox' id="remember-me" name='remember_me' style="opacity:0; position:absolute; left:9999px;">
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
    <!-- 로그인버튼 이벤트  -->
    <!-- =================================================================================================  -->
 
    <!-- =================================================================================================  -->



	<!-- =================================================================================================  -->
    <!-- 로그아웃버튼 이벤트  -->
    <!-- =================================================================================================  -->

    <!-- =================================================================================================  -->



<%@include file="../includes/footer.jsp"%>
