<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>

<script src="/resources/ckeditor/ckeditor.js"></script>
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1 bg-info">
		            </div>
		            
		            <div class="center_area col-lg-10" >
		            	<div class="heading pb-4">
		                	<h1>${b_name2} 게시판 글쓰기</h1>
		                </div>
		                <form action="/board/register" method="post">
			                <div class="form-group">
	                   			<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요."/>
	                		</div>
	                		
	                		<!-- 
	                		<div class="form-group">
							  <textarea class="form-control" rows="10" id="content" placeholder="내용을 입력해주세요."></textarea>
							</div>
							 -->
							<textarea class="form-control" id="ck_content" name="content"></textarea>
							


	                		<div class="text-right">
				                <button type="button" class="btn btn-outline-secondary text-center mx-1" onclick="javascript:window.history.back();">돌아가기</button>
				                <button type="submit" class="btn btn-primary text-center mx-1">등록</button>
			                </div>
			                
			                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			                <input type="hidden" name="id" value='<sec:authentication property="principal.username"/>' />
			                <input type="hidden" name="b_name" value="${b_name}" />
		                </form>
		            </div>
		            
		            <div class="right_area col-lg-1 bg-info">
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
<script type="text/javascript">
CKEDITOR.replace('ck_content', {
				height: 500
				});
</script>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
