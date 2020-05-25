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
		            <!-- 배너
		            <div class="floatdiv floatdiv_left">
						<ul>
							<a href='#' target='_blank'>
							<img src='/resources/temp/banner.png' /></a>
						</ul>
					</div>
					 -->
		            
		            <div class="center_area col-lg-10" >
			            <div class="pb-3">
		                	<h3 class="board_heading"><a href="/board/${pageMaker.cri.b_name}/list">${pageMaker.cri.b_name2} 게시판</a></h3>
		                </div>
		            	<div class="mt-3">
		            		<sec:authorize access="isAuthenticated()">
			            		<div class="py-2 d-flex justify-content-end">
				            		<button type="button" class="btn btn-outline-primary btn-sm text-center" onclick="location.href='/board/register?b_name=${pageMaker.cri.b_name}'">글쓰기</button>
			            		</div>
		            		</sec:authorize>
		            		<table class="table table-sm table-hover table_gtx">
		            			<thead class="text-center">
			            			<tr>
				                        <th style="width: 5%;">번호</td>
				                        <th style="width: 65%;">제목</td>
				                        <th style="width: 15%;">글쓴이</td>
				                        <th style="width: 10%;">등록일</td>
				                        <th style="width: 5%;">조회수</td>
				                    </tr>
			                    </thead>
                    			<tbody class="text-center">
                    				<c:set var="rowNum" value="${pageMaker.startRow}"/>
                    				<c:forEach items="${list}" var="board">
		                    			<tr>
		                    				<td style="width: 5%;" class="list_rowNum">${rowNum}</td>
	                    					<td style="width: 65%;" class="text-left list_else">
	                    						<a class="move" href="${board.bno}">
					                        		${board.title}
					                        	</a>
	                    					</td>
					                        <td style="width: 15%;" class="text-left list_else list_grade"><img src="/resources/level_icon/${board.grade}.gif"> ${board.name}</td>
					                        <td style="width: 10%;" class="list_else"><fmt:formatDate pattern="yyyy.MM.dd" value="${board.regdate}" /></td>
					                        <td style="width: 5%;" class="list_else">${board.hit}</td>
		                    			</tr>
		                    		<c:set var="rowNum" value="${rowNum-1}"/>
	                    			</c:forEach>
                    			</tbody>
		            		</table>
		            		<sec:authorize access="isAuthenticated()">
			            		<div class="py-2 d-flex justify-content-end">
				            		<button type="button" class="btn btn-outline-primary btn-sm text-center" onclick="location.href='/board/register?b_name=${pageMaker.cri.b_name}'">글쓰기</button>
			            		</div>
		            		</sec:authorize>
							<ul class="pagination justify-content-center pagination-sm">
								
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
		            </div>
		            
		            
		            <div class="right_area col-lg-1 ">
	           	 	</div>
	           	 	
	           	 	<!--배너 
	           	 	<div class="floatdiv floatdiv_right">
						<ul>
							<a href='#' target='_blank'>
							<img src='/resources/temp/banner.png' /></a>
						</ul>
					</div>
					 -->
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
<form id='actionForm' action="/board/${pageMaker.cri.b_name}/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<!-- <input type='hidden' name='amount' value='${pageMaker.cri.amount}'> -->
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
