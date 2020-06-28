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
	            	
		            <div class="left_area col-lg-1 pr-4">
		            </div>
		            <!-- 배너
		            <div class="floatdiv floatdiv_left">
						<ul>
							<a href='#' target='_blank'>
							<img src='/resources/temp/banner.png' /></a>
						</ul>
					</div>
					 -->
		            
		            <div class="center_area col-lg-10 mb-5">
			            <div class="pb-2">
		                	<h3 class="board_heading"><a href="/board/${pageMaker.cri.b_name}/list">${pageMaker.cri.b_name2} 게시판</a></h3>
		                </div>
		                <%@include file="../includes/boards_buttons.jsp"%>
		            	<div class="mt-3">
			            		<div class="py-2 d-flex justify-content-between">
			            			<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></button>
				            		<sec:authorize access="isAuthenticated()">
					            		<button type="button" class="btn btn-outline-primary btn-sm text-center writeBtn">글쓰기</button>
				            		</sec:authorize>
			            		</div>
		            		<table class="table table-sm table-hover table_gtx" >
		            			<thead class="text-center">
			            			<tr>
				                        <th class="td_pc" style="width: 5%;">번호</td>
				                        <th class="td_pc" style="width: 63%;">제목</td>
				                        <th class="td_pc" style="width: 17%;">글쓴이</td>
				                        <th class="td_pc" style="width: 10%;">등록일</td>
				                        <!-- 게시판 스타일 -->
				                        <c:choose>
				                        	<c:when test="${boardStyle==1}">
				                        		<th class="td_pc" style="width: 5%;">추천</td>
				                        	</c:when>
				                        	<c:otherwise>
				                        		<th class="td_pc" style="width: 5%;">조회수</td>
				                        	</c:otherwise>
				                        </c:choose>
				                    </tr>
			                    </thead>
                    			<tbody class="text-center">
                    				<c:set var="rowNum" value="${pageMaker.startRow}"/>
                    				<c:forEach items="${list}" var="board">
	                    				<c:choose>
		                    				<c:when test="${board.notice_flag==1}">
			                    				<tr class="notice_tr">
			                    					<!-- 공지 -->
			                    					<td style="width: 5%;" class="td_pc list_else"><span class="list_replyCnt">공지</span></td>
			                    					<td style="width: 63%;" class="text-left list_else td_pc clickable-row" data-href="${board.bno}">
			                    						<a class="move" href="${board.bno}">
							                        		<span class="main_notice text-danger">${board.title}</span>
							                        		<span class="list_replyCnt">&nbsp;&nbsp;${board.replyCnt>0?board.replyCnt:""}</span>
							                        	</a>
			                    					</td>
							                        <td style="width: 17%;" class="text-left list_else list_grade td_pc"><img src="/resources/level_icon/${board.grade}.gif"> ${board.name}</td>
							                        <td style="width: 10%;" class="list_else list_regdate td_pc">${board.modiDate}</td>
					                        		<td style="width: 5%;" class="list_else td_pc"></td>
							                        
							                        <td class="td_mo py-1 d-none clickable-row" style="width: 100%;" data-href="${board.bno}">
							                        	<a class="move" href="${board.bno}">
								                        	<div class="mo_main py-1 d-flex justify-content-start">
									                        	<div class="text-left">
									                        		<span class="list_replyCnt">공지</span>
									                        		&nbsp;&nbsp;
									                        		<span class="main_notice text-danger">${board.title}</span>
									                        		&nbsp;
									                        		<span class="list_replyCnt">${board.replyCnt>0?board.replyCnt:""}</span>
								                        		</div>
								                        	</div>
							                        	</a>
							                        </td>
						                        </tr>
		                    				</c:when>
		                    				<c:otherwise>
			                    				<tr>
			                    					<!-- 공지아님 -->
				                    				<td style="width: 5%;" class="list_rowNum td_pc">${rowNum}</td>
			                    					<td style="width: 63%;" class="text-left list_else td_pc clickable-row" data-href="${board.bno}">
			                    						<a class="move" href="${board.bno}">
							                        		<span class="main_title">${board.title}</span>
							                        		<span class="list_replyCnt">&nbsp;&nbsp;${board.replyCnt>0?board.replyCnt:""}</span>
							                        	</a>
			                    					</td>
							                        <td style="width: 17%;" class="text-left list_else list_grade td_pc"><img src="/resources/level_icon/${board.grade}.gif"> ${board.name}</td>
							                        <td style="width: 10%;" class="list_else list_regdate td_pc">${board.modiDate}</td>
							                        <!-- 게시판 스타일 -->
							                        <c:choose>
							                        	<c:when test="${boardStyle==1}">
							                        		<td style="width: 5%;" class="list_else list_replyCnt td_pc">${board.likeCnt>0?board.likeCnt:""}</td>
							                        	</c:when>
							                        	<c:otherwise>
							                        		<td style="width: 5%;" class="list_else td_pc">${board.hit}</td>
							                        	</c:otherwise>
							                        </c:choose>
							                        
							                        <td class="td_mo py-2 d-none clickable-row" style="width: 100%;" data-href="${board.bno}">
							                        	<a class="move" href="${board.bno}">
								                        	<div class="mo_main py-1 d-flex justify-content-start">
									                        	<div class="text-left"><span class="main_title">${board.title}</span><span class="list_replyCnt">&nbsp;&nbsp;${board.replyCnt>0?board.replyCnt:""}</span></div>
								                        	</div>
							                        	</a>
							                        	<div class="mo_sub d-flex justify-content-between">
							                        		<div>
							                        			<c:if test="${boardStyle==1}">
							                        				<i class="far fa-thumbs-up"></i>&nbsp;${board.likeCnt}&nbsp;&nbsp;
							                        			</c:if>
							                        			<i class="far fa-clock"></i>&nbsp;${board.modiDate}
							                        		</div>
							                        		<div>
							                        			<img src="/resources/level_icon/${board.grade}.gif"> ${board.name}
							                        		</div>
							                        	</div>
							                        </td>
							                    </tr>
				                    		<c:set var="rowNum" value="${rowNum-1}"/>
		                    				</c:otherwise>
	                    				</c:choose>
	                    			</c:forEach>
                    			</tbody>
		            		</table>
		            		
		            		<!-- =================================================================================================  -->
						    <!-- start 모바일전환 / 타이틀 ellipsis -->
						    <!-- =================================================================================================  -->
						    <script type="text/javascript">
						    //모바일
						    	//console.log(window.innerWidth);
						    
							    if(window.innerWidth<768){
							    	
									$('.td_pc').each(function(){
										$(this).toggleClass('d-none');
									});
									
									
									$('.td_mo').each(function(){
										$(this).toggleClass('d-none');
									});
									
									//26글자 이상 ellipsis, 글자수 제한
									$('.main_title').each(function(){
										if($(this).text().length>23){
											$(this).text($(this).text().substring(0,23)+"...");
										}
									});
							    }else{
							    	//26글자 이상 ellipsis, 글자수 제한
									$('.main_title').each(function(){
										if($(this).text().length>36){
											$(this).text($(this).text().substring(0,36)+"...");
										}
									});
							    }
							    
							  	
							</script>
							<!-- =================================================================================================  -->
						    <!-- end 모바일전환 / 타이틀 ellipsis -->
						    <!-- =================================================================================================  -->
		            		
							<ul class="pagination justify-content-center">
								
								<c:choose>
									<c:when test="${pageMaker.prev}">
										<li class="page-item"><a class="page-link" href="${pageMaker.startPage -1}">&lt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link" href="#">&lt;</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								  	<li class="page-item ${num==pageMaker.cri.pageNum ? "active" : "" }">
								  		<a class="page-link" href="${num}">${num}</a>
							  		</li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${pageMaker.next}">
										<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">&gt;</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item disabled"><a class="page-link" href="#">&gt;</a></li>
									</c:otherwise>
								</c:choose>
							</ul>
		            	</div>
		            	<div class="my-4 py-4 board_1200banner_bot_930">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253342 });
							</script>
		            	</div>
		            	<div class="my-4 py-4 board_993banner_bot_780">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253345 });
							</script>
		            	</div>
		            	<div class="my-4 py-4 board_768banner_bot_700">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253348 });
							</script>
		            	</div>
		            	<div class="my-4 py-4 board_551banner_bot_520">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253352 });
							</script>
		            	</div>
		            	<div class="my-4 py-4 board_550banner_bot_320 text-center">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253356 });
							</script>
		            	</div>
		            	
		            </div><!-- div class="center_area col-lg-10 mb-5" -->
		            
		            <div class="right_area col-lg-1">
	           	 	</div>
	           	 	<!-- =================================================================================================  -->
	            	<!-- start 모달 -->
	            	<!-- =================================================================================================  -->
					<div class="modal fade" id="searchModal" tabindex="-1" role="dialog" aria-labelledby="searchModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="searchModalLabel">검색</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        <form id='searchForm' action="/board/${pageMaker.cri.b_name}/list" method='get'>
					          <div class="form-group">
					            <select name="type" class="custom-select mb-3">
							      <option value=""
									<c:out value="${pageMaker.cri.type == null?'selected':''}"/>>--</option>
									<option value="T"
										<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/>>제목</option>
									<option value="C"
										<c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/>>내용</option>
									<option value="W"
										<c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>>작성자</option>
									<option value="TC"
										<c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>>제목 + 내용</option>
									<option value="TW"
										<c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>>제목 + 작성자</option>
									<option value="TWC"
										<c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>>제목 + 내용 + 작성자</option>
							    </select>
					          </div>
					          <div class="form-group">
					            <input type='text' class="form-control" name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>' />
					            <input type='hidden' name='pageNum' value='<c:out value="${pageMaker.cri.pageNum}"/>' />
					            <input type='hidden' name='amount' value='<c:out value="${pageMaker.cri.amount}"/>' />
					          </div>
					        </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" id="searchFormBtn" class="btn btn-primary">검색</button>
					        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
	            	<!-- =================================================================================================  -->
	            	<!-- end 모달 -->
	            	<!-- =================================================================================================  -->
	           	 	
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
<form id='actionForm' action="/board/${pageMaker.cri.b_name}/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<!-- <input type='hidden' name='amount' value='${pageMaker.cri.amount}'> -->
	<input type='hidden' id="actionFormB_name" name='b_name' value='${pageMaker.cri.b_name}'>
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
    <!-- 스크롤 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    $(document).ready(function(){
    	
    	$('.back-to-top99').fadeIn();
    	
   		// 최상단
   		$('#back-to-top91').click(function () {
   			$('body,html').animate({
   				scrollTop: 0
   			}, 500);
   			return false;
   		});
   		
    });
    </script>
    <!-- =================================================================================================  -->

	<!-- =================================================================================================  -->
   	<!-- start td행 전체에 링크 -->
   	<!-- =================================================================================================  -->
   	<script type="text/javascript">
   	$(document).ready(function(){
   		$(".clickable-row").click(function() {
			$("#actionForm").append("<input type='hidden' name='bno' value='"+ $(this).data("href") + "'>");
			$("#actionForm").attr("action","/board/content");
			$("#actionForm").submit();
   	    });
   	});
   	</script>
	<!-- =================================================================================================  -->
   	<!-- end td행 전체에 링크 -->
   	<!-- =================================================================================================  -->
   	
   	
	
	<!-- =================================================================================================  -->
   	<!-- start 모달 -->
   	<!-- =================================================================================================  -->
   	<script type="text/javascript">
   	$(document).ready(function(){
   		$('#searchFormBtn').on("click", function(e){
   			
   			var searchForm = $("#searchForm");
   			
   			if (!searchForm.find("option:selected").val()) {
				swa("error","검색종류를 선택하세요");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				swa("error","키워드를 입력하세요");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");
			e.preventDefault();

			searchForm.submit();
		});
   	});
   	</script>
	<!-- =================================================================================================  -->
   	<!-- end 모달 -->
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
    <!-- start 쿠키 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    
    $(".writeBtn").on("click", function(e){
        e.preventDefault();
        
        if( getCookie('mplwck'+$('#actionFormB_name').val())!=null){
        	swa("error","글은 1분에 1개만 작성가능합니다");
			return;
        }
        
        location.href='/board/register?b_name=${pageMaker.cri.b_name}';
    });

    function getCookie(name) {
  	  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  	  return value? value[2] : null;
  	}
    </script>
    <!-- =================================================================================================  -->
    <!-- end 쿠키 -->
    <!-- =================================================================================================  -->
    
    
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
