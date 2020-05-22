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
		                        </div>
		                        
		                        <div class="mb-3 d-none" id="id_len"><h6>아이디는 4글자 이상 사용해야 합니다.</h6></div>
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
		                        </div>
		                        <div class="input-group mb-3">
		                            <div class="input-group-prepend">
		                              <span class="input-group-text"><i class="far fa-envelope"></i></span>
		                            </div>
		                            <input type="text" class="form-control" placeholder="이메일" name="email" id="email">
		                        </div>
		                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
    		
	        }//if
	        
	    });
	 	//======================================================================
		
	 	//======================================================================
	    // $("#id").blur
	 	//======================================================================
	 	$("#id").blur(function(){
	        if(validation > -1){
	            //alert("ID를 정확히 입력해주세요");
	            $('#id').focus();
	            
	        }else{
	        
	            //Ajax사용
				$.ajax({
	                type : 'POST',
	                url : '/member/checkId/' +$('#id').val() ,
	                //data : "id="+$('#id').val(), //서버로 보내는 파라미터 값
	                dataType:'text', //서버가 보내주는 자료 형태
	                //cache : false,
	                //async : true,
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
		                            validation = -1;
		                        }//else---
           						}

				});//$.ajax
			}//if
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
	 		
	 	}//check9()
	 	//======================================================================
	 		
				 		
	 		
	 	//======================================================================
	 	// 유효성검사 펑션들
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
	 	
	 	function isEmail(obj){
	 	    var str=obj.value;
	 	    
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
