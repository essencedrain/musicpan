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
			            <div class="heading pb-4">
		                	<h1>${pageMaker.cri.b_name2} 게시판</h1>
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
                    				<c:forEach items="${list}" var="board">
		                    			<tr>
		                    				<td style="width: 5%;">${board.bno}</td>
	                    					<td style="width: 60%;" class="text-left">
	                    						<a class="move" href="${board.bno}">
					                        		${board.title}
					                        	</a>
	                    					</td>
					                        <td style="width: 20%;">${board.name}</td>
					                        <td style="width: 10%;"><fmt:formatDate pattern="yyyy.MM.dd" value="${board.regdate}" /></td>
					                        <td style="width: 5%;">${board.hit}</td>
		                    			</tr>
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
							<button type="button" class="btn btn-primary text-center float-right mt-n4" onclick="location.href='/board/register?b_name=${pageMaker.cri.b_name}'">글쓰기</button>
		            	</div>
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
<form id='actionForm' action="/board/${pageMaker.cri.b_name}/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
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
		$("#actionForm").attr("action","/board/${pageMaker.cri.b_name}/content");
		$("#actionForm").submit();
	});//$('.move').on('click',function(e){
		
		
});//$(document).ready(function(){
</script>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
