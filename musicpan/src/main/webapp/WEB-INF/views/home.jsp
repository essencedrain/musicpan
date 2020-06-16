<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="./includes/header.jsp"%>
    
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1 ">
		            </div>
		            
		            <div class="center_area col-lg-10">
		            	<%@include file="./includes/info_buttons.jsp"%>
		           		<div class="row">
		            		<div class="col-md-6 py-4">
		            			<h5 class="text-primary font-weight-bold"><a href="/board/free/list">자유게시판</a></h6>
		            			<table id="txVol" class="table table-sm text-left table-hover">
		            				<tbody>
		            					<c:forEach items="${boardFree}" var="list">
			            					<tr>
			            						<td class="txVol_text"><a href="/board/free/content/${list.bno}">&nbsp;${list.title}&nbsp;<span class="text-primary">${list.replyCnt>0?list.replyCnt:""}</span></a></td>
			            					</tr>	
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            		<div class="col-md-6 py-4">
		            			<h5 class="text-primary font-weight-bold"><a href="/board/analysis/list">정보·분석 게시판</a></h6>
		            			<table id="txVol" class="table table-sm text-left table-hover pr-3">
		            				<tbody>
		            					<c:forEach items="${boardAnalysis}" var="list">
			            					<tr>
			            						<td class="txVol_text"><a href="/board/analysis/content/${list.bno}">&nbsp;${list.title}&nbsp;<span class="text-primary">${list.replyCnt>0?list.replyCnt:""}</span></a></td>
			            					</tr>	
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            		
		            		
		            		<div class="col-md-6 py-4">
		            			<h5 class="font-weight-bold" style="color: #666">거래대금 TOP10 (24시간)<span class="float-right todayTime" style="font-size: 14px !important; padding-top: 8px; color: #666"></span></h6>
		            			<table id="txVol" class="table table-sm text-center">
		            				<thead class="font-weight-bold">
		            					<tr class="">
			            					<td class="txVol_text" style="width:8%">#</td>
			            					<td class="txVol_text" style="width:32%">곡명</td>
			            					<td class="txVol_text" style="width:32%">가수</td>
			            					<td class="txVol_text" style="width:28%">거래대금</td>
		            					</tr>
		            				</thead>
		            				<tbody>
		            					<c:set var="rowNum" value="1"/>
		            					<c:forEach items="${txVol24}" var="list">
		            					<tr>
	            						<c:choose>
	            							<c:when test="${rowNum==1}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/gold_medal.gif"></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_gold_td" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==2}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/silver_medal.gif"></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_silver_td" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==3}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/bronze_medal.gif"></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_bronze_td" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:otherwise>
	            								<td class="txVol_text" style="width:8%">${rowNum}</td>
	            								<td class="txVol_text" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
			            						<td class="txVol_text" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:otherwise>
	            						</c:choose>
		            					</tr>	
		            					<c:set var="rowNum" value="${rowNum+1}"/>
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            		<div class="col-md-6 py-4">
		            			<h5 class="font-weight-bold" style="color: #666">거래대금 TOP10 (1주일)<span class="float-right todayTime" style="font-size: 14px !important; padding-top: 8px; color: #666"></span></h6>
		            			<table id="txVol" class="table table-sm text-center">
		            				<thead class="font-weight-bold">
		            					<tr class="">
			            					<td class="txVol_text" style="width:8%">#</td>
			            					<td class="txVol_text" style="width:32%">곡명</td>
			            					<td class="txVol_text" style="width:32%">가수</td>
			            					<td class="txVol_text" style="width:28%">거래대금</td>
		            					</tr>
		            				</thead>
		            				<tbody>
		            					<c:set var="rowNum" value="1"/>
		            					<c:forEach items="${txVolWeek}" var="list">
		            					<tr>
	            						<c:choose>
	            							<c:when test="${rowNum==1}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/gold_medal.gif"></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_gold_td" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==2}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/silver_medal.gif"></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_silver_td" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==3}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/bronze_medal.gif"></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_bronze_td" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:otherwise>
	            								<td class="txVol_text" style="width:8%">${rowNum}</td>
	            								<td class="txVol_text" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
			            						<td class="txVol_text" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
	            							</c:otherwise>
	            						</c:choose>
		            					</tr>	
		            					<c:set var="rowNum" value="${rowNum+1}"/>
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            		
		            		<div class="col-md-6 py-4">
		            			<h5 class="font-weight-bold" style="color: #666">거래수량 TOP10 (24시간)<span class="float-right todayTime" style="font-size: 14px !important; padding-top: 8px; color: #666"></span></h6>
		            			<table id="txVol" class="table table-sm text-center">
		            				<thead class="font-weight-bold">
		            					<tr class="">
			            					<td class="txVol_text" style="width:8%">#</td>
			            					<td class="txVol_text" style="width:32%">곡명</td>
			            					<td class="txVol_text" style="width:32%">가수</td>
			            					<td class="txVol_text" style="width:28%">거래수량</td>
		            					</tr>
		            				</thead>
		            				<tbody>
		            					<c:set var="rowNum" value="1"/>
		            					<c:forEach items="${txUnit24}" var="list">
		            					<tr>
	            						<c:choose>
	            							<c:when test="${rowNum==1}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/gold_medal.gif"></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_gold_td" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==2}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/silver_medal.gif"></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_silver_td" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==3}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/bronze_medal.gif"></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_bronze_td" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:otherwise>
	            								<td class="txVol_text" style="width:8%">${rowNum}</td>
	            								<td class="txVol_text" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
			            						<td class="txVol_text" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:otherwise>
	            						</c:choose>
		            					</tr>	
		            					<c:set var="rowNum" value="${rowNum+1}"/>
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            		<div class="col-md-6 py-4">
		            			<h5 class="font-weight-bold" style="color: #666">거래수량 TOP10 (1주일)<span class="float-right todayTime" style="font-size: 14px !important; padding-top: 8px; color: #666"></span></h6>
		            			<table id="txVol" class="table table-sm text-center">
		            				<thead class="font-weight-bold">
		            					<tr class="">
			            					<td class="txVol_text" style="width:8%">#</td>
			            					<td class="txVol_text" style="width:32%">곡명</td>
			            					<td class="txVol_text" style="width:32%">가수</td>
			            					<td class="txVol_text" style="width:28%">거래수량</td>
		            					</tr>
		            				</thead>
		            				<tbody>
		            					<c:set var="rowNum" value="1"/>
		            					<c:forEach items="${txUnitWeek}" var="list">
		            					<tr>
	            						<c:choose>
	            							<c:when test="${rowNum==1}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/gold_medal.gif"></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_gold_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_gold_td" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==2}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/silver_medal.gif"></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_silver_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_silver_td" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:when test="${rowNum==3}">
	            								<td class="txVol_text" style="width:8%"><img src="/resources/level_icon/bronze_medal.gif"></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
	            								<td class="txVol_text txVol_bronze_td" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text txVol_bronze_td" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:when>
	            							<c:otherwise>
	            								<td class="txVol_text" style="width:8%">${rowNum}</td>
	            								<td class="txVol_text" style="width:32%"><a href="https://www.musicow.com/song/${list.idx}"  target='_blank'>${list.song}</a></td>
			            						<td class="txVol_text" style="width:32%">${list.singer}</td>
			            						<td class="txVol_text" style="width:28%"><fmt:formatNumber value="${list.units}" pattern="#,###" /></td>
	            							</c:otherwise>
	            						</c:choose>
		            					</tr>	
		            					<c:set var="rowNum" value="${rowNum+1}"/>
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            	</div>
		            	
		            	<div class="heading pb-5">
		            		<div class="line"></div>
		            		<!-- 
		                	<h2><a class="text-primary font-weight-bold" href="/tables/tauTable1">-> 타우테이블 V1 <-</a></h2>
		                	<h2><a class="text-danger font-weight-bold" href="/tables/tauTable2">-> 타우테이블 V2 <-</a></h2>
		                	<br>
		                	<h5>타우테이블은 뮤지카우에 상장된 곡들의 데이터를 효과적으로 보여줍니다.</h5>
		                	<h5>현재 타우테이블은 개발중이며 V1, V2 두가지 버전으로 테스트 가능합니다.</h5>
		                	<h5>지금 회원가입하고 로그인하여 이용해보세요!</h5>
		                	<h5 class="text-danger">테스트 기간중 비회원도 이용가능</h5>
		                	<br>
		                	<h6>(아래 사진은 예시입니다.)</h6>
		                	
							<img class="img-fluid" src="/resources/img/main_img.jpg">				
				            <div class="line"></div>
				             -->
				            <!-- 
				            <h2>메뉴보시면 자유게시판도 있습니다.</h2>
							<p>메인화면 준비중</p>
				
				            <div class="line"></div>
				
				            <h2>메인화면 준비중2</h2>
				            <p>메인화면 준비중</p>
				
				            <div class="line"></div>
				            
				            <h2>메인화면 준비중3</h2>
				            <p>메인화면 준비중</p>
				             -->
		                </div>
		            </div>
		            
		            <div class="right_area col-lg-1 ">
	           	 	</div>
	            
	            </div>
            </div>
            
            <%@include file="./includes/htmlFooter.jsp"%>
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
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ JS ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

<script type="text/javascript">
let today = new Date();   
let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let date = today.getDate();  // 날짜
let day = today.getDay();  // 요일
let hours = today.getHours(); // 시
let minutes = today.getMinutes();  // 분
let seconds = today.getSeconds();  // 초
$('.todayTime').text("("+
		month
		+ '.' + date
		+ " " + (hours < 9 ? "0"+hours : hours)
		+ ':' + (minutes < 9 ? "0"+minutes : minutes)
		+ ':' + (seconds < 9 ? "0"+seconds : seconds)+ " 기준)");

</script>


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
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ JS ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->



<%@include file="./includes/footer.jsp"%>
