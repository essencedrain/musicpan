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
		                    <form name="signUpForm" method="post" action="/register" onsubmit="return check9(this)">
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-user"></i></span>
		                            </div>
		                            <input type="text" class="form-control"  placeholder="아이디" name="id" id="id">
		                            <div id="idFix" class="input-group-append d-none">
										<button type="button" id="idFixBtn" class="btn btn-outline-danger">수정</button>
									</div>
		                        </div>
		                        
		                        <div class="mb-3 d-none" id="id_len"><h6>아이디는 4글자 이상 사용해야 합니다.</h6></div>
		                        <div class="mb-3 d-none" id="id_len2"><h6>아이디는 30글자 이하로 사용해야 합니다.</h6></div>
		                        <div class="mb-3 d-none" id="id_fir"><h6>아이디는 영어 소문자로 시작해야 합니다.</h6></div>
		                        <div class="mb-3 d-none" id="id_spe"><h6>아이디에 특수문자는 사용할 수 없습니다.</h6></div>
		                        
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-lock"></i></span>
		                            </div>
		                            <input type="password" class="form-control" placeholder="비밀번호" name="pwd" id="pwd">
		                        </div>
		
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-key"></i></span>
		                            </div>
		                            <input type="password" class="form-control" placeholder="비밀번호 확인" name="pwd2" id="pwd2">
		                        </div>
		
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="fas fa-user-circle"></i></span>
		                            </div>
		                            <input type="text" class="form-control" placeholder="닉네임" name="name" id="name">
		                            <div id="nameFix" class="input-group-append d-none">
										<button type="button" id="nameFixBtn" class="btn btn-outline-danger">수정</button>
									</div>
		                        </div>
		                        
		                        <div class="mb-3 d-none" id="name_len"><h6>닉네임은 2글자 ~ 8글자로 사용해야 합니다.</h6></div>
		                        <div class="mb-3 d-none" id="name_fir"><h6>닉네임에 사용할 수 없는 단어가 있습니다.</h6></div>
		                        
		                        
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
		                            </div>
		                            <input type="text" class="form-control" placeholder="이메일" name="email" id="email">
		                            <div id="emailAuthdDiv" class="input-group-append d-none">
										<button id="emailAuthBtn" type="button" class="btn btn-outline-primary">인증하기</button>
									</div>
									<div id="emailFix" class="input-group-append d-none">
										<button type="button" id="emailFixBtn" class="btn btn-outline-danger">수정</button>
									</div>
		                        </div>
		                        <div id="emailCheckInput" class="input-group mb-3 d-none">
									<div class="input-group-prepend">
		                              <span class="input-group-text">인증키</span>
		                            </div>
		                            <input type="text" class="form-control" placeholder="이메일로 받은 인증키를 입력하세요" name="emailKey" id="emailKey">
		                            <div id="emailKeyBtnDiv" class="input-group-append">
										<button id="emailKeyBtn" type="button" class="btn btn-outline-primary">확인</button>
									</div>
		                        </div>
		                        
								<div id="proBarDiv" class="progress mb-3 d-none">
									<div id="proBar" class="progress-bar bg-info progress-bar-striped progress-bar-animated" style="width:100%"></div>
								</div>	
                        
		                        <div class="mb-3 d-none" id="email_fir"><h6>이메일 형식이 바르지 않습니다.</h6></div>
		                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                        <input type="hidden" id="emailValidation" name="emailValidation" value="" />
		                        <button type="submit" class="btn btn-lg btn-primary w-100">가입하기</button>
		                    </form>
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
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ FORM ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->
    

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

	<!-- =================================================================================================  -->
    <!-- 온로드 이벤트  ajax 아이디 중복확인 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    $(document).ready(function(){
    	
		var validation = 0;
		var nameValidation = 0;
		var emailValidation = 0;
		$('#id').focus();
		
		//버튼에 자동으로 포커스 잡히는걸 막음
		$('button').focus(function(){
	        this.blur();
   		});
    
    
		//======================================================================
	    // $("#id").focus
	  	//======================================================================
	    $("#id").focus(function(){
			//가리기
			//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
			if(!$("#id_len").hasClass("d-none")){$("#id_len").addClass("d-none");}
			//"아이디는 영어 소문자로 시작해야 합니다."
			if(!$("#id_fir").hasClass("d-none")){$("#id_fir").addClass("d-none");}
			//"아이디에 특수문자는 사용할 수 없습니다."
	        if(!$("#id_spe").hasClass("d-none")){$("#id_spe").addClass("d-none");}
		});
	 	//======================================================================
	
	
		//======================================================================
	    // $("#id").keyup
	 	//======================================================================
	 	$("#id").keyup(function(){
	 		
	 	if(validation != 2){
			var str = $("#id").val().toUpperCase();
			var len = $("#id").val().length;
			//특수문자플래그
			var isSpe = false;
			
			if( str == "" ){//글자가 없으면
	    		
	    	}else if( len < 4 ){ //4글자 이하면
	        	
		    		// 1 -> 오류
		        	validation = 1;
		        	
		        	//보이기
		        	//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
		            if($("#id_len").hasClass("d-none")){$("#id_len").removeClass("d-none");}
		            
		            
		            //첫글자가 영문자가 아니면
			    	if( !( 'A'<= str.charAt(0) && 'Z'>= str.charAt(0) ) ){
			    		//보이기
		            	//"아이디는 영어 소문자로 시작해야 합니다."
		                if($("#id_fir").hasClass("d-none")){$("#id_fir").removeClass("d-none");}
			    	}else{
			    		//가리기
			    		//"아이디는 영어 소문자로 시작해야 합니다."
			    		if(!$("#id_fir").hasClass("d-none")){$("#id_fir").addClass("d-none");}
			    	}//if
			    	
			    	//특수문자 존재 여부
			    	for(var i=1; i<len; i++){
	        			if( ( 'A' <= str.charAt(i) && 'Z' >= str.charAt(i) ) || ( '0'<=str.charAt(i) && '9'>=str.charAt(i) ) ){
	        				// 가리기
	        				//"아이디에 특수문자는 사용할 수 없습니다."
	        		        if(!$("#id_spe").hasClass("d-none")){$("#id_spe").addClass("d-none");}
	        			}else{
	        				//보이기
	    	            	//"아이디에 특수문자는 사용할 수 없습니다."
	    	                if($("#id_spe").hasClass("d-none")){$("#id_spe").removeClass("d-none");}
	        			}//if
	        		}//for
	            
	    		}else if( len > 30 ){ //30글자 이상이면
	    			// 1 -> 오류
		        	validation = 1;
		        	
		        	//보이기
		        	//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
		            if($("#id_len2").hasClass("d-none")){$("#id_len2").removeClass("d-none");}
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
	    	                if($("#id_spe").hasClass("d-none")){$("#id_spe").removeClass("d-none");}
		        		}//if
		        		
		        		
		        	}else{
		        		//보이기
		            	//"아이디는 영어 소문자로 시작해야 합니다."
		                if($("#id_fir").hasClass("d-none")){$("#id_fir").removeClass("d-none");}
		                
		        	}//if
		        	
		        	//가리기
		    		//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
		    		if(!$("#id_len").hasClass("d-none")){$("#id_len").addClass("d-none");}
		    		if(!$("#id_len2").hasClass("d-none")){$("#id_len2").addClass("d-none");}
	    		
	        }//if
	 	}//if    
	    });
	 	//======================================================================
		
	 	
	 	//======================================================================
	    // $("#idFixBtn").click
	 	//======================================================================	
	 	$("#idFixBtn").click(function(){
	 		validation = 0;
	 		//id인풋 열기
        	$('#id').removeAttr('readonly');
	 		//id수정 가리기
        	if(!$("#idFix").hasClass("d-none")){$("#idFix").addClass("d-none");}
        	$('#id').val("");
        	$('#id').focus();
	 	});
	 	//======================================================================	
	 		
	 		
	 	//======================================================================
	    // $("#id").blur
	 	//======================================================================
	 	$("#id").blur(function(){
	        if(validation == 1 || validation == 0){
	            //alert("ID를 정확히 입력해주세요");
	            $('#id').focus();
	            
	        }else if(validation==2){
	        	$('#pwd').focus();
	        }else{
	        
	            //Ajax사용
				$.ajax({
	                type : 'POST',
	                url : '/member/checkId/' +$('#id').val() ,
	                //data : "id="+$('#id').val(), //서버로 보내는 파라미터 값
	                dataType:'text', //서버가 보내주는 자료 형태
	                //cache : false,
	                //async : true,
	                beforeSend: function(){
	                	Swal.fire({
	                        title: '잠시만 기다려주세요',
	                        text: '작업중입니다.',
	                        allowOutsideClick: false,
	                        allowEscapeKey: false,
	                        allowEnterKey: false,
	                        onOpen: () => {
	                            swal.showLoading();
	                        }
	                	});
	                },
	                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
	                       		//alert(data);
		                        if(data==="true"){
		                        	swa("error","중복된 아이디 입니다.");
		                            validation = 1;
		                            
		                            $('#id').val("");
		                        	$('#id').focus();
		                            
		                        }else{
		                            //alert("사용가능한 id" );
		                            //$("#id_ok").removeClass("d-none");
		                        	swa("success",'사용가능한 아이디 입니다.');
		                            validation = 2;
		                            
		                          	//id인풋 잠그기
		                        	$('#id').attr('readonly','readonly');
		                        	
		                        	//id수정 보이기
		                        	if($("#idFix").hasClass("d-none")){$("#idFix").removeClass("d-none");}
		                            
		                            $('#pwd').focus();
		                        }//else---
           						}

				});//$.ajax
			}//if
		});
	 	//======================================================================
	 	
	 		
	 	
	 		
	 	//======================================================================
	    // $("#name").keyup
	 	//======================================================================
	 	$("#name").keyup(function(){
	 	if(nameValidation!=2){
			var strName = "123"+$("#name").val();
			var lenName = $("#name").val().length;
			var forbidName = 0;
			var wordItems = ["관리자","admin","운영자"];
			if(lenName < 2 || lenName > 8){ //2글자 이하 8글자 초과
	       	
	    		// 1 -> 오류
	        	nameValidation = 1;
	        	
	        	//보이기
	        	//"닉네임은 2글자 ~ 8글자로 사용해야 합니다."
	            if($("#name_len").hasClass("d-none")){$("#name_len").removeClass("d-none");}
	            
	           
	       	}else{// 2글자 이상 8글자 이하
	       		
	       		wordItems.forEach(function(item){
	       			if(strName.indexOf(item)>0){
	       				forbidName = 1;
	       			}
	       		});
	       	
	       		if(forbidName>0){
	       			//보이기
	       			//닉네임에 사용할 수 없는 단어가 있습니다.
	       			if($("#name_fir").hasClass("d-none")){$("#name_fir").removeClass("d-none");}
	       			
	       			// 1 -> 오류
	            	nameValidation = 1;
	       			
	       		}else{
	       			
	       			//-1 -> 정상
		       		nameValidation = -1;
		        	
		        	//가리기
		    		//"아이디는 영문과 숫자 조합 4~30글자로 입력해주세요."
		    		if(!$("#name_len").hasClass("d-none")){$("#name_len").addClass("d-none");}
		    		if(!$("#name_fir").hasClass("d-none")){$("#name_fir").addClass("d-none");}
	       		}
	        }//if
	 	}
	    });
	 	//======================================================================	
	 	
	 	
	 	//======================================================================
	    // $("#nameFixBtn").click
	 	//======================================================================	
	 	$("#nameFixBtn").click(function(){
	 		nameValidation = 0;
	 		//네임인풋 열기
        	$('#name').removeAttr('readonly');
	 		//네임수정 가리기
        	if(!$("#nameFix").hasClass("d-none")){$("#nameFix").addClass("d-none");}
        	$('#name').val("");
        	$('#name').focus();
	 	});
	 	//======================================================================	
	 	
	 	
 		//======================================================================
	    // $("#name").blur
	 	//======================================================================
 		$("#name").blur(function(){
 			if(nameValidation == -1){
 				
	 			//Ajax사용
				$.ajax({
	                type : 'POST',
	                url : '/member/checkName/' +$('#name').val() ,
	                //data : "id="+$('#id').val(), //서버로 보내는 파라미터 값
	                dataType:'text', //서버가 보내주는 자료 형태
	                //cache : false,
	                //async : true,
	                beforeSend: function(){
	                	Swal.fire({
	                        title: '잠시만 기다려주세요',
	                        text: '작업중입니다.',
	                        allowOutsideClick: false,
	                        allowEscapeKey: false,
	                        allowEnterKey: false,
	                        onOpen: () => {
	                            swal.showLoading();
	                        }
	                	});
	                },
	                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
	                       		//alert(data);
		                        if(data==="true"){
		                        	$('#name').val("");
		                        	swa("error","중복된 닉네임 입니다.");
		                        	nameValidation = 1;
		                            $('#name').focus();
		                            
		                        }else{
		                            //alert("사용가능한 id" );
		                            //$("#id_ok").removeClass("d-none");
		                        	swa("success",'사용가능한 닉네임 입니다.');
		                        	nameValidation = 2;
		                        	
		                        	//네임인풋 잠그기
		                        	$('#name').attr('readonly','readonly');
		                        	
		                        	//네임수정 보이기
		                        	if($("#nameFix").hasClass("d-none")){$("#nameFix").removeClass("d-none");}
		                        	
		                        	$('#email').focus();
		                        }//else---
	       						}
	
				});//$.ajax
			}else if(nameValidation==2){
				$('#email').focus();
			}else{
				//$('#name').focus();
			}
 		});
	 	//======================================================================
	 	
	 		
	 	//======================================================================
	    // $("#email").keyup
	 	//======================================================================
	 	$("#email").keyup(function(){
	 		
	 	if(emailValidation != 2){
	 		if( !isEmail2(document.signUpForm.email) ){
	 			//에러
	 			emailValidation = 1;
	 			//보이기
	 			if($("#email_fir").hasClass("d-none")){$("#email_fir").removeClass("d-none");}
	 			
	 			//인증하기 버튼 가리기
	 			if(!$("#emailAuthdDiv").hasClass("d-none")){$("#emailAuthdDiv").addClass("d-none");}
	 		}else{
	 			//정상
	 			emailValidation = -1;
	 			//가리기
	 			if(!$("#email_fir").hasClass("d-none")){$("#email_fir").addClass("d-none");}
	 			
	 			//인증하기 버튼 보이기
	 			if($("#emailAuthdDiv").hasClass("d-none")){$("#emailAuthdDiv").removeClass("d-none");}
	 			
	 		}
	 	}
	 	});
	 	//======================================================================	
	 	
	 		
	 	//======================================================================
	    // $("#emailAuthBtn").click
	 	//======================================================================
 		$("#emailAuthBtn").click(function(){
 			if(emailValidation==1){
 				//$('#email').focus();
 			}else if(emailValidation==0){
 				
 			}else{
 				//이메일인풋 인증하기 버튼 가리기
	 			if(!$("#emailAuthdDiv").hasClass("d-none")){$("#emailAuthdDiv").addClass("d-none");}
 				
	 			//Ajax사용
				$.ajax({
	                type : 'POST',
	                url : '/member/checkEmail/',
	                data : "email="+$('#email').val(), //서버로 보내는 파라미터 값
	                dataType:'text', //서버가 보내주는 자료 형태
	                //cache : false,
	                //async : true,
	                beforeSend: function(){
	                	Swal.fire({
	                        title: '잠시만 기다려주세요',
	                        text: '작업중입니다.',
	                        allowOutsideClick: false,
	                        allowEscapeKey: false,
	                        allowEnterKey: false,
	                        onOpen: () => {
	                            swal.showLoading();
	                        }
	                	});
	                },
	                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
	                       		//alert(data);
		                        if(data==="true"){
		                        	$('#email').val("");
		                        	swa("error","중복된 이메일 입니다.");
		                        	emailValidation = 1;
		                        	//인증하기 버튼 보이기
		            	 			if($("#emailAuthdDiv").hasClass("d-none")){$("#emailAuthdDiv").removeClass("d-none");}
		                            $('#email').focus();
		                            
		                        }else{
		                            //alert("사용가능한 이메일" );
		                            //$("#id_ok").removeClass("d-none");
		                        	//swa("success",'사용가능한 이메일 입니다.');
		                        	
		                        	emailValidation = 2;
		                        	//이메일인풋 잠그기
		                        	$('#email').attr('readonly','readonly');
		                        	
		                        	
		                        	//이메일수정 보이기
		            	 			if($("#emailFix").hasClass("d-none")){$("#emailFix").removeClass("d-none");}
		                        	
		                        	//이메일 인증키 입력 보이기
		            	 			if($("#emailCheckInput").hasClass("d-none")){$("#emailCheckInput").removeClass("d-none");}
		                        	
		                        	
		                        	//프로그래스바 보이기
		            	 			if($("#proBarDiv").hasClass("d-none")){$("#proBarDiv").removeClass("d-none");}
		            	 			var authTime = + new Date();
		            	 			var nowTime = + new Date();
		                        	var probarV = 180000; //3분
		                        	var probarWarn = 0;
		                        	proValInter = setInterval(function(){
		                    			    		
					                        		nowTime = + new Date();
					                                takeTime = nowTime-authTime;
					                                
		                        					probarV = 180000 - takeTime;
		                    			    		
		                    			    		percentProbarV = (probarV/180000)*100
		                    			    		//console.log(percentProbarV);
		                    			    		
		                    			    		if(probarV<0){
		                    			    			clearInterval(proValInter);
		                    			    			swa("error","제한시간이 초과되었습니다.");
		                    			    			$("#emailFixBtn").trigger("click");
		                    			    		}
		                    			    		
		                    			    		if(percentProbarV<60 && probarWarn == 0){
		                    			    			probarWarn = 1;
		                    			    		}else if(percentProbarV<30 && probarWarn ==2){
		                    			    			probarWarn = 3;
		                    			    		}
		                    			    		
		                    			    		if(probarWarn==1){
		                    			    			$('#proBar').removeClass("bg-info");
		                    			    			$('#proBar').addClass("bg-warning");
		                    			    			probarWarn = 2;
		                    			    		}else if(probarWarn==3){
		                    			    			$('#proBar').removeClass("bg-warning");
		                    			    			$('#proBar').addClass("bg-danger");
		                    			    			probarWarn = 4;
		                    			    		}
		                    			    		
		                    			    		
		                    			    		$('#proBar').css('width',percentProbarV+'%');
		                    			    		$('#proBar').text(msToTime(probarV));
		                    			    		
		                    		    			},100);//setInterval(function(){
		                        	
	           		    			//Ajax사용
	           						$.ajax({
	           			                type : 'POST',
	           			                url : '/member/checkEmailKey',
	           			             	data : "email="+$('#email').val(),
	           			                dataType:'text', //서버가 보내주는 자료 형태
	           			                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
	           			                       		//alert(data);
	           			                			//console.log(data);
	           				                        if(data==="true"){
	           				                        	swa("success","인증키를 발송했습니다.");
	           				                        }else{
	           				                        	swa("error","발송실패 다시 시도해주세요.");
	           				                        	clearInterval(proValInter);
		                    			    			$("#emailFixBtn").trigger("click");
	           				                        }//if
   			       						}//success
	           						});//$.ajax
		                        }//if 사용가능한 메일
					}//success : function(data){
				});//$.ajax
 			}
 		});
	 	//======================================================================
	 	
	 	//======================================================================
	    // $("#emailFixBtn").click
	 	//======================================================================	
	 	$("#emailFixBtn").click(function(){
	 		emailValidation = 0;
	 		clearInterval(proValInter);
	 		$('#proBar').css('width','100%');
	 		if($("#proBar").hasClass("bg-warning")){$("#proBar").removeClass("bg-warning");}
	 		if($("#proBar").hasClass("bg-danger")){$("#proBar").removeClass("bg-danger");}
	 		if(!$("#proBar").hasClass("bg-info")){$("#proBar").addClass("bg-info");}
	 		//인증키 삭제
	 		$('#emailKey').val('');
	 		//인증키 입력 열기
	 		$("#emailKey").removeAttr("readonly");
	 		//인증키 전송 버튼 보이기
	 		if($("#emailKeyBtnDiv").hasClass("d-none")){$("#emailKeyBtnDiv").removeClass("d-none");}
	 		//email인풋 열기
        	$('#email').removeAttr('readonly');
	 		//email수정 가리기
        	if(!$("#emailFix").hasClass("d-none")){$("#emailFix").addClass("d-none");}
	 		//email 인증키 입력 가리기
        	if(!$("#emailCheckInput").hasClass("d-none")){$("#emailCheckInput").addClass("d-none");}
	 		//프로그래스바 가리기
        	if(!$("#proBarDiv").hasClass("d-none")){$("#proBarDiv").addClass("d-none");}
        	//이메일인풋 인증하기 버튼 보이기
        	if($("#emailAuthdDiv").hasClass("d-none")){$("#emailAuthdDiv").removeClass("d-none");}
        	//emailValidation 변경
	 		$('#emailValidation').val('');
        	$('#email').val("");
        	$('#email').focus();
	 	});
	 	//======================================================================		
	 		
	 		
	 		
	 	//======================================================================		
	 	// $('#emailKeyBtn').click	
	 	//======================================================================		
	 	$('#emailKeyBtn').click(function(){
	 		
	 		if($("#emailKey").val()=="" || $("#emailKey").val().length ==0){
	 			swa("error","인증키를 입력해주세요.");
	 			$("#emailKey").val('');
	 			$("#emailKey").focus();
	 		}//if
	 		
	 		
	 		//Ajax사용
			$.ajax({
                type : 'POST',
                url : '/member/authEmailKey',
                data : "email="+$('#email').val() + "&authEmailKey="+$("#emailKey").val(),
                dataType:'text', //서버가 보내주는 자료 형태
                beforeSend: function(){
                	Swal.fire({
                        title: '잠시만 기다려주세요',
                        text: '작업중입니다.',
                        allowOutsideClick: false,
                        allowEscapeKey: false,
                        allowEnterKey: false,
                        onOpen: () => {
                            swal.showLoading();
                        }
                	});
                },
                success : function(data){//서버가 보내준 데이터를 클라이언트 반영
                       		//alert(data);
	                        if(data==="true"){
	                        	swa("success","인증되었습니다.");
	                        	//키인풋 잠그기
	                        	$('#emailKey').attr('readonly','readonly');
	                        	//키인풋 확인 버튼 가리기
	                        	if(!$("#emailKeyBtnDiv").hasClass("d-none")){$("#emailKeyBtnDiv").addClass("d-none");}
	                        	//프로그레스바 숨기기
	                        	if(!$("#proBarDiv").hasClass("d-none")){$("#proBarDiv").addClass("d-none");}
	                        	clearInterval(proValInter);
	                	 		$('#proBar').css('width','100%');
	                	 		if($("#proBar").hasClass("bg-warning")){$("#proBar").removeClass("bg-warning");}
	                	 		if($("#proBar").hasClass("bg-danger")){$("#proBar").removeClass("bg-danger");}
	                	 		if(!$("#proBar").hasClass("bg-info")){$("#proBar").addClass("bg-info");}
	                	 		
	                	 		//emailValidation 변경
	                	 		$('#emailValidation').val('ok');
	                        	
	                        }else{
	                        	swa("error","잘못된 인증키입니다. 다시 입력해주세요.");
	                        	$("#emailKey").val('');
	            	 			$("#emailKey").focus();
       						}//if
               			}//success : function(data){
			});//$.ajax
	 	
 		});	
	 	//======================================================================		
	 	
    });//$(document).ready(function()
 	</script>
   	<!-- =================================================================================================  -->
   	<!-- end 온로드 이벤트  ajax 아이디 중복확인 -->
   	<!-- =================================================================================================  -->
		
		
		
		
   	<!-- =================================================================================================  -->
   	<!-- 일반펑션 -->
   	<!-- =================================================================================================  -->
 	<script type="text/javascript">	
	 	//======================================================================
	    // 유효성 검사 check9()
	 	//======================================================================
	 	function check9(ff){
	 		
	 		if(!isID(ff.id)){
	 			ff.id.focus();
	 			return false;
	 		}//if
	 		
	 		if(!isSame(ff.pwd,ff.pwd2)){
	 			ff.pwd.value="";
	 			ff.pwd2.value="";
	 			ff.pwd.focus();
	 			return false;
	 		}
	 		
	 		if(!isNull(ff.name,"이름을 입력하세요")){
	 			//ff.name.focus();
	 			setTimeout(ff.name.focus(),10);
	 			return false;
	 		}//if
	 		
	 		if(!isEmail(ff.email)){
	 			ff.email.focus();
	 			return false;
	 		}//if
	 		
	 		if($('#emailValidation').val()=="" || $('#emailValidation').val().length ==0){
	 			
	 			swa("error","이메일 인증을 해주세요.");
	 			return false;
	 		}
	 		
	 	}//check9()
	 	//======================================================================
	 		
				 		
	 		
	 	//======================================================================
	 	// 밀리초 변환
	 	//======================================================================
	 	function msToTime(duration) {
	        var seconds = parseInt((duration/1000)%60)
	            , minutes = parseInt((duration/(1000*60))%60);
	
	        minutes = minutes;
	        seconds = (seconds < 10) ? "0" + seconds : seconds;

        return minutes + ":" + seconds;
    	}
	 	//======================================================================
	 		
	 		
	 		
	 	//======================================================================
	 	// 유효성검사 펑션들
	 	//======================================================================
	 	//======================================================================
	 	function isNull(obj, msg){
	 	    if(obj.value==""){
	 	        
	 	        if(msg){
	 	        	swa("error",msg);
	 	        }//if
	 	        
	 	        return false;//입력이 안되었으면 false
	 	    }
	 	    return true;//입력이 되었으면 true
	 	}//isNull end -----------------------------
	 	
	 	function isID(obj){
	 	    
	 	    var str2=obj.value;
	 	    if(str2.length==0){
	 	    	swa("error","아이디를 입력하세요");
	 	        return false;
	 	    }//if
	 	    str2=str2.toUpperCase();//대문자로 변환 ,A~Z, a~z
	 	    
	 	    //ID 첫글자가 영문자 이어야한다
	 	    if(!('A'<=str2.charAt(0) && 'Z'>=str2.charAt(0))){ 
	 	    	swa("error","첫글자를 영문자로 입력하세요");
	 	        return false;
	 	    }//if

	 	    for(var i=1; i<str2.length; i++){
	 	        if( !( ('A'<=str2.charAt(i) && 'Z'>=str2.charAt(i)) || ('0'<=str2.charAt(i) && str2.charAt(i)<='9') ) ) {
	 	        	console.log(str2.charAt(i));
	 	            swa("error","영문자, 숫자만 사용가능합니다.");
	 	            return false;
	 	        }//if
	 	    }//for
	 	    return true;
	 	}//isID
	 	
	 	function isEmail2(obj){
			var str=obj.value;
	 	    
			if(str.length>100){
				return false;
			}
			
	 	    if(str==""){
	 	        return false;
	 	    }//if
	 	    
	 	    var i=str.indexOf("@");
	 	    if(i<0){
	 	        return false;
	 	    }
	 	    
	 	    i=str.indexOf(".");
	 	    if(i<0){
	 	        return false;
	 	    }
	 	    return true;
	 	}//isEmai2l() end
	 	
	 	function isEmail(obj){
	 	    var str=obj.value;
	 	    
	 	   if(str.length>100){
	 		  	swa("error","이메일 주소가 너무 깁니다.");
				return false;
			}
	 	    
	 	    if(str==""){
	 	    	swa("error","이메일 주소를 입력하세요");
	 	        return false;
	 	    }//if
	 	    
	 	    var i=str.indexOf("@");
	 	    if(i<0){
	 	    	swa("error","올바르지 않은 이메일 형식입니다.");
	 	        return false;
	 	    }
	 	    
	 	    i=str.indexOf(".");
	 	    if(i<0){
	 	    	swa("error","올바르지 않은 이메일 형식입니다.");
	 	        return false;
	 	    }
	 	    return true;
	 	    
	 	}//isEmail() end
	 	
	 	function isSame(ob1,ob2){
	 	    var str1=ob1.value;
	 	    var str2=ob2.value;
	 	    
	 	    if(str1.length==0 || str2.length==0){
	 	    	swa("error","암호를 입력하세요");
	 	        return false;
	 	    }
	 	    
	 	    if(str1 != str2){
	 	    	swa("error","암호가 일치하지 않습니다");
	 	        return false;
	 	    }
	 	    return true;
	 	}
	 	
	 	
	 	//======================================================================
	 		
	</script>
    <!-- =================================================================================================  -->
    <!-- 일반펑션 -->
    <!-- =================================================================================================  -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
