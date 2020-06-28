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
		            			<span class="content_heading"><a href="/board/${cri.b_name}/content/${board.bno}">${board.title}</a></span>
		            		</div>
		            		<table class="table table-sm table-borderless">
			            		
			            		<hr class="hr1"/>
			            		<tr>
			            			<td class="tdcolor_1">
				            			<img src="/resources/level_icon/${board.grade}.gif">
				            			&nbsp;${board.name}&nbsp;&nbsp;&nbsp;&nbsp;<span class="content_gray_small"><i class="far fa-clock"></i>&nbsp;<fmt:formatDate pattern="yyyy.MM.dd HH:MM:ss" value="${board.regdate}" /></span>
			            			</td>
			            		</tr>
			            		
			            		<c:if test="${board.notice_flag==0}">
				            		<tr>
				            			<td class="content_main_td"><i class="fas fa-link content_gray"></i>&nbsp;<span class="content_gray_small"><a href="/board/${cri.b_name}/content/${board.bno}">http://musictau.com/board/${cri.b_name}/content/${board.bno}</a></span></td>
				            		</tr>
			            		</c:if>
			            		
			            		<tr class="content_file_place_parent">
			            			<td class="content_file_place">
			            			</td>
			            		</tr>
			            		
			            		<tr>
			            			<td class="py-5 content_content">${board.content}</td>
			            		</tr>
		            		</table>
		            		
		            		<c:if test="${board.notice_flag==0}">
			            		<div class="content_like text-center pb-4">
	                               	<button type="button" id="content_likeBtn" class="btn btn-primary btn-sm mr-2"><i id="t_up" class="far fa-thumbs-up"></i>&nbsp;:&nbsp;<span id="content_likeCount">0</span></button>
						        	<button type="button" id="content_dislikeBtn" class="btn btn-outline-secondary btn-sm"><i id="t_down" class="far fa-thumbs-down"></i>&nbsp;:&nbsp;<span id="content_dislikeCount">0</span></button>
						      	</div>
		            		</c:if>
		            		
		            		<div class="float-right mt-2">
		            			 <sec:authentication property="principal" var="pinfo"/>
		            			 <sec:authorize access="isAuthenticated()">
			            			 <c:if test="${pinfo.username eq board.id}">
				            			<button data-oper='delete' class="btn btn-outline-secondary btn-sm text-center">삭제하기</button>
										<button data-oper='modify' class="btn btn-outline-secondary btn-sm text-center">수정하기</button>
			            			 </c:if>
		            			 </sec:authorize>
								<button data-oper='list' class="btn btn-primary btn-sm text-center">목록으로</button>
		            		</div>
	            		</div>
	            		<hr class="hr2"/> 
		            	<!-- =================================================================================================  -->
						<!-- end 컨텐츠  -->
						<!-- =================================================================================================  -->
						
						<div class="my-3 py-3 board_1200banner_bot_930">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253342 });
							</script>
		            	</div>
		            	<div class="my-3 py-3 board_993banner_bot_780">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253345 });
							</script>
		            	</div>
		            	<div class="my-3 py-3 board_768banner_bot_700">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253348 });
							</script>
		            	</div>
		            	<div class="my-3 py-3 board_551banner_bot_520">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253352 });
							</script>
		            	</div>
		            	<div class="my-3 py-3 board_550banner_bot_320 text-center">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253356 });
							</script>
		            	</div>
						<!-- =================================================================================================  -->
						<!-- start 댓글  -->
						<!-- =================================================================================================  -->
						<h5><i class="far fa-comment-dots font-weight-bold pt-3 pb-2"></i>&nbsp;<span class="replyCnt_h6"></span>개의 댓글</h5>
						<div class="reply_area">
							<div class="card_area">
								
								
							</div>
							<div class="reply_page">
							
							</div>
							<hr class="hr2"/>
							
							<sec:authorize access="isAuthenticated()">
								<div class="form-group mb-2">
									<textarea class="form-control reply_textarea" id="reply_textarea"></textarea>
								</div>
								<div class="d-flex justify-content-end">
									<button id="reply_registerBtn" class="btn btn-outline-secondary btn-sm text-center">등록</button>
									<button id="reply_register_likeBtn" class="btn btn-outline-secondary btn-sm text-center ml-2">등록+추천</button>
								</div>
							</sec:authorize>
						</div>
						<!-- =================================================================================================  -->
						<!-- end 댓글  -->
						<!-- =================================================================================================  -->
						
						<!-- =================================================================================================  -->
						<!-- start 목록  -->
						<!-- =================================================================================================  -->
						<div class="mt-5 pt-3 pb-2 spy_table">
		                	<h3 class="board_heading"><a href="/board/${pageMaker.cri.b_name}/list">${pageMaker.cri.b_name2} 게시판</a></h3>
		                </div>
		                <%@include file="../includes/info_buttons.jsp"%>
		            	<div class="mt-3">
			            		<div class="py-2 d-flex justify-content-between">
			            			<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></button>
				            		<sec:authorize access="isAuthenticated()">
					            		<button type="button" class="btn btn-outline-primary btn-sm text-center writeBtn">글쓰기</button>
				            		</sec:authorize>
			            		</div>
		            		<table class="table table-sm table-hover table_gtx">
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
                    				<c:forEach items="${list}" var="board2">
                    					<c:choose>
                    						<c:when test="${board2.notice_flag==1}">
                    						<!-- 공지 -->
                    						<tr class="notice_tr">
                    							<td class = "td_pc ${board.bno==board2.bno ? "hover_color2":"list_replyCnt"}" style="width: 5%;">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":"공지"}</td>
		                    					<td style="width: 63%;" data-href="${board2.bno}" class="text-left list_else td_pc clickable-row ${board.bno==board2.bno?"hover_color":"" }">
						                        	<a class="move" href="${board2.bno}">
						                        		<span class="main_notice text-danger">${board2.title}</span>
						                        		<span class="list_replyCnt">&nbsp;&nbsp;${board2.replyCnt>0?board2.replyCnt:""}</span>
						                        	</a>
		                    					</td>
						                        <td style="width: 17%;" class="text-left list_else list_grade td_pc"><img src="/resources/level_icon/${board2.grade}.gif"> ${board2.name}</td>
						                        <td style="width: 10%;" class="list_else list_regdate td_pc">${board2.modiDate}</td>
						                        <td style="width: 5%;" class="list_else td_pc"></td>
						                        
						                        <td class="td_mo py-1 d-none clickable-row" style="width: 100%;" data-href="${board2.bno}">
						                        	<div class="mo_main py-1 d-flex justify-content-start">
						                        		<a class="move" href="${board2.bno}">
								                        	<div class='text-left ${board.bno==board2.bno ? "hover_color":"" }'>
								                        		<span class="list_replyCnt">&nbsp;${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":"공지"}</span>
								                        		&nbsp;&nbsp;
								                        		<span class="main_notice text-danger">${board2.title}</span>
								                        		&nbsp;
								                        		<span class="list_replyCnt">${board2.replyCnt>0?board2.replyCnt:""}</span>
							                        		</div>
						                        		</a>
						                        	</div>
					                        	</td>
                    						</tr>
                    						</c:when>
                    						
                    						<c:otherwise>
                    						<!-- 공지아님 -->
                    						<tr>
			                    				<td class = "td_pc ${board.bno==board2.bno ? "hover_color2":"list_rowNum"}" style="width: 5%;">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":rowNum}</td>
		                    					<td style="width: 63%;" data-href="${board2.bno}" class="text-left list_else td_pc clickable-row ${board.bno==board2.bno?"hover_color":"" }">
		                    						<a class="move" href="${board2.bno}">
						                        		<span class="main_title">${board2.title}</span>
						                        		<span class="list_replyCnt">&nbsp;&nbsp;${board2.replyCnt>0?board2.replyCnt:""}</span>
						                        	</a>
		                    					</td>
						                        <td style="width: 17%;" class="text-left list_else list_grade td_pc"><img src="/resources/level_icon/${board2.grade}.gif"> ${board2.name}</td>
						                        <td style="width: 10%;" class="list_else td_pc">${board2.modiDate}</td>
						                        <!-- 게시판 스타일 -->
							                        <c:choose>
							                        	<c:when test="${boardStyle==1}">
							                        		<td style="width: 5%;" class="list_else list_replyCnt td_pc">${board2.likeCnt>0?board2.likeCnt:""}</td>
							                        	</c:when>
							                        	<c:otherwise>
							                        		<td style="width: 5%;" class="list_else td_pc">${board2.hit}</td>
							                        	</c:otherwise>
							                        </c:choose>
						                        
						                        
						                        <td class="td_mo py-2 d-none clickable-row" style="width: 100%;" data-href="${board2.bno}">
						                        	<div class="mo_main py-1 d-flex justify-content-start">
						                        		<a class="move" href="${board2.bno}">
								                        	<div class='text-left ${board.bno==board2.bno ? "hover_color":"" }'>
								                        		<span class="main_title">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":""}&nbsp;${board2.title}</span>
								                        		<span class="list_replyCnt">&nbsp;&nbsp;${board2.replyCnt>0?board2.replyCnt:""}</span>
							                        		</div>
						                        		</a>
						                        	</div>
						                        	<div class="mo_sub d-flex justify-content-between">
							                        		<div>
							                        			<c:if test="${boardStyle==1}">
							                        				<i class="far fa-thumbs-up"></i>&nbsp;${board2.likeCnt}&nbsp;&nbsp;
							                        			</c:if>
							                        			<i class="far fa-clock"></i>&nbsp;${board2.modiDate}
							                        		</div>
							                        		<div>
							                        			<img src="/resources/level_icon/${board2.grade}.gif"> ${board2.name}
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
								  	<li class="page-item ${num==pageMaker.cri.pageNum ? "active" : ""}">
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
						<!-- =================================================================================================  -->
						<!-- end 목록  -->
						<!-- =================================================================================================  -->
		            </div>
		            
		            
		            <div class="right_area col-lg-1 ">
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
	            </div><!-- row -->
            </div><!-- container -->
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
<form id='operForm' action="/board/" method="get">
  <input type='hidden' id='bno' name='bno' value='${board.bno}'>
  <input type='hidden' name='pageNum' value='${cri.pageNum}'>
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
<form id='replyForm' action="/board/reply" method="post">
  <input type='hidden' name='bno' value='${board.bno}'>
  <input type='hidden' name='rno' value="">
  <input type='hidden' name='pageNum' value='${cri.pageNum}'>
  <input type='hidden' name='keyword' value='${cri.keyword}'>
  <input type='hidden' name='type' value='${cri.type}'>
  <input type='hidden' name='b_name' value='${cri.b_name}'>
  <input type='hidden' name='reply' value="">
  <input type='hidden' name='replyPage' value="">
  <input type='hidden' name='id' value="">
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

   	
	<!-- =================================================================================================  -->
   	<!-- start 첨부파일 관련 -->
   	<!-- =================================================================================================  -->
   	<script type="text/javascript">
   	$(document).ready(function(){
   		
   		(function(){
   			
   			var bno = '${board.bno}';
   			var b_name = '${cri.b_name}';
   			$.getJSON("/board/getAttachList", {bno: bno, b_name: b_name}, function(arr){
   				
   				//console.log(arr.length);
   				
   				if(arr.length < 1){
   					$(".content_file_place_parent").remove();
   					return;
   				}//if
   				
   				var str0 = '<div class="content_file text-right"><div class="dropdown dropleft"><button type="button" class="btn btn-outline-secondary btn-sm" data-toggle="dropdown"><i class="far fa-file-alt"></i>&nbsp;첨부파일</button><div class="dropdown-menu">';
   				var str = "";
   				var str1 = "</div></div></div>";
   				
   				$(arr).each(function(i, attach){
   					var path = encodeURIComponent(attach.uploadPath + "/" + attach.uuid + "_" + attach.fileName);
   					
   					if(attach.fileType){
   						
   						var imgPath = path.replace( new RegExp(/\\/g), "/");
   						
   						str += "<a class='dropdown-item' target='_blank' href='/display?fileName="+imgPath+"'>" + attach.fileName + "</a>";
   					}else{
	   					str += "<a class='dropdown-item' href='/download?fileName="+path+"'>" + attach.fileName + "</a>";
   					}
   				});//$(arr).each(function(){
   				$(".content_file_place").html(str0 + str + str1);
   			});//getJSON
   			
   		})(); //end function
   		
   	});//$(document).ready(function(){
   	</script>
	<!-- =================================================================================================  -->
   	<!-- end 첨부파일 관련 -->
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
	<!-- 댓글처리 -->
    <script type="text/javascript" src="/resources/js/reply.js"></script>
    <!-- =================================================================================================  -->
    
    <script type="text/javascript">
    $(document).ready(function(){
	    var bnoValue = '<c:out value="${board.bno}"/>';
	    var b_name = '${cri.b_name}';
	    var replyer = "";
	    <sec:authorize access="isAuthenticated()">
	    	replyer = '<sec:authentication property="principal.username"/>';   
	    </sec:authorize>
	    
	    
	    
	    //csrf ajaxSend
    	var csrfHeaderName ="${_csrf.headerName}"; 
        var csrfTokenValue="${_csrf.token}";
    	$(document).ajaxSend(function(e, xhr, options) { 
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
        });
    	
	
    	//리스트 갱신/보여주기 showList()
		<c:choose>
			<c:when test="${replyUpdateFlag!=null}">
				//댓글 수정하고 왔을 경우 그 댓글 위치로 보냄(자동스크롤링)
				showList(${replyUpdate_page}, bnoValue, b_name, 3, ${replyUpdate_rno});
			</c:when>
			<c:otherwise>
				showList(1, bnoValue, b_name, 0, 0);
			</c:otherwise>
		</c:choose>
    	
    	
    	//=====================================================================================================
    	// 댓글 등록
    	//=====================================================================================================
    	var reply_registerBtn = $('#reply_registerBtn'); //댓글등록버튼
    	
    	reply_registerBtn.on("click", function(e){
    		
    		var oriStr = $('#reply_textarea').val();
    		//console.log(oriStr.length);
    		//유효성 체크
    		if($.trim(oriStr) =="" || $.trim(oriStr).length ==0){
    			swa("error","댓글 내용을 작성해주세요");
    			return;
    		}
    		
    		//쿠키 체크, 댓글은 15초에 1개
			if(getCookie('mplrck'+b_name+bnoValue)!=null){
				swa("error","한 게시물에 댓글은 15초에 1개만 작성가능합니다");
				return;
			}
    		
    		//댓글내용에 html 제거
    		oriStr = oriStr.replace(/(<([^>]+)>)/ig,"");
    		
    		if(oriStr.length > 1500){
    			swa("error","댓글은 1500자까지 입력가능합니다 (현재 : "+oriStr.length+"자)");
				return;
    		}
    		
    		//json생성
    		//줄바꿈 <br>변환
    		var reply = {
    				reply : oriStr.replace(/(?:\r\n|\r|\n)/g, '<br />')
    				,id : replyer
    				,bno : bnoValue
   			};
    		
    		
    		replyService.add(reply, b_name, function(result){
    			$('#reply_textarea').val('');
    			//쿠키생성
    			setCookie('mplrck'+b_name+bnoValue, 'yes', 15);
    			showList(-1, bnoValue, b_name, 2, 0);
   			});
    		
    	});//reply_registerBtn.on
    	//=====================================================================================================
    		
    	//=====================================================================================================
    	// 댓글 등록+추천 
    	//=====================================================================================================
    	var reply_register_likeBtn = $('#reply_register_likeBtn'); //댓글등록버튼
    	
    	reply_register_likeBtn.on("click", function(e){
    		if($('#t_up').hasClass('far')){
	    		$("#content_likeBtn").trigger("click");
    		}
    		$("#reply_registerBtn").trigger("click");
    	});//reply_register_likeBtn.on("click"
    	//=====================================================================================================
    	
    	
    	//댓글페이지 클릭
    	$('.reply_page').on("click","li a", function(e){
            e.preventDefault();
            //console.log("page click");
            
            var targetPageNum = $(this).attr("href");
            
            //console.log("targetPageNum: " + targetPageNum);
            
            pageNum = targetPageNum;
            
            showList(pageNum,bnoValue, b_name, 1, 0);
          });     
    
    	
    	//글쓰기 1분에 한개 제한
        $(".writeBtn").on("click", function(e){
            e.preventDefault();
            if( getCookie('mplwck'+b_name)!=null){
            	swa("error","글은 1분에 1개만 작성가능합니다");
    			return;
            }//if
            location.href='/board/register?b_name=${pageMaker.cri.b_name}';
        });
    });//$(document).ready(function(){
    </script>
	<!-- =================================================================================================  -->
	<!-- 댓글처리 -->
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
				  confirmButtonColor: '#0F4C81',
				  cancelButtonColor: '#b71515',
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
    <!-- start 댓글 리스트 보여주기 showList -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function showList(page, bnoValue, b_name, scrollFlag, rnoReply){
		
    	/*
    		page : 댓글 페이지
    		bnoValue : 글번호
    		b_name : 게시판 이름
    		scrollFlag : 1=최상단, 2=최하단, 3=댓글위치로 찾아가기
    		rnoReply : 댓글번호 (scrollFlag 3에 사용, 1,2는 안씀)
    	*/
    	var authId = "";
    	<sec:authorize access="isAuthenticated()">
    		authId = "${pinfo.username}";
    	</sec:authorize>
    	
	    replyService.getList({bno:bnoValue, page:page||1, b_name:b_name}, function(replyCnt, list){
	        var str="";
	        var scroll1st = "";
	        var scrollLast = "";
	        var scrollReply = "";
	        
	        if(page == -1){
	        	pageNum = Math.ceil(replyCnt/50.0);
	        	showList(pageNum, bnoValue, b_name, scrollFlag, 0);
	        	return;
	        }
	        
	        
	        if(list == null || list.length == 0){
	        	$('.card_area').html("<div class='text-center'><span>작성된 댓글이 없습니다.</span></div>");
	        	showReplyPage(replyCnt, page);
	            return;
	        }//if
	        
	        $('.replyCnt_h6').text(replyCnt);

	        for(var i =0, len=list.length || 0; i<len; i++){
	        	
	        	//console.log(list[i].regdate + " // " + list[i].updatedate);
	        	if(i==0){scroll1st=list[i].rno}
	        	if(i+1==len){scrollLast=list[i].rno}
	        	if(list[i].rno==rnoReply){scrollReply=list[i].rno}
	        	
	        	if(list[i].reply_step > 0 ){
	        		str += '<div class="card mb-2 ml-5" id="spy_'+list[i].rno+'" data-page="'+page+'">';//대댓글
	        	}else{
		            str += '<div class="card mb-2" id="spy_'+list[i].rno+'" data-page="'+page+'">';//일반 댓글
	        	}	
					if(authId==list[i].id){
						str += '<div class="card-header card_bg py-1 pl-3">'; //로그인한 사람이 쓴 댓글
					}else if('${board.id}'==list[i].id){
						str += '<div class="card-header card_bg2 py-1 pl-3">'; //글쓴 사람이 쓴 댓글
					}else{
						str += '<div class="card-header py-1 pl-3">';
					}
		            		str += '<div class="reply_grade d-flex">';
			    	            str += '<img src="/resources/level_icon/'+ list[i].grade +'.gif">';//grade
			    	            str += '<span class="card-user-name">'+ list[i].name +'</span>';
			    	            str += '<span class="card-user-time ml-auto">'+  replyService.displayTime(list[i].regdate) +'</span>';
							str += '</div>';//'<div class="d-flex">
	            		str += '</div>';//<div class="card-header py-1 pl-3">'
	            	str += '<div class="card-body pt-1 pb-1 pl-3 pr-1">';
	            		if(list[i].del_flag == -1){
	            			str += '<div class="card-text">[-- 삭제된 댓글입니다 --]</div>';	            			
	            		}else if(list[i].regdate != list[i].updatedate){
	            			str += '<div id="reply_'+list[i].rno+'" class="card-text"><span class="text-secondary">[-- 수정된 댓글 --]</span><br>'+ list[i].reply +'</div>';	
	            		}else{
	            			str += '<div id="reply_'+list[i].rno+'" class="card-text">'+ list[i].reply +'</div>';	
	            		}
    	            	str += '<div class="card-body-under d-flex justify-content-end align-items-center">';
    	            	
   	            			str += '<span class="span_class2 reply_likeBtn" data-id="'+list[i].id+'" data-rno="'+list[i].rno+'"><i id="rt_up'+list[i].rno+'" class="far fa-thumbs-up"></i></span>';
    	            		str += '<span class="span_class reply_likeBtn2" id="reply_likeCount'+list[i].rno+'">'+list[i].likeCnt+'</span>';//좋아요
   	            			str += '<span class="span_class2 reply_dislikeBtn" data-id="'+list[i].id+'" data-rno="'+list[i].rno+'"><i id="rt_down'+list[i].rno+'" class="far fa-thumbs-down"></i></span>';
		    	            str += '<span class="span_class reply_dislikeBtn2" id="reply_dislikeCount'+list[i].rno+'">'+list[i].dislikeCnt+'</span>';//싫어요
		    	            
		    	            <sec:authorize access="isAuthenticated()">
		    	            if(list[i].reply_step == 0 ){
		    	            str += '<span class="span_class4"><i class="fas fa-grip-lines-vertical"></i></span>';
		    	            	str += '<button type="button" class="btn btn-link btn-sm span_class3 pl-0 pr-2" onclick="openReReply(this,'+list[i].rno+')">댓글</button>';
		    	            }
		    	            </sec:authorize>
		    	            
							if(authId==list[i].id){
							if(list[i].del_flag == 0){							
    	            		str += '<div class="dropleft">';
    	            			str += '<button type="button" class="btn btn-light btn-sm dropdown-toggle-split" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>';
    	            			str += '<div class="dropdown-menu">';
    	            					str += '<a class="dropdown-item px-2 w-100" onclick="replyUpdateBtn('+list[i].rno+')"><i class="fas fa-file-signature i_size"></i>&nbsp;수정</a><div class="dropdown-divider"></div>';
    				    	            str += '<a class="dropdown-item px-2 w-100" onclick="replyDeleteBtn('+list[i].rno+')"><i class="far fa-trash-alt i_size"></i>&nbsp;삭제</a><div class="dropdown-divider"></div>';
    				    	            str += '<a class="dropdown-item px-2 w-100 onclick=""><i class="far fa-angry i_size"></i>&nbsp;신고</a>';	
    	            			str += '</div>';//div class="dropdown-menu
							}//if
							}//if
   	            			str += '</div>';//<div class="dropleft">
            			str += '</div>';//div class="card-body-under
        			str += '</div>';//<div class="card-body pt-1 pb-1 pl-3 pr-1">
	            str += '</div>';//<div class="card mb-2 ml-5">
	            str += '<div class="subReply ml-5" data-page="'+page+'" data-bno="'+bnoValue+'" data-rno="'+list[i].rno+'"></div>';
	        }//for

	        $('.card_area').html(str);
	        showReplyPage(replyCnt, page);
	        
	        //댓글에 좋아요 자기가 한건지 체크
	        <sec:authorize access="isAuthenticated()">
		        readReplyLike();
		    </sec:authorize>
	        
	        //자동스크롤링
	        if(scrollFlag==1){//최상단
		        var position = $("#spy_"+scroll1st).offset();
		        $('html, body').animate({scrollTop : position.top-330}, 500);
	        }else if(scrollFlag==2){//최하단
	        	var position = $("#spy_"+scrollLast).offset();
		        $('html, body').animate({scrollTop : position.top-150}, 500);
	        }else if(scrollFlag==3){//댓글 찾아가기
	        	var position = $("#spy_"+scrollReply).offset();
		        $('html, body').animate({scrollTop : position.top-150}, 500);
	        }
	    });//getList
	}//showList
    </script>
	<!-- =================================================================================================  -->
    <!-- end 댓글 리스트 보여주기 showList -->
    <!-- =================================================================================================  -->
    
	<!-- =================================================================================================  -->
    <!-- start 댓글 페이지 보여주기  -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function showReplyPage(replyCnt,page){
    	var pageNum = page;
	      var endNum = Math.ceil(pageNum / 5.0) * 5;  
	      var startNum = endNum - 4; 
	      
	      var prev = startNum != 1;
	      var next = false;
	      
	      if(endNum * 50 >= replyCnt){
	        endNum = Math.ceil(replyCnt/50.0);
	      }//if
	      
	      if(endNum * 50 < replyCnt){
	        next = true;
	      }//if
	      
	      var str = "<ul class='pagination justify-content-center'>";
	      
	      if(prev){
	        str+= "<li class='page-item'><a class='page-link' href='1'>&lt;&lt;</a></li>";//처음
	        str+= "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>&lt;</a></li>";//이전
	      }//if
	      
	       
	      
	      for(var i = startNum ; i <= endNum; i++){
	        
	        var active = pageNum == i? "active":"";
	        
	        str+= "<li class='page-item "+active+" '><a class='page-link' href='"+i+"'>"+i+"</a></li>";
	      }//for
	      
	      if(next){
	        str+= "<li class='page-item'><a class='page-link' href='"+(endNum + 1)+"'>&gt;</a></li>";//다음
	        str+= "<li class='page-item'><a class='page-link' href='"+(Math.ceil(replyCnt/50.0))+"'>&gt;&gt;</a></li>";//마지막
	      }//if
	      
	      str += "</ul></div>";
	      
	      $(".reply_page").html(str);
	      
    }//showReplyPage
    </script>
	<!-- =================================================================================================  -->
    <!-- end 댓글 페이지 보여주기  -->
    <!-- =================================================================================================  -->
    
    
	<!-- =================================================================================================  -->
    <!-- start 대댓글 버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
	function openReReply(item, rno){
		
		var openReReplyStr = '<div class="form-group mb-2">';
				openReReplyStr += '<textarea class="form-control reply_textarea" id="subReply_textarea"></textarea>';
			openReReplyStr += '</div>';
			openReReplyStr += '<div class="d-flex justify-content-end">';
				openReReplyStr += '<button id="subReply_registerBtn" class="btn btn-outline-secondary btn-sm text-center" onclick="registerReReply('+rno+',this)">등록</button>';
				openReReplyStr += '<button id="subReply_cancelBtn" class="btn btn-outline-secondary btn-sm text-center ml-2" onclick="reReplyCancelBtn(this)">취소</button>';
			openReReplyStr += '</div>';
		
		var subReply = $(item).parent().parent().parent().next();
		var card = $(item).parent().parent().parent();
		var subReplys = $('.subReply');
		
		if( subReply.hasClass('selected') ){
			for(var i=0; i<subReplys.length; i++){
				var temp = $(subReplys[i]);
				if(temp.html() !="" || temp.html().length >0){
					temp.html('');
					temp.removeClass('mb-3');
					temp.removeClass('selected');
					temp.prev().addClass('mb-2');
				}
			}
			subReply.addClass('selected');
		}else{
			for(var i=0; i<subReplys.length; i++){
				var temp = $(subReplys[i]);
				if(temp.html() !="" || temp.html().length >0){
					temp.html('');
					temp.removeClass('mb-3');
					temp.removeClass('selected');
					temp.prev().addClass('mb-2');
				}
			}
		}
		
		
		if( subReply.hasClass('selected') ){
			subReply.removeClass('selected');
			subReply.html('');
			subReply.removeClass('mb-3');
			card.addClass('mb-2');
		}else if(subReply.html() =="" || subReply.html().length ==0){
			subReply.html(openReReplyStr);
			subReply.addClass('selected');
			subReply.addClass('mb-3');
			card.removeClass('mb-2');
		}
	}
    </script>
    <!-- =================================================================================================  -->
    <!-- end 대댓글 버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    
    
    
    <!-- =================================================================================================  -->
    <!-- start 대댓글 취소버튼 펑션 -->
    <!-- =================================================================================================  -->
	<script type="text/javascript">
	function reReplyCancelBtn(item){
		var subReply = $(item).parent().parent();
		var card = $(item).parent().parent().prev();
		subReply.removeClass('selected');
		subReply.html('');
		subReply.removeClass('mb-3');
		card.addClass('mb-2');
	}
	</script>    
    <!-- =================================================================================================  -->
    <!-- end 대댓글 취소버튼 펑션 -->
    <!-- =================================================================================================  -->
    
    
    <!-- =================================================================================================  -->
    <!-- start 대댓글 등록버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function registerReReply(rno, item){
    	var bnoValue2 = '<c:out value="${board.bno}"/>';
	    var b_name2 = '${cri.b_name}';
	    
	    var subReply = $(item).parent().parent()
	    var rnoReply = subReply.data('rno');
	    var page = subReply.data('page');
	    //console.log("이거1 :"+ subReply.data('bno'));
	    //console.log("이거2 :"+subReply.data('page'));
	    //console.log("이거3 :"+subReply.data('rno'));
	    
	    var oriStr = $('#subReply_textarea').val();
	    
	  	//유효성 체크
		if($.trim(oriStr) =="" || $.trim(oriStr).length ==0){
			swa("error","댓글 내용을 작성해주세요");
			return;
		}
		
		//쿠키 체크, 댓글은 15초에 1개
		if(getCookie('mplrck'+b_name2+bnoValue2)!=null){
			swa("error","한 게시물에 댓글은 15초에 1개만 작성가능합니다");
			return;
		}
	    
	  	//댓글내용에 html 제거
		oriStr = oriStr.replace(/(<([^>]+)>)/ig,"");
		
		if(oriStr.length > 1500){
			swa("error","댓글은 1500자까지 입력가능합니다 (현재 : "+oriStr.length+"자)");
			return;
		}
		
	    var replyer2 = "";
	    <sec:authorize access="isAuthenticated()">
	    	replyer2 = '<sec:authentication property="principal.username"/>';   
	    </sec:authorize>
    
    	//console.log(bnoValue2 + " // " + b_name2 + " // " + replyer2 + "//" + rno);
    	
   		var reply2 = {
   				reply : oriStr.replace(/(?:\r\n|\r|\n)/g, '<br />')
   				,id : replyer2
   				,bno : bnoValue2
   				,rno : rno
		};
   		
   		replyService.addRe(reply2, b_name2, function(result){
   			
   			//쿠키생성
			setCookie('mplrck'+b_name2+bnoValue2, 'yes', 15);
   			showList(page, bnoValue2, b_name2, 3, rnoReply);
		});
    		
    }
    </script>
    <!-- =================================================================================================  -->
    <!-- end 대댓글 등록버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    
    <!-- =================================================================================================  -->
    <!-- start 댓글 수정버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function replyUpdateBtn(rno){
    	
		var b_name = '${cri.b_name}';
		 var replyer = "";
	    <sec:authorize access="isAuthenticated()">
    		replyer = '<sec:authentication property="principal.username"/>';   
    	</sec:authorize>
	    	
	    Swal.fire({
			  title: '댓글을 수정 하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#0F4C81',
			  cancelButtonColor: '#b71515',
			  confirmButtonText: '수정',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
			    //수정처리시작
			    $("#replyForm").find("input[name='rno']").val( rno );
			    $("#replyForm").find("input[name='id']").val( replyer );
			    
			    var oriStr = $('#reply_'+rno).html();
			    oriStr = oriStr.replace(/<br> ?/g, '&#013;&#010;');
			  	//댓글내용에 html 제거
	    		oriStr = oriStr.replace(/(<([^>]+)>)/ig,"");
	    		
			    $("#replyForm").find("input[name='reply']").val( oriStr );
			    $("#replyForm").find("input[name='replyPage']").val( $('#spy_'+rno).data('page') );
			    $("#replyForm").submit();
			  }//if
			});
    }
    </script>
    <!-- =================================================================================================  -->
    <!-- end 댓글 수정버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    
    
    <!-- =================================================================================================  -->
    <!-- start 댓글 삭제버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function replyDeleteBtn(rno){
    	
	    var b_name = '${cri.b_name}';
	    
	    var replyer = "";
	    <sec:authorize access="isAuthenticated()">
    	replyer = '<sec:authentication property="principal.username"/>';   
    	</sec:authorize>
	    
	    Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "삭제된 댓글은 복구가 어렵습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#0F4C81',
			  cancelButtonColor: '#b71515',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
			    //삭제처리시작
				  replyService.remove(rno, b_name, replyer, function(count){
						//console.log(count);
						if(count==="success"){
							swa("success",'삭제되었습니다.');
							showList(1, ${board.bno}, '${cri.b_name}', 0, 0);
						}
					}, function(err){
						swa("error",'에러 발생');
					});
			  }
			});
    }
    </script>
    <!-- =================================================================================================  -->
    <!-- end 댓글 삭제버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    
    
    <!-- =================================================================================================  -->
    <!-- start 쿠키 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function getCookie(name) {
  	  var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
  	  return value? value[2] : null;
  	}
    
    function setCookie(name, value, exp) {
    	  var date = new Date();
    	  date.setTime(date.getTime() + exp*1000);
    	  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
   	}
    </script>
    <!-- =================================================================================================  -->
    <!-- end 쿠키 -->
    <!-- =================================================================================================  -->
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
	
	
	<!-- =================================================================================================  -->
    <!-- 스크롤 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    $(document).ready(function(){
    	
    	$('.back-to-top').fadeIn();
    	
   		// 최상단
   		$('#back-to-top1').click(function () {
   			$('body,html').animate({
   				scrollTop: 0
   			}, 500);
   			return false;
   		});
   		
   		// 댓글창
   		$('#back-to-top2').click(function () {
   			
   			var position = $(".reply_area").offset();
   			$('body,html').animate({
   				scrollTop: position.top-330
   			}, 500);
   			return false;
   		});
   	
   		// 목록창
   		$('#back-to-top3').click(function () {
   			
   			var position = $(".spy_table").offset();
   			$('body,html').animate({
   				scrollTop: position.top
   			}, 500);
   			return false;
   		});
    });
    </script>
    <!-- =================================================================================================  -->
    
    <!-- =================================================================================================  -->
    <!-- 유튜브 처리 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">

	  $(window).resize(function(){resizeYoutube();});
	  $(function(){resizeYoutube();});
	  function resizeYoutube(){ $("iframe").each(function(){ if( /^https?:\/\/www.youtube.com\/embed\//g.test($(this).attr("src")) ){ $(this).css("width","100%"); $(this).css("height",Math.ceil( parseInt($(this).css("width")) * 480 / 854 ) + "px");} }); }

	</script>
    <!-- =================================================================================================  -->
		
		
		
		
	<!-- =================================================================================================  -->
   	<!-- start 게시글 좋아요 -->
   	<!-- =================================================================================================  -->
   	<script type="text/javascript">
   	$(document).ready(function(){
   		
   		var bnoValue = '<c:out value="${board.bno}"/>';
	    var b_name = '${cri.b_name}';
	    var replyer = "";
	    <sec:authorize access="isAuthenticated()">
	    	replyer = '<sec:authentication property="principal.username"/>';   
	    </sec:authorize>
	    
	    
	    //좋아요 싫어요 읽기
		$.getJSON("/like/read/"+b_name+"/"+ bnoValue + "/" + replyer +".json",
            function (data) {
               	$('#content_likeCount').text(data.like);
                $('#content_dislikeCount').text(data.dislike);
                
                //내가 체크했으면
                if(data.check==1){
                	if(data.value==1){
                		//좋아요
                		$('#t_up').toggleClass('far');
                		$('#t_up').toggleClass('fas');
                	}else{
                		//싫어요
                		$('#t_down').toggleClass('far');
                		$('#t_down').toggleClass('fas');
                	}//if
                }//if
                
            }).fail(function(xhr,status,err) {
            	console.log("좋아요 에러1");
		});//$.getJSON(
	    
	    
<sec:authorize access="isAuthenticated()">
   		$("#content_likeBtn").click(function() {
   			
			if(replyer=='${board.id}'){
				swa("error","본인 게시글에는 사용 불가능합니다.");
				return;
			}
   			
   			//쿠키 체크, 좋아요는 5초에 1번
			if(getCookie('mpllck'+b_name+bnoValue)!=null){
				swa("error","좋아요/싫어요는 5초에 1번만 수정 가능합니다");
				return;
			}
   			var like_info = {
    				id : replyer
    				,bno : bnoValue
    				,b_name : b_name
    				,flag : 1
   			};
   			
   			$.ajax({
	            type: "post",
	            url: "/like/check",
	            data: JSON.stringify(like_info),
	            contentType: "application/json; charset=utf-8",
	            success: function (data) {
	            	if(data.check==0){
	            		//추가
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/insert",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data2) {
		    	                $('#content_likeCount').text(data2.like);
		    	                $('#content_dislikeCount').text(data2.dislike);
		    	                
		    	                $('#t_up').toggleClass('far');
		                		$('#t_up').toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("좋아요 에러2");
		    	            }
		    	        });//$.ajax({
	            	}else if(data.check==1 && data.value == 1){
	            		//삭제
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/delete",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data3) {
		    	                $('#content_likeCount').text(data3.like);
		    	                $('#content_dislikeCount').text(data3.dislike);
		    	                
		    	                $('#t_up').toggleClass('far');
		                		$('#t_up').toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("좋아요 에러3");
		    	            }
		            	});//$.ajax({
	            	}//if(data.check==0){
	            },
	            error: function(xhr, status, er){
	            	console.log("좋아요 에러4");
	            }
	        });//$.ajax({
   			
	        
   	    });//$(".content_likeBtn").click(function() {
   	    	
   	    	
   		$("#content_dislikeBtn").click(function() {
   			
   			if(replyer=='${board.id}'){
				swa("error","본인 게시글에는 사용 불가능합니다.");
				return;
			}
   			
   			//쿠키 체크, 좋아요는 5초에 1번
			if(getCookie('mpllck'+b_name+bnoValue)!=null){
				swa("error","좋아요/싫어요는 5초에 1번만 수정 가능합니다");
				return;
			}
   		
   			var like_info = {
    				id : replyer
    				,bno : bnoValue
    				,b_name : b_name
    				,flag : -1
   			};
   			
   			$.ajax({
	            type: "post",
	            url: "/like/check",
	            data: JSON.stringify(like_info),
	            contentType: "application/json; charset=utf-8",
	            success: function (data) {
	            	if(data.check==0){
	            		//추가
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/insert",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data2) {
		    	                $('#content_likeCount').text(data2.like);
		    	                $('#content_dislikeCount').text(data2.dislike);
		    	                
		    	                $('#t_down').toggleClass('far');
		                		$('#t_down').toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("좋아요 에러5");
		    	            }
		    	        });//$.ajax({
	            	}else if(data.check==1 && data.value == -1){
	            		//삭제
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/delete",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data3) {
		    	                $('#content_likeCount').text(data3.like);
		    	                $('#content_dislikeCount').text(data3.dislike);
		    	                
		    	                $('#t_down').toggleClass('far');
		                		$('#t_down').toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("좋아요 에러6");
		    	            }
		            	});//$.ajax({
	            	}//if(data.check==0){
	            },
	            error: function(xhr, status, er){
	            	console.log("좋아요 에러7");
	            }
	        });//$.ajax({
   	    });//$(".content_dislikeBtn").click(function() {
 </sec:authorize>
   	});//$(document).ready(function(){
   	</script>
	<!-- =================================================================================================  -->
   	<!-- end 게시글 좋아요 -->
   	<!-- =================================================================================================  -->
   	
   	
   	
	<!-- =================================================================================================  -->
   	<!-- start 댓글 좋아요 읽기 -->
   	<!-- =================================================================================================  -->
   	<script type="text/javascript">
   	function readReplyLike(){
   		
   		var bnoValue = '<c:out value="${board.bno}"/>';
	    var b_name = '${cri.b_name}';
	    var replyer = "";
	    <sec:authorize access="isAuthenticated()">
	    	replyer = '<sec:authentication property="principal.username"/>';   
	    </sec:authorize>
	    
	  	//좋아요 싫어요 읽기, 지금 로그인한 사람이 누른건지, 누른거면 엄지 색칠
	    $('.reply_likeBtn').each(function(){
	    	
	    	var rnoValueTemp = $(this).data('rno');
	    	//console.log("rnoValueTemp"+rnoValueTemp);
	    	//console.log("//////"+b_name+"//"+rnoValueTemp+"//"+replyer);
	    	$.getJSON("/like/read_reply/"+b_name+"/"+ rnoValueTemp + "/" + replyer +".json",
	                function (data) {
	                    //내가 체크했으면
	                    if(data.check==1){
	                    	if(data.value==1){
	                    		//좋아요
	                    		$('#rt_up'+rnoValueTemp).toggleClass('far');
	                    		$('#rt_up'+rnoValueTemp).toggleClass('fas');
	                    	}else{
	                    		//싫어요
	                    		$('#rt_down'+rnoValueTemp).toggleClass('far');
	                    		$('#rt_down'+rnoValueTemp).toggleClass('fas');
	                    	}//if
	                    }//if
	                    
	                }).fail(function(xhr,status,err) {
	                	console.log("댓글 좋아요 에러1");
			});//$.getJSON(
		});// $('.reply_likeBtn').each(function(){
	}//function
   	</script>
	<!-- =================================================================================================  -->
   	<!-- end 댓글 좋아요 읽기 -->
   	<!-- =================================================================================================  -->
   	
   	
   	
	<!-- =================================================================================================  -->
   	<!-- start 댓글 좋아요 -->
   	<!-- =================================================================================================  -->
   	<sec:authorize access="isAuthenticated()">
   	<script type="text/javascript">
   	$(document).ready(function(){
   		var bnoValue = '<c:out value="${board.bno}"/>';
	    var b_name = '${cri.b_name}';
	    var replyer = "";
	    <sec:authorize access="isAuthenticated()">
	    	replyer = '<sec:authentication property="principal.username"/>';   
	    </sec:authorize>
   		
	    
	    $(document).on('click','.reply_likeBtn2',function(){
	    	$(".reply_likeBtn").trigger("click");
	    });
	    
	    $(document).on('click','.reply_dislikeBtn2',function(){
	    	$(".reply_dislikeBtn").trigger("click");
	    });
	    
   		$(document).on('click','.reply_likeBtn',function(){
   			
   			var rnoValue = $(this).data('rno');
   			
   			if(replyer==$(this).data('id')){
				swa("error","본인 댓글에는 사용 불가능합니다.");
				return;
			}
   			//쿠키 체크, 좋아요는 5초에 1번
			if(getCookie('mpllck'+b_name+bnoValue)!=null){
				swa("error","좋아요/싫어요는 5초에 1번만 수정 가능합니다");
				return;
			}
   			
   			var like_info = {
    				id : replyer
    				,rno : rnoValue 
    				,b_name : b_name
    				,flag : 1
   			};
   			
   			
   			$.ajax({
	            type: "post",
	            url: "/like/check_reply",
	            data: JSON.stringify(like_info),
	            contentType: "application/json; charset=utf-8",
	            success: function (data) {
	            	if(data.check==0){
	            		//추가
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/insert_reply",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data2) {
		    	                $('#reply_likeCount'+rnoValue).text(data2.like);
		    	                $('#reply_dislikeCount'+rnoValue).text(data2.dislike);
		    	                
		    	                $('#rt_up'+rnoValue).toggleClass('far');
		                		$('#rt_up'+rnoValue).toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("댓글 좋아요 에러2");
		    	            }
		    	        });//$.ajax({
	            	}else if(data.check==1 && data.value == 1){
	            		//삭제
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/delete_reply",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data3) {
		    	                $('#reply_likeCount'+rnoValue).text(data3.like);
		    	                $('#reply_dislikeCount'+rnoValue).text(data3.dislike);
		    	                
		    	                $('#rt_up'+rnoValue).toggleClass('far');
		                		$('#rt_up'+rnoValue).toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("댓글 좋아요 에러3");
		    	            }
		            	});//$.ajax({
	            	}//if(data.check==0){
	            },
	            error: function(xhr, status, er){
	            	console.log("댓글 좋아요 에러4");
	            }
	        });//$.ajax({
   			
   		});//$(document).on('click','.reply_likeBtn',function(){
   		
   			
   		$(document).on('click','.reply_dislikeBtn',function(){
			var rnoValue = $(this).data('rno');
			
			if(replyer==$(this).data('id')){
				swa("error","본인 댓글에는 사용 불가능합니다.");
				return;
			}
			
   			//쿠키 체크, 좋아요는 5초에 1번
			if(getCookie('mpllck'+b_name+bnoValue)!=null){
				swa("error","좋아요/싫어요는 5초에 1번만 수정 가능합니다");
				return;
			}
   			
   			var like_info = {
    				id : replyer
    				,rno : rnoValue 
    				,b_name : b_name
    				,flag : -1
   			};
   			
   			
   			$.ajax({
	            type: "post",
	            url: "/like/check_reply",
	            data: JSON.stringify(like_info),
	            contentType: "application/json; charset=utf-8",
	            success: function (data) {
	            	if(data.check==0){
	            		//추가
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/insert_reply",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data2) {
		    	                $('#reply_likeCount'+rnoValue).text(data2.like);
		    	                $('#reply_dislikeCount'+rnoValue).text(data2.dislike);
		    	                
		    	                $('#rt_down'+rnoValue).toggleClass('far');
		                		$('#rt_down'+rnoValue).toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("댓글 좋아요 에러5");
		    	            }
		    	        });//$.ajax({
	            	}else if(data.check==1 && data.value == -1){
	            		//삭제
		            	$.ajax({
		    	            type: "post",
		    	            url: "/like/delete_reply",
		    	            data: JSON.stringify(like_info),
		    	            contentType: "application/json; charset=utf-8",
		    	            dataType : 'json',
		    	            success: function (data3) {
		    	                $('#reply_likeCount'+rnoValue).text(data3.like);
		    	                $('#reply_dislikeCount'+rnoValue).text(data3.dislike);
		    	                
		    	                $('#rt_down'+rnoValue).toggleClass('far');
		                		$('#rt_down'+rnoValue).toggleClass('fas');
		                		
		                		//쿠키생성
		            			setCookie('mpllck'+b_name+bnoValue, 'yes', 5);
		    	            },
		    	            error: function(xhr2, status2, er2){
		    	            	console.log("댓글 좋아요 에러6");
		    	            }
		            	});//$.ajax({
	            	}//if(data.check==0){
	            },
	            error: function(xhr, status, er){
	            	console.log("댓글 좋아요 에러7");
	            }
	        });//$.ajax({
   		});//$(document).on('click','.reply_dislikeBtn',function(){
   	});//$(document).ready(function(){
   	</script>
   	</sec:authorize>
	<!-- =================================================================================================  -->
   	<!-- end 댓글 좋아요 -->
   	<!-- =================================================================================================  -->
   	
   	
   	
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
