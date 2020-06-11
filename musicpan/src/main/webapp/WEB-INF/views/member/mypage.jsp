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
	            
	            	<div class="left_area col-md-2">
		            </div>
		            
		            <div class="center_area col-md-8" >
		            	<div class="heading pb-4">
		                	<h1>마이페이지</h1>
		                </div>
		                <table class="table">
		                	<tr>
						        <td>아이디</td>
						        <td>${vo.id}</td>
				      		</tr>
		                	<tr>
						        <td>비밀번호</td>
						        <td><button type="button" class="btn btn-sm btn-outline-secondary" data-toggle="modal" data-target="#pwdModal">비밀번호변경</button></td>
				      		</tr>
				      		<tr>
						        <td>닉네임</td>
						        <td>${vo.name}</td>
					      	</tr>
					      	<tr>
						        <td>이메일</td>
						        <td>${vo.email}</td>
					      	</tr>
					      	<tr>
						        <td>가입일</td>
						        <td>${vo.regDateString}</td>
					      	</tr>
					      	<tr>
						        <td>최종 접속일</td>
						        <td>${vo.updatedateString}</td>
					      	</tr>
					      	<tr>
						        <td>레벨</td>
						        <td>
						        	<h6>Level: ${vo.level}</h6>
						        	<div class="progress">
								    	<div class="progress-bar" style="width:${vo.expPercent}%">${vo.expPercent}%</div>
									</div>
						        	<span>${vo.gradeString} / ${vo.nextExpString}</span>
						        </td>
					      	</tr>
		                </table>
		            </div>
		            
		            <div class="right_area col-md-2">
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
    <!-- start 비번변경 모달  -->
    <!-- =================================================================================================  -->
	<div class="modal fade" id="pwdModal" tabindex="-2" role="dialog" aria-labelledby="pwdModalTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="pwdModalCenterTitle">비밀번호변경</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
        		<table class="mx-auto">
        			<tr>
        				<td>현재 비밀번호&nbsp;</td>
        				<td><input type="password" name="recentPwd" id="recentPwd"></td>
        			</tr>
        			<tr>
        				<td>신규 비밀번호&nbsp;</td>
        				<td><input type="password" name="newPwd" id="newPwd"></td>
        			</tr>
        			<tr>
        				<td>비밀번호 확인&nbsp;</td>
        				<td><input type="password" name="checkPwd" id="checkPwd"></td>
        			</tr>
        		</table>
        		
        		<sec:authorize access="isAuthenticated()">
        		<sec:authentication property="principal" var="pinfo"/>
        			<input type="hidden" name="m_id" id="m_id" value="${pinfo.username}">
        		</sec:authorize>
        		<div class="button-group my-2 text-center">
                <button type="button" class="btn btn-primary mx-1" onclick="changePwd()">변경하기</button>
                <button type="button" class="btn btn-outline-secondary mx-1" data-dismiss="modal">취소하기</button>
            </div>
        </div>
      </div>
    </div>
  </div>
  <!-- =================================================================================================  -->
  <!-- end 비번변경 모달  -->
  <!-- =================================================================================================  -->
	
<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ FORM ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

<script type="text/javascript">
//==========================================================================================================
// changePwd() 비밀번호 변경 ajax
//==========================================================================================================
function changePwd(){
	
	if($("#newPwd").val()==$("#checkPwd").val()){
		if($("#recentPwd").val()!=$("#checkPwd").val()){
			//Ajax사용
		    $.ajax({
		        type : 'POST'
		        ,url : '/member/changePassword'
		        ,data : "m_id="+$('#m_id').val()+"&recentPwd="+$('#recentPwd').val()+"&newPwd="+$('#newPwd').val() //서버로 보내는 파라미터 값
		        ,dataType:'text' //서버가 보내주는 자료 형태
		        ,beforeSend: function(){
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
	            }
		        ,success : function(data){//서버가 보내준 데이터를 클라이언트 반영
		        							
			            if(data==-1){
			            	swa("error","현재 비밀번호가 틀렸습니다.");
			            	$('#recentPwd').val('');
			            }else if(data==0){
			            	swa("error","비밀번호 변경중 에러 발생");
			            	$('#recentPwd').val('');
			            	$('#newPwd').val('');
			            	$('#checkPwd').val('');
			            }else if(data==1){
			            	swa("success",'비밀번호가 변경되었습니다.');
			            	setTimeout(function(){location.href="/mypage"},1200);
			            }//if
					}
				});//ajax
			}else{
				swa("error","변경하려는 비밀번호가 기존 비밀번호와 같습니다.");
            	$('#newPwd').val('');
            	$('#checkPwd').val('');
			}//if
	}else{
		swa("error","비밀번호 확인값이 다릅니다.");
    	$('#newPwd').val('');
    	$('#checkPwd').val('');
	}//if
	
}
//==========================================================================================================
</script>

<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
