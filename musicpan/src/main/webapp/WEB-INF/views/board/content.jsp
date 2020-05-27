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
										<div class="d-flex">
											<img src="/resources/level_icon/${board.grade}.gif">
											<span class="card-user-name">야돈</span>
											<span class="card-user-time ml-auto">2020-05-27 12:12:12</span>
										</div>
									</div>
									<div class="card-body pt-1 pb-3 pl-3">
									    <div class="card-text">ㅋㅋㅋㅋ 댓글들도 웃기넹. 저거 총쏴서 잘못맞으면 평생밥줄끊기는건 우리나라에서 당연한수순아니냐. 테이저건도 잘못쏘면 징계받는거 뻔하잖아.

저거 내가알기론 허벅지아래 맞춰야하는건데 맞출수있는 친구가있을까? 다른데 맞추거나 잘못맞아 사망하면 구상권청구받아서 평생 돈물어주고살아야함

 </div>
									    <div class="card-body-under d-flex justify-content-end align-items-center">
									    	<span class="span_class2"><i class="far fa-thumbs-up"></i></span>
									    	<span class="span_class">0</span>
									    	<span class="span_class2"><i class="far fa-thumbs-down"></i></span>
									    	<span class="span_class">0</span>
									    	<span class="span_class2"><i class="fas fa-grip-lines-vertical"></i></span>
									    	<span class="span_class3">댓글</span>
											<div class="dropleft">
												<button type="button" class="btn btn-light btn-sm dropdown-toggle-split" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">Normal</a>
													<a class="dropdown-item active" href="#">Active</a>
											      	<a class="dropdown-item disabled" href="#">Disabled</a>
										    	</div>
											</div>
									    </div>
									</div>
								</div>
								
								<div class="card mb-2 ml-4">
									<div class="card-header py-1 pl-3">
										<div class="d-flex">
											<img src="/resources/level_icon/${board.grade}.gif">
											<span class="card-user-name">야돈</span>
											<span class="card-user-time ml-auto">2020-05-27 12:12:12</span>
										</div>
									</div>
									<div class="card-body pt-1 pb-3 pl-3">
									    <div class="card-text">인간이니까 칼빵쳐맞는건 무서워서 망설일 수 있다고 치자.

시발 직업윤리도 생존본능에 우선할 수는 없으니까 쫄리면 주저할 수는 있지.

근데 칼빵맞고 피흘리면서 누워있다던 피해자 냅두고 어슬렁어슬렁 걸어다닌건 어떻게 쉴드가 되냐.

하다못해 100m 거리에 파출소 있으면 사람이라도 더 불러워서 그냥 서있기만해도 범인한테 최소한 심적인 압박은 가할 수 있을텐데 그것도 안하고.

최소한 다급해 보이는 인상이라도 있었으면 여기서 먹을 욕 절반은 덜먹었을텐데

무슨 시발 동네 산책나온것마냥 휘적거리면서 걷고 노니까 저딴 잡것이라고 욕박는거지.</div>
									    <div class="card-body-under d-flex justify-content-end align-items-center mt-3">
									    	<span class="span_class2"><i class="far fa-thumbs-up"></i></span>
									    	<span class="span_class">0</span>
									    	<span class="span_class2"><i class="far fa-thumbs-down"></i></span>
									    	<span class="span_class">0</span>
									    	<span class="span_class2"><i class="fas fa-grip-lines-vertical"></i></span>
									    	<span class="span_class3">댓글</span>
											<div class="dropleft">
												<button type="button" class="btn btn-light btn-sm dropdown-toggle-split" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">Normal</a>
													<a class="dropdown-item active" href="#">Active</a>
											      	<a class="dropdown-item disabled" href="#">Disabled</a>
										    	</div>
											</div>
									    </div>
									</div>
								</div>
								
								<div class="card mb-2">
									<div class="card-header py-1 pl-3">
										<div class="d-flex">
											<img src="/resources/level_icon/${board.grade}.gif">
											<span class="card-user-name">야돈</span>
											<span class="card-user-time ml-auto">2020-05-27 12:12:12</span>
										</div>
									</div>
									<div class="card-body pt-1 pb-3 pl-3">
									    <div class="card-text">
									    	<p>인간이니까 칼빵쳐맞는건 무서워서 망설일 수 있다고 치자. </p>
											<p>시발 직업윤리도 생존본능에 우선할 수는 없으니까 쫄리면 주저할 수는 있지.</p>
											<p>근데 칼빵맞고 피흘리면서 누워있다던 피해자 냅두고 어슬렁어슬렁 걸어다닌건 어떻게 쉴드가 되냐.</p>
											<p>하다못해 100m 거리에 파출소 있으면 사람이라도 더 불러워서 그냥 서있기만해도 범인한테 최소한 심적인 압박은 가할 수 있을텐데 그것도 안하고.</p>
											<p> </p>
											<p>최소한 다급해 보이는 인상이라도 있었으면 여기서 먹을 욕 절반은 덜먹었을텐데</p>
											<p>무슨 시발 동네 산책나온것마냥 휘적거리면서 걷고 노니까 저딴 잡것이라고 욕박는거지.</p>
									    </div>
									    <div class="card-body-under d-flex justify-content-end align-items-center mt-3">
									    	<span class="span_class2"><i class="far fa-thumbs-up"></i></span>
									    	<span class="span_class">0</span>
									    	<span class="span_class2"><i class="far fa-thumbs-down"></i></span>
									    	<span class="span_class">0</span>
									    	<span class="span_class2"><i class="fas fa-grip-lines-vertical"></i></span>
									    	<span class="span_class3">댓글</span>
											<div class="dropleft">
												<button type="button" class="btn btn-light btn-sm dropdown-toggle-split" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>
												<div class="dropdown-menu">
													<a class="dropdown-item" href="#">Normal</a>
													<a class="dropdown-item active" href="#">Active</a>
											      	<a class="dropdown-item disabled" href="#">Disabled</a>
										    	</div>
											</div>
									    </div>
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
