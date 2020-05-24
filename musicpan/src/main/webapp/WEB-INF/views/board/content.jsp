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
		                	<h1><a href="/board/${cri.b_name}/list">${cri.b_name2} 게시판</a></h1>
		                </div>
		            	<div class="mt-4 pb-5">
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
		            		<div class="float-right mt-2">
		            			<sec:authentication property="principal" var="pinfo"/>
		            			 <sec:authorize access="isAuthenticated()">
			            			 <c:if test="${pinfo.username eq board.id}">
				            			<button data-oper='delete' class="btn btn-outline-secondary text-center">삭제하기</button>
										<button data-oper='modify' class="btn btn-outline-secondary text-center">수정하기</button>
			            			 </c:if>
		            			 </sec:authorize>
								<button data-oper='list' class="btn btn-primary text-center">목록으로</button>
		            		</div>
	            		</div>    
		            	<!-- =================================================================================================  -->
						<!-- end 컨텐츠  -->
						<!-- =================================================================================================  -->
						<!-- =================================================================================================  -->
						<!-- start 목록  -->
						<!-- =================================================================================================  -->
						<div class="mt-4 pb-4">
		                	<h1><a href="/board/${pageMaker.cri.b_name}/list">${pageMaker.cri.b_name2} 게시판</a></h1>
		                </div>
		            	<div class="mt-4">
		            		<table class="table table-sm table-hover table_gtx">
		            			<thead class="text-center">
			            			<tr>
				                        <th style="width: 5%;">번호</td>
				                        <th style="width: 60%;">제목</td>
				                        <th style="width: 20%;">글쓴이</td>
				                        <th style="width: 10%;">등록일</td>
				                        <th style="width: 5%;">조회수</td>
				                    </tr>
			                    </thead>
                    			<tbody class="text-center">
                    				<c:set var="rowNum" value="${pageMaker.startRow}"/>
                    				<c:forEach items="${list}" var="board2">
		                    			<tr>
		                    				<td class="${board.bno==board2.bno?"text-primary":""}" style="width: 5%;">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":rowNum}</td>
	                    					<td style="width: 60%;" class="text-left ${board.bno==board2.bno?"text-primary":"" }">
	                    						<a class="move" href="${board2.bno}">
					                        		${board2.title}
					                        	</a>
	                    					</td>
					                        <td style="width: 20%;">${board2.name}</td>
					                        <td style="width: 10%;"><fmt:formatDate pattern="yyyy.MM.dd" value="${board2.regdate}" /></td>
					                        <td style="width: 5%;">${board2.hit}</td>
		                    			</tr>
		                    		<c:set var="rowNum" value="${rowNum-1}"/>
	                    			</c:forEach>
                    			</tbody>
		            		</table>
							<ul class="pagination justify-content-center">
								
								<c:choose>
									<c:when test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1}">이전</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								  	<li class="page-item ${num==pageMaker.cri.pageNum ? "active" : ""}">
								  		<a class="page-link" href="${num}">${num}</a>
							  		</li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${pageMaker.next}">
										<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">다음</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
		            	</div>
						<!-- =================================================================================================  -->
						<!-- end 목록  -->
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
  <!--  <input type='hidden' name='amount' value='${cri.amount}'>-->
  <input type='hidden' name='keyword' value='${cri.keyword}'>
  <input type='hidden' name='type' value='${cri.type}'>  
  <input type='hidden' name='b_name' value='${cri.b_name}'>  
</form>
<form id='actionForm' action="/board/${pageMaker.cri.b_name}/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<!--<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>-->
	<input type='hidden' name='b_name' value='${pageMaker.cri.b_name}'>
	<input type='hidden' name='type' value='${ pageMaker.cri.type }'>
	<input type='hidden' name='keyword' value='${ pageMaker.cri.keyword }'>
</form>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->
	<!-- =================================================================================================  -->
    <!-- start content 페이지 이동 -->
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
    <!-- end content 페이지 이동 -->
    <!-- =================================================================================================  -->
	<!-- =================================================================================================  -->
    <!-- start list 페이지 이동 -->
    <!-- =================================================================================================  -->
	<script type="text/javascript">
	$(document).ready(function(){
		
		$('.page-item a').on('click',function(e){
			e.preventDefault();
			$("#actionForm").find("input[name='pageNum']").val( $(this).attr("href") );
			$("#actionForm").submit();
		});//$('.page_button a').on('click',function(e){
		
			
		$('.move').on('click',function(e){
			e.preventDefault();
			$("#actionForm").append("<input type='hidden' name='bno' value='"+ $(this).attr("href") + "'>");
			$("#actionForm").attr("action","/board/content");
			$("#actionForm").submit();
		});//$('.move').on('click',function(e){
			
			
	});//$(document).ready(function(){
	</script>
	<!-- =================================================================================================  -->
    <!-- end list 페이지 이동 -->
    <!-- =================================================================================================  -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
