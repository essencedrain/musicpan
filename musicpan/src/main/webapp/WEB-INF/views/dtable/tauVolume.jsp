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
	            
	            	<div class="left_area col-lg-1">
		            </div>
		            
		            <div class="center_area col-lg-10">
		            	<div class="pb-3">
		                	<h3 class="board_heading"><a href="/tables/volume">거래량 정보</a></h3>
		                	<!--  <div id="example-table"></div>-->
		                </div>
		                <%@include file="../includes/info_buttons.jsp"%>
		                <div class="py-2"></div>
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
		            	<div class="pb-5"></div>
		            	
           				<h4 class="board_heading pb-3">기준시간 : <fmt:formatDate value="${updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></h4>
            			
		           		<div class="row">
		           			<c:forEach items="${timeArray}" var="time">
		            			
		            			<div id="${time[0]}" class="col-md-6 py-4">
			            			<h5 class="text-info font-weight-bold">거래대금 (${time[1]})<span class="float-right todayTime" style="font-size: 14px !important; padding-top: 8px; color: #666"></span></h6>
			            			<table class="txVol table table-sm text-center">
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
			            					<c:forEach items="${txVol[time[0]]}" var="list">
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
			            			<h5 class="text-success font-weight-bold">거래수량 (${time[1]})<span class="float-right todayTime" style="font-size: 14px !important; padding-top: 8px; color: #666"></span></h6>
			            			<table class="txVol table table-sm text-center">
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
			            					<c:forEach items="${txUnit[time[0]]}" var="list">
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
		            			
		            		</c:forEach>
		           			
		            	</div>
		            	
		            	<h4 class="board_heading pt-2">기준시간 : <fmt:formatDate value="${updatedate}" pattern="yyyy-MM-dd HH:mm:ss"/></h4>
		            	
		            	<div class="heading">
		            		<div class="line"></div>
		                </div>
		                
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
		            </div>
		            
		            <div class="right_area col-lg-1">
	           	 	</div>
	            
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
	
	$('.back-to-top-tauVolume').fadeIn();
	
		// 최상단
		$('#back-to-top-tauVolume1').click(function () {
			$('body,html').animate({
				scrollTop: 0
			}, 500);
			return false;
		});
		
		// 10분
		$('#back-to-top-tauVolume2').click(function () {
			$('body,html').animate({
				scrollTop: $("#20m").offset().top
			}, 500);
			return false;
		});
	
		// 1시간
		$('#back-to-top-tauVolume3').click(function () {
			$('body,html').animate({
				scrollTop: $("#1h").offset().top
			}, 500);
			return false;
		});
	
		// 4시간
		$('#back-to-top-tauVolume4').click(function () {
			$('body,html').animate({
				scrollTop: $("#4h").offset().top
			}, 500);
			return false;
		});
	
		// 24시간
		$('#back-to-top-tauVolume5').click(function () {
			$('body,html').animate({
				scrollTop: $("#24h").offset().top
			}, 500);
			return false;
		});
		
		// 1주일
		$('#back-to-top-tauVolume6').click(function () {
			$('body,html').animate({
				scrollTop: $("#Week").offset().top
			}, 500);
			return false;
		});
		
		// 1달
		$('#back-to-top-tauVolume7').click(function () {
			$('body,html').animate({
				scrollTop: $("#Month").offset().top
			}, 500);
			return false;
		});
});
</script>
<!-- =================================================================================================  -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
