<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
    
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
			<div class="container pb-5">
		        <div class="row">
		            <div class="loginFormWrap mx-auto col-md-6 col-md-offset-3">
		                <div class="heading pb-1 text-center pb-4">
		                    <h1>로그인</h1>
		                </div>
		                <div class="loginForm">
		                    <form name="loginForm_temp" method="post" action="">
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-user"></i></span>
		                            </div>
		                            <input type="text" class="form-control" id="username_temp" placeholder="아이디">
		                        </div>
		                        
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
		                            </div>
		                            <input type="password" class="form-control" id="password_temp" placeholder="비밀번호">
		                        </div>
		                        
								<label class="form-check-label mb-2"><input type="checkbox" id="remember_temp"> 로그인 상태 유지(48시간)</input></label>
								
		                        <button type="submit" id="submitBtn" class="btn btn-lg btn-outline-secondary w-100">로그인</button>
		                    </form>
		                    <hr>
		                    <button class="btn btn-lg btn-primary w-100" onclick="location.href='register'">회원가입</button>
		                </div>
		            </div>
		        </div>
			</div>
            <%@include file="../includes/htmlFooter.jsp"%> 
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
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

	<!-- =================================================================================================  -->
    <!-- 로그인버튼 이벤트  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
        $(document).ready(function(){
        	
        	$('#username_temp').focus();
        	
            $('#submitBtn').on('click', function(e){
            	e.preventDefault();
            	
            	let username = $('#username_temp').val();
                let password = $('#password_temp').val();
                let remember = $('#remember_temp').is(":checked");
                
                if (username === '' || password === '') {
                	swa("error","아이디 또는 비밀번호를 입력하세요");
                	$('#username_temp').val("");
                	$('#password_temp').val("");
                	$('#username_temp').focus();
                	return false;
                }
                
                
                $.ajax({
        			url:"/login",
        			type :  "POST",
        			dataType : "json",
        			data : {
        				id : username,
        				pwd : password,
        				remember_me : remember
        			},
        			success : function(response){
        				if(response.code == "200"){
        					// 정상 처리 된 경우
        					window.location = response.item.url;	//이전페이지로 돌아가기
        				} else {
        					swa("error","아이디 또는 비밀번호가 일치하지 않습니다");
        					$('#username_temp').val("");
                        	$('#password_temp').val("");
                        	$('#username_temp').focus();
        				}
        			},
        			error : function(a,b,c){
        				console.log(a,b,c);
        			}
        			
       			});//$.ajax
                
                
                //$("#loginForm").submit();
            });//$('#submitBtn').on('click', function(e){
        });//$(document).ready(function(){
    </script>
    <!-- =================================================================================================  -->
    
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
