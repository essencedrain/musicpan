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
	            
	            	<div class="left_area col-lg-1 bg-info">
		            </div>
		            
		            
		            <div class="center_area col-lg-10" >
		            	<!-- =================================================================================================  -->
						<!-- start 컨텐츠  -->
						<!-- =================================================================================================  -->
		            	<div class="heading pb-4">
		                	<h1>${cri.b_name2} 게시판 컨텐츠</h1>
		                </div>
		            	<div class="mt-4">
		            		<table class="table table-sm table-bordered">
			            		<tr>
			            			<td>${board.title}</td>
			            		</tr>
			            		
			            		<tr>
			            			<td>글쓴이 : ${board.name}</td>
			            		</tr>
			            		
			            		<tr>
			            			<td>등록일 : <fmt:formatDate pattern="yyyy.MM.dd HH:MM:ss" value="${board.regdate}" /> / 조회수 : ${board.hit}</td>
			            		</tr>
			            		
			            		<tr>
			            			<td>${board.content}</td>
			            		</tr>
		            		</table>
		            		<div class="float-right mt-3">
		            			<button data-oper='delete' class="btn btn-outline-secondary text-center">삭제하기</button>
								<button data-oper='modify' class="btn btn-outline-secondary text-center">수정하기</button>
								<button data-oper='list' class="btn btn-primary text-center">목록으로</button>
		            		</div>
	            		</div>    
		            	<!-- =================================================================================================  -->
						<!-- end 컨텐츠  -->
						<!-- =================================================================================================  -->
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
<form id='operForm' action="/board/" method="get">
  <input type='hidden' id='bno' name='bno' value='${board.bno}'>
  <input type='hidden' name='pageNum' value='${cri.pageNum}'>
  <input type='hidden' name='amount' value='${cri.amount}'>
  <input type='hidden' name='keyword' value='${cri.keyword}'>
  <input type='hidden' name='type' value='${cri.type}'>  
  <input type='hidden' name='b_name' value='${cri.b_name}'>  
</form>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->
<script type="text/javascript">
$(document).ready(function(){
	
	var operForm = $("#operForm");
	
	$("button[data-oper='modify']").on("click", function(e){
		operForm.attr("action","/board/modify");
		operForm.submit();
	});
	  
	$("button[data-oper='list']").on("click", function(e){
		operForm.find("#bno").remove();
	    operForm.attr("action","/board/${cri.b_name}/list")
	    operForm.submit();
	}); 
	
});//$(document).ready(function(){
</script>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
