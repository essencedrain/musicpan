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
		            
		            
		            <div class="center_area col-lg-10 content_area" >
		            	<!-- =================================================================================================  -->
						<!-- start 컨텐츠  -->
						<!-- =================================================================================================  -->
		            	<div class="pb-3">
		                	<h3 class="board_heading"><a href="/board/${cri.b_name}/list">${cri.b_name2} 게시판</a></h3>
		                </div>
		            	<div class="mt-3 pb-5">
		            		<div class="mb-2">
		            			<span class="content_heading">${board.title}</span>
		            		</div>
		            		<table class="table table-sm table-borderless">
			            		
			            		<hr class="hr1"/>
			            		<tr>
			            			<td class="tdcolor_1">
				            			<img src="/resources/level_icon/${board.grade}.gif">
				            			&nbsp;${board.name}&nbsp;&nbsp;&nbsp;&nbsp;<span class="content_gray_small"><i class="far fa-clock"></i>&nbsp;<fmt:formatDate pattern="yyyy.MM.dd HH:MM:ss" value="${board.regdate}" /></span>
			            			</td>
			            		</tr>
			            		
			            		<tr>
			            			<td class="content_main_td"><i class="fas fa-link content_gray"></i>&nbsp;<span class="content_gray_small"><a href="/board/${cri.b_name}/content/${board.bno}">/board/${cri.b_name}/content/${board.bno}</a></span></td>
			            		</tr>
			            		
			            		<tr>
			            			<td class="py-5">${board.content}</td>
			            		</tr>
		            		</table>
		            		<div class="float-right mt-2">
		            			<sec:authentication property="principal" var="pinfo"/>
		            			 <sec:authorize access="isAuthenticated()">
			            			 <c:if test="${pinfo.username eq board.id}">
				            			<button data-oper='delete' class="btn btn-outline-secondary btn-sm text-center">삭제하기</button>
										<button data-oper='modify' class="btn btn-outline-secondary btn-sm text-center">수정하기</button>
			            			 </c:if>
		            			 </sec:authorize>
								<button data-oper='list' class="btn btn-outline-primary btn-sm text-center">목록으로</button>
		            		</div>
	            		</div>
	            		<hr class="hr2"/> 
		            	<!-- =================================================================================================  -->
						<!-- end 컨텐츠  -->
						<!-- =================================================================================================  -->
						
						<!-- =================================================================================================  -->
						<!-- start 댓글  -->
						<!-- =================================================================================================  -->
						<div class="reply_area">
							<div class="card_area">
								<div class="card mb-2">
									<div class="card-header py-1 pl-3">
										<div class="d-flex justify-content-end">
											<img src="/resources/level_icon/${board.grade}.gif">
											<span class="card-user-name">야돈</span>
											<span class="card-user-time ml-auto">2020-05-27 12:12:12</span>
										</div>
									</div>
									<div class="card-body pt-1 pb-3 pl-3">
									    <p class="card-text">With supporting text below as a natural lead-in to additional content. 신종금융사기! 스미싱 주의바랍니다!!</p>
									</div>
								</div>
								
								<div class="card mb-2 ml-4">
									<div class="card-header py-1 pl-3">
										<div class="d-flex justify-content-end">
											<img src="/resources/level_icon/${board.grade}.gif">
											<span class="card-user-name">야돈</span>
											<span class="card-user-time ml-auto">2020-05-27 12:12:12</span>
										</div>
									</div>
									<div class="card-body pt-1 pb-3 pl-3">
									    <p class="card-text">With supporting text below as a natural lead-in to additional content. 신종금융사기! 스미싱 주의바랍니다!!</p>
									</div>
								</div>
							</div>
							<div class="form-group mb-2">
								<textarea class="form-control" id="reply_textarea"></textarea>
							</div>
							<div class="d-flex justify-content-end">
								<button class="btn btn-outline-secondary btn-sm text-center">등록</button>
								<button class="btn btn-outline-secondary btn-sm text-center ml-2">등록+추천</button>
							</div>
						</div>
						<!-- =================================================================================================  -->
						<!-- end 댓글  -->
						<!-- =================================================================================================  -->
						
						<!-- =================================================================================================  -->
						<!-- start 목록  -->
						<!-- =================================================================================================  -->
						<div class="mt-4 pb-3">
		                	<h3 class="board_heading"><a href="/board/${pageMaker.cri.b_name}/list">${pageMaker.cri.b_name2} 게시판</a></h3>
		                </div>
		            	<div class="mt-3">
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
                    				<c:forEach items="${list}" var="board2">
		                    			<tr>
		                    				<td class="list_rowNum ${board.bno==board2.bno?"text-primary":"text-secondary"}" style="width: 5%;">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":rowNum}</td>
	                    					<td style="width: 65%;" class="text-left list_else ${board.bno==board2.bno?"text-primary":"" }">
	                    						<a class="move" href="${board2.bno}">
					                        		${board2.title}
					                        	</a>
	                    					</td>
					                        <td style="width: 15%;" class="text-left list_else"><img src="/resources/level_icon/${board2.grade}.gif"> ${board2.name}</td>
					                        <td style="width: 10%;" class="list_else"><fmt:formatDate pattern="yyyy.MM.dd" value="${board2.regdate}" /></td>
					                        <td style="width: 5%;" class="list_else">${board2.hit}</td>
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
						<!-- =================================================================================================  -->
						<!-- end 목록  -->
						<!-- =================================================================================================  -->
		            </div>
		            
		            
		            <div class="right_area col-lg-1 ">
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
  <input type='hidden' name='id' value='${board.id}'>
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
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
			operForm.attr("action","/board/update");
			operForm.submit();
		});
		  
		$("button[data-oper='list']").on("click", function(e){
			operForm.find("#bno").remove();
		    operForm.attr("action","/board/${cri.b_name}/list")
		    operForm.submit();
		}); 
		
		$("button[data-oper='delete']").on("click", function(e){
			Swal.fire({
				  title: '정말 삭제하시겠습니까?',
				  text: "삭제된 글은 복구가 어렵습니다.",
				  icon: 'warning',
				  showCancelButton: true,
				  confirmButtonColor: '#007bff',
				  cancelButtonColor: '#d33',
				  confirmButtonText: '삭제',
				  cancelButtonText: '취소'
				}).then((result) => {
				  if (result.value) {
				    //삭제처리시작
				  	operForm.attr("action","/board/delete");
				  	operForm.attr("method","post");
					operForm.submit();
				  }
				})
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
