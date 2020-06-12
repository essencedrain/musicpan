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
	            
	            	<div class="left_area col-lg-1 ">
		            </div>
		            
		            <div class="center_area col-lg-10" >
		            	<div class="heading pb-4">
		            		<h3 class="board_heading"><a href="/board/${cri.b_name}/list">${cri.b_name2} 게시판 [댓글수정]</a></h3>
		                </div>
		                <form action="/board/replyPro" method="post" id="replyModiForm">
	                		
	                		<div class="form-group">
							  <textarea id="replyModifyTextarea" class="form-control" rows="5" name="reply">${reply}</textarea>
							</div>


	                		<div class="text-right mt-2">
				                <button type="button" class="btn btn-outline-secondary text-center mx-1" onclick="location.href='/board/${cri.b_name}/content/${cri.bno}'">돌아가기</button>
				                <button type="button" id="replyModifySubmitBtn" class="btn btn-primary text-center mx-1">등록</button>
			                </div>
			                <input type='hidden' name='pageNum' value='${cri.pageNum}'>
			                <input type="hidden" name="id" value='<sec:authentication property="principal.username"/>' />
			                <input type="hidden" name="b_name" value="${cri.b_name}" />
			                <input type="hidden" name="bno" value="${cri.bno}" />
			                <input type="hidden" name="rno" value="${rno}" />
			                <input type="hidden" name="replyPage" value="${replyPage}" />
							<input type='hidden' name='keyword' value='${cri.keyword}'>
							<input type='hidden' name='type' value='${cri.type}'>  
			                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                </form>
		            </div>
		            
		            <div class="right_area col-lg-1 ">
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
	<!-- 수정처리 -->
    <!-- =================================================================================================  -->
    <script>
    $(document).ready(function(){
    	$('#replyModifySubmitBtn').on("click", function(e){
    		e.preventDefault();
    		var oriStr=$('#replyModifyTextarea').val();
    		
    		if($.trim(oriStr) =="" || $.trim(oriStr).length ==0){
    			swa("error","댓글 내용을 작성해주세요");
    			return;
    		}
    		
    		//댓글내용에 html 제거
    		oriStr = oriStr.replace(/(<([^>]+)>)/ig,"");
    		
    		if(oriStr.length > 1500){
    			swa("error","댓글은 1500자까지 입력가능합니다 (현재 : "+oriStr.length+"자)");
				return;
    		}
    		
    		oriStr = oriStr.replace(/(?:\r\n|\r|\n)/g, '<br />');
    		
    		$('#replyModifyTextarea').val(oriStr);
    		$('#replyModiForm').submit();
    	});
    });
    </script>
	<!-- =================================================================================================  -->
	<!-- 수정처리 -->
    <!-- =================================================================================================  -->
    
    
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
