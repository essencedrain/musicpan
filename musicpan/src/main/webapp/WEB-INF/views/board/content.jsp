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
						<div class="mt-5 pt-3 pb-3">
		                	<h3 class="board_heading"><a href="/board/${pageMaker.cri.b_name}/list">${pageMaker.cri.b_name2} 게시판</a></h3>
		                </div>
		            	<div class="mt-3">
		            		<sec:authorize access="isAuthenticated()">
			            		<div class="py-2 d-flex justify-content-between">
			            			<button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#searchModal"><i class="fas fa-search"></i></button>
				            		<button type="button" class="btn btn-outline-primary btn-sm text-center writeBtn">글쓰기</button>
			            		</div>
		            		</sec:authorize>
		            		<table class="table table-sm table-hover table_gtx">
		            			<thead class="text-center">
			            			<tr>
				                        <th class="td_pc" style="width: 5%;">번호</td>
				                        <th class="td_pc" style="width: 65%;">제목</td>
				                        <th class="td_pc" style="width: 15%;">글쓴이</td>
				                        <th class="td_pc" style="width: 10%;">등록일</td>
				                        <th class="td_pc" style="width: 5%;">조회수</td>
				                    </tr>
			                    </thead>
                    			<tbody class="text-center">
                    				<c:set var="rowNum" value="${pageMaker.startRow}"/>
                    				<c:forEach items="${list}" var="board2">
		                    			<tr>
		                    				<td class = 'list_rowNum td_pc ${board.bno==board2.bno?"text-primary":""}' style="width: 5%;">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":rowNum}</td>
	                    					<td style="width: 65%;" class="text-left list_else td_pc ${board.bno==board2.bno?"text-primary":"text-secondary" }">
	                    						<a class="move" href="${board2.bno}">
					                        		<span class="main_title">${board2.title}</span>
					                        		<span class="list_replyCnt">&nbsp;&nbsp;${board2.replyCnt>0?board2.replyCnt:""}</span>
					                        	</a>
	                    					</td>
					                        <td style="width: 15%;" class="text-left list_else td_pc"><img src="/resources/level_icon/${board2.grade}.gif"> ${board2.name}</td>
					                        <td style="width: 10%;" class="list_else td_pc">${board2.modiDate}</td>
					                        <td style="width: 5%;" class="list_else td_pc">${board2.hit}</td>
					                        
					                        <td class="td_mo py-2 d-none" style="width: 100%;">
					                        	<div class="mo_main py-1 d-flex justify-content-start">
					                        		<a class="move" href="${board2.bno}">
							                        	<div class="text-left ${board.bno==board2.bno?"text-primary":"" }">
							                        		<span class="main_title">${board.bno==board2.bno?"<i class='fas fa-arrow-right'></i>":""}&nbsp;${board2.title}</span>
							                        		<span class="list_replyCnt">&nbsp;&nbsp;${board2.replyCnt>0?board2.replyCnt:""}</span>
						                        		</div>
					                        		</a>
					                        	</div>
					                        	<div class="mo_sub d-flex justify-content-between">
					                        		<div><i class="far fa-clock"></i> ${board2.modiDate}</div>  <div><img src="/resources/level_icon/${board2.grade}.gif"> ${board2.name}</div>
					                        	</div>
					                        </td>
		                    			</tr>
		                    		<c:set var="rowNum" value="${rowNum-1}"/>
	                    			</c:forEach>
                    			</tbody>
		            		</table>
							
							<ul class="pagination justify-content-end">
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
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					      </div>
					    </div>
					  </div>
					</div>
	            	<!-- =================================================================================================  -->
	            	<!-- end 모달 -->
	            	<!-- =================================================================================================  -->
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
  <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ js ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
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
    		console.log(oriStr.length);
    		//유효성 체크
    		if($.trim(oriStr) =="" || $.trim(oriStr).length ==0){
    			swa("error","댓글 내용을 작성해주세요");
    			return;
    		}
    		
    		//쿠키 체크, 댓글은 1분에 1개
			if(getCookie('mplrck'+b_name+bnoValue)!=null){
				swa("error","한 게시물에 댓글은 1분에 1개만 작성가능합니다");
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
    			setCookie('mplrck'+b_name+bnoValue, 'yes', 60);
    			showList(-1, bnoValue, b_name, 2, 0);
   			});
    		
    	});//reply_registerBtn.on
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
	            return;
	        }//if

	        for(var i =0, len=list.length || 0; i<len; i++){
	        	if(i==0){scroll1st=list[i].rno}
	        	if(i+1==len){scrollLast=list[i].rno}
	        	if(list[i].rno==rnoReply){scrollReply=list[i].rno}
	        	
	        	if(list[i].reply_step > 0 ){
	        		str += '<div class="card mb-2 ml-5" id="spy_'+list[i].rno+'" data-page="'+page+'">';//대댓글
	        	}else{
		            str += '<div class="card mb-2" id="spy_'+list[i].rno+'" data-page="'+page+'">';//일반 댓글
	        	}	
					if(authId==list[i].id){
						str += '<div class="card-header card_bg py-1 pl-3">';
					}else{
						str += '<div class="card-header py-1 pl-3">';
					}
		            		str += '<div class="d-flex">';
			    	            str += '<img src="/resources/level_icon/'+ list[i].grade +'.gif">';//grade
			    	            str += '<span class="card-user-name">'+ list[i].name +'</span>';
			    	            str += '<span class="card-user-time ml-auto">'+  replyService.displayTime(list[i].regdate) +'</span>';
							str += '</div>';//'<div class="d-flex">
	            		str += '</div>';//<div class="card-header py-1 pl-3">'
	            	str += '<div class="card-body pt-1 pb-1 pl-3 pr-1">';
	            		if(list[i].del_flag == -1){
	            			str += '<div class="card-text">[-- 삭제된 댓글입니다 --]</div>';	            			
	            		}else{
	            			str += '<div id="reply_'+list[i].rno+'" class="card-text">'+ list[i].reply +'</div>';	
	            		}
    	            	str += '<div class="card-body-under d-flex justify-content-end align-items-center">';
    	            		str += '<span class="span_class2"><i class="far fa-thumbs-up"></i></span>';
    	            		str += '<span class="span_class">0</span>';//좋아요
		    	            str += '<span class="span_class2"><i class="far fa-thumbs-down"></i></span>';
		    	            str += '<span class="span_class">0</span>';//싫어요
		    	            
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

	        
	        //자동스크롤링
	        
	        if(scrollFlag==1){//최상단
		        var position = $("#spy_"+scroll1st).offset();
		        $('html, body').animate({scrollTop : position.top-150}, 500);
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
		
		//쿠키 체크, 댓글은 1분에 1개
		if(getCookie('mplrck'+b_name2+bnoValue2)!=null){
			swa("error","한 게시물에 댓글은 1분에 1개만 작성가능합니다");
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
	    
	    Swal.fire({
			  title: '댓글을 수정 하시겠습니까?',
			  icon: 'info',
			  showCancelButton: true,
			  confirmButtonColor: '#007bff',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '수정',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
			    //수정처리시작
			    $("#replyForm").find("input[name='rno']").val( rno );
			    $("#replyForm").find("input[name='reply']").val( $('#reply_'+rno).text() );
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
	    
	    Swal.fire({
			  title: '정말 삭제하시겠습니까?',
			  text: "삭제된 댓글은 복구가 어렵습니다.",
			  icon: 'warning',
			  showCancelButton: true,
			  confirmButtonColor: '#007bff',
			  cancelButtonColor: '#d33',
			  confirmButtonText: '삭제',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
			    //삭제처리시작
				  replyService.remove(rno, b_name, function(count){
						console.log(count);
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
			
	    }
	    
	  	//35글자 이상 ellipsis
		$('.main_title').each(function(){
			if($(this).text().length>35){
				$(this).text($(this).text().substring(0,35)+"...");
			}
		});
	</script>
	<!-- =================================================================================================  -->
    <!-- end 모바일전환 / 타이틀 ellipsis -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
