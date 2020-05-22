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
		        <div class="row">
		            <div class="signUpFormWrap mx-auto col-md-6 col-md-offset-3">
		                <div class="heading pb-1 text-center pb-4">
		                    <h1>회원가입</h1>
		                </div>
		                <div class="signUpForm">
		                    <form name="signUpForm" method="post" action="join.get" onsubmit="return check9(this)">
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-user"></i></span>
		                            </div>
		                            <input type="text" class="form-control"  placeholder="아이디" name="m_id" id="m_id">
		                        </div>
		                        
		                        <div class="mb-3 d-none" id="m_id_len"><h6>아이디는 4글자 이상 사용해야 합니다.</h6></div>
		                        <div class="mb-3 d-none" id="m_id_fir"><h6>아이디는 영어 소문자로 시작해야 합니다.</h6></div>
		                        <div class="mb-3 d-none" id="m_id_spe"><h6>아이디에 특수문자는 사용할 수 없습니다.</h6></div>
		                        
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
		                            </div>
		                            <input type="password" class="form-control" placeholder="비밀번호" name="m_pwd" id="m_pwd">
		                        </div>
		
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-key"></i></span>
		                            </div>
		                            <input type="password" class="form-control" placeholder="비밀번호 확인" name="m_pwd2" id="m_pwd2">
		                        </div>
		
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
		                            </div>
		                            <input type="text" class="form-control" placeholder="닉네임" name="m_name" id="m_name">
		                        </div>
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
		                            </div>
		                            <input type="text" class="form-control" placeholder="이메일" name="m_email" id="m_email">
		                        </div>
		                        
		                        <input type="hidden" name="flag" id="flag" value="join">
		                        <button type="submit" class="btn btn-lg btn-primary w-100">가입하기</button>
		                    </form>
		                </div>
		            </div>
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
    <!-- 온로드 이벤트  ajax 아이디 중복확인 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    $(document).ready(function(){
		var validation = 0;
		$('#m_id').focus();
		
		//버튼에 자동으로 포커스 잡히는걸 막음
		$('button').focus(function(){
	        this.blur();
   		});
    
    
		//======================================================================
	    // $("#m_id").focus
	  	//======================================================================
	    $("#m_id").focus(function(){
			//가리기
			//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
			if(!$("#m_id_len").hasClass("d-none")){$("#m_id_len").addClass("d-none");}
			//"아이디는 영어 소문자로 시작해야 합니다."
			if(!$("#m_id_fir").hasClass("d-none")){$("#m_id_fir").addClass("d-none");}
			//"아이디에 특수문자는 사용할 수 없습니다."
	        if(!$("#m_id_spe").hasClass("d-none")){$("#m_id_spe").addClass("d-none");}
		});
	 	//======================================================================
	
	
		//======================================================================
	    // $("#m_id").keyup
	 	//======================================================================
	 	$("#m_id").keyup(function(){
		var str = $("#m_id").val().toUpperCase();
		var len = $("#m_id").val().length;
		//특수문자플래그
		var isSpe = false;
		
		if( str == "" ){//글자가 없으면
    		
    	}else if( len < 4 ){ //4글자 이하면
        	
	    		// 1 -> 오류
	        	validation = 1;
	        	
	        	//보이기
	        	//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
	            if($("#m_id_len").hasClass("d-none")){$("#m_id_len").removeClass("d-none");}
	            
	            
	            //첫글자가 영문자가 아니면
		    	if( !( 'A'<= str.charAt(0) && 'Z'>= str.charAt(0) ) ){
		    		//보이기
	            	//"아이디는 영어 소문자로 시작해야 합니다."
	                if($("#m_id_fir").hasClass("d-none")){$("#m_id_fir").removeClass("d-none");}
		    	}else{
		    		//가리기
		    		//"아이디는 영어 소문자로 시작해야 합니다."
		    		if(!$("#m_id_fir").hasClass("d-none")){$("#m_id_fir").addClass("d-none");}
		    	}//if
		    	
		    	//특수문자 존재 여부
		    	for(var i=1; i<len; i++){
        			if( ( 'A' <= str.charAt(i) && 'Z' >= str.charAt(i) ) || ( '0'<=str.charAt(i) && '9'>=str.charAt(i) ) ){
        				// 가리기
        				//"아이디에 특수문자는 사용할 수 없습니다."
        		        if(!$("#m_id_spe").hasClass("d-none")){$("#m_id_spe").addClass("d-none");}
        			}else{
        				//보이기
    	            	//"아이디에 특수문자는 사용할 수 없습니다."
    	                if($("#m_id_spe").hasClass("d-none")){$("#m_id_spe").removeClass("d-none");}
        			}//if
        		}//for
            
                        
        	}else{// 4글자 이상이면 
        	
	        	//첫글자가 영문자이면
	        	if( 'A' <= str.charAt(0) && 'Z' >= str.charAt(0) ){
	        		
	        		for(var i=1; i<len; i++){
	        			//특수문자가 없다
	        			if( ( 'A' <= str.charAt(i) && 'Z' >= str.charAt(i) ) || ( '0'<=str.charAt(i) && '9'>=str.charAt(i) ) ){
	        				// -1 -> 정상
	    	        		validation = -1;
	    	        		
	    	        	//특수문자가 있다
	        			}else{
	        				
	        				isSpe = true;
	    	                
	        			}//if
	        		}//for
	        		
	        		if(isSpe){
	        			validation = 1;
	        			//보이기
    	            	//"아이디에 특수문자는 사용할 수 없습니다."
    	                if($("#m_id_spe").hasClass("d-none")){$("#m_id_spe").removeClass("d-none");}
	        		}//if
	        		
	        		
	        	}else{
	        		//보이기
	            	//"아이디는 영어 소문자로 시작해야 합니다."
	                if($("#m_id_fir").hasClass("d-none")){$("#m_id_fir").removeClass("d-none");}
	                
	        	}//if
	        	
	        	//가리기
	    		//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
	    		if(!$("#m_id_len").hasClass("d-none")){$("#m_id_len").addClass("d-none");}
    		
	        }//if
	        
	    });
	 	//======================================================================
		
	 	//======================================================================
	    // $("#m_id").blur
	 	//======================================================================
	 	/*
	 	$("#m_id").blur(function(){
	        if(validation > -1){
	            //alert("ID를 정확히 입력해주세요");
	            $('#m_id').focus();
	            
	        }else{
	        
	            //Ajax사용
	            $.ajax({
	                type : 'POST',
	                url : '../ajax/confirmId.jsp',
	                data : "m_id="+$('#m_id').val(), //서버로 보내는 파라미터 값
	                dataType:'JSON', //서버가 보내주는 자료 형태
	                //cache : false,
	                //async : true,
	                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
	                       //alert(data);
	                       //alert(data.check);
						                        if(data.check==1){
						                        	swa("error","중복된 아이디 입니다.");
						                            validation = 1;
						                            
						                            $('#m_id').val("");
						                        	$('#m_id').focus();
						                            
						                        }else{
						                            //alert("사용가능한 id" );
						                            //$("#m_id_ok").removeClass("d-none");
						                        	swa("success",'사용가능한 아이디 입니다.');
						                            validation = -1;
						                        }//else---
	                						}

		            });
		        	
	        	}//if
		        
		    });
		});
    	*/
	 	//======================================================================
    
 	});//$(document).ready(function()
	</script>
    <!-- =================================================================================================  -->
    <!-- end 온로드 이벤트  ajax 아이디 중복확인 -->
    <!-- =================================================================================================  -->


<%@include file="../includes/footer.jsp"%>
