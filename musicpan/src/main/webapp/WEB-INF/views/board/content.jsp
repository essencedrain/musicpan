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
					                        <td style="width: 10%;" class="list_else">${board2.modiDate}</td>
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
    	
	
    	showList(1, bnoValue, b_name);
    	
    	//리스트 갱신/보여주기 showList()
    	
    	
    	var reply_textarea = $('#reply_textarea'); //댓글등록textarea
    	var reply_registerBtn = $('#reply_registerBtn'); //댓글등록버튼
    	
    	//게시물 등록
    	reply_registerBtn.on("click", function(e){
    		
    		var reply = {
    				reply : reply_textarea.val()
    				,id : replyer
    				,bno : bnoValue
   			};
    		replyService.add(reply, b_name, function(result){
    			showList(1, bnoValue, b_name);
   			});
    		
    	});//reply_registerBtn.on
    	
    	
    	
    	/*
    	replyService.get(10, b_name, function(data){
    		console.log(data);
    	});
    	
    	replyService.update({
    		rno : 10
    		,bno : bnoValue
    		,reply : "수정된 댓글"
    		}
	    	,b_name
	    	,function(result){
	    		alert("수정완료");
    	});
    	replyService.remove(16, b_name, function(count){
    			console.log(count);
    			if(count==="success"){
    				alert("지움");
    			}
    	}, function(err){
    		alert("에러");
    	});
    	
    	replyService.getList({bno:bnoValue, page:1, b_name:b_name}, function(list){
    		for(var i=0, len = list.length||0; i<len; i++){
    			console.log(list[i]);
    		}
    	});
    	
	    replyService.add(
	    		{reply: "ajax 삽입 테스트", id: replyer, bno: bnoValue}
	    		,b_name
	    		,function(result){
	    			alert("결과 : " + result);
	   			}
	    );
    	*/
    });
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
    function showList(page, bnoValue, b_name){
		
    	
    	var authId = "";
    	<sec:authorize access="isAuthenticated()">
    		authId = "${pinfo.username}";
    	</sec:authorize>
    	
	    replyService.getList({bno:bnoValue, page:page||1, b_name:b_name}, function(list){
	        var str="";
	        
	        if(list == null || list.length == 0){
	        	$('.card_area').html("");
	            return;
	        }//if

	        for(var i =0, len=list.length || 0; i<len; i++){
	        	
	        	if(list[i].reply_step > 0 ){
	        		str += '<div class="card mb-2 ml-5">';//대댓글
	        	}else{
		            str += '<div class="card mb-2">';//일반 댓글
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
						str += '<div class="card-text">'+ list[i].reply +'</div>';
    	            	str += '<div class="card-body-under d-flex justify-content-end align-items-center">';
    	            		str += '<span class="span_class2"><i class="far fa-thumbs-up"></i></span>';
    	            		str += '<span class="span_class">0</span>';//좋아요
		    	            str += '<span class="span_class2"><i class="far fa-thumbs-down"></i></span>';
		    	            str += '<span class="span_class">0</span>';//싫어요
							if(authId==list[i].id){
		    	            str += '<span class="span_class4"><i class="fas fa-grip-lines-vertical"></i></span>';
		    	            if(list[i].reply_step == 0 ){str += '<button type="button" class="btn btn-link btn-sm span_class3 pl-0 pr-2" onclick="openReReply(this,'+list[i].rno+')">댓글</button>';}
    	            		str += '<div class="dropleft">';
    	            			str += '<button type="button" class="btn btn-light btn-sm dropdown-toggle-split" data-toggle="dropdown"><i class="fas fa-ellipsis-h"></i></button>';
    	            			str += '<div class="dropdown-menu">';
    	            					str += '<a class="dropdown-item px-2 w-100" onclick="replyUpdateBtn('+list[i].rno+')"><i class="fas fa-file-signature i_size"></i>&nbsp;수정</a><div class="dropdown-divider"></div>';
    				    	            str += '<a class="dropdown-item px-2 w-100" onclick="replyDeleteBtn('+list[i].rno+')"><i class="far fa-trash-alt i_size"></i>&nbsp;삭제</a><div class="dropdown-divider"></div>';
    				    	            str += '<a class="dropdown-item px-2 w-100 onclick=""><i class="far fa-angry i_size"></i>&nbsp;신고</a>';	
    	            			str += '</div>';//div class="dropdown-menu
							}//if
   	            			str += '</div>';//<div class="dropleft">
            			str += '</div>';//div class="card-body-under
        			str += '</div>';//<div class="card-body pt-1 pb-1 pl-3 pr-1">
	            str += '</div>';//<div class="card mb-2 ml-5">
	            str += '<div class="subReply ml-5"></div>';
	        }//for

	        $('.card_area').html(str);

	    });//getList
	}//showList
    </script>
	<!-- =================================================================================================  -->
    <!-- end 댓글 리스트 보여주기 showList -->
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
				openReReplyStr += '<button id="subReply_registerBtn" class="btn btn-outline-secondary btn-sm text-center" onclick="registerReReply('+rno+')">등록</button>';
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
    function registerReReply(rno){
    	var bnoValue2 = '<c:out value="${board.bno}"/>';
	    var b_name2 = '${cri.b_name}';
	    var replyTemp2 = $('#subReply_textarea').val();
	    
	    var replyer2 = "";
	    <sec:authorize access="isAuthenticated()">
	    	replyer2 = '<sec:authentication property="principal.username"/>';   
	    </sec:authorize>
    
    	console.log(bnoValue2 + " // " + b_name2 + " // " + replyer2 + "//" + rno);
    	
   		var reply2 = {
   				reply : replyTemp2
   				,id : replyer2
   				,bno : bnoValue2
   				,rno : rno
		};
   		
   		replyService.addRe(reply2, b_name2, function(result){
   			showList(1, bnoValue2, b_name2);
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
    	swa("success",'엌ㅋㅋ수정ㅋㅋ'+rno);
    }
    </script>
    <!-- =================================================================================================  -->
    <!-- end 댓글 수정버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    
    
    <!-- =================================================================================================  -->
    <!-- start 댓글 수정버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
    <script type="text/javascript">
    function replyDeleteBtn(rno){
    	swa("success",'엌ㅋㅋ삭제ㅋㅋ'+rno);
    }
    </script>
    <!-- =================================================================================================  -->
    <!-- end 댓글 수정버튼 클릭 펑션 -->
    <!-- =================================================================================================  -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
