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
		                	<h3 class="board_heading"><a href="/tables/auctionInfo">옥션 정보</a></h3>
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
		            	<div class="pb-2"></div>
		            	
            			
		           		<div class="row">
		           			<c:forEach items="${auctionList}" var="auction">
		            			
		            			<div class="col-md-6 py-4">
			            			<table class="txVol table table-sm text-center">
			            				<thead class="font-weight-bold">
			            					<tr class="">
				            					<td class="txVol_text align-middle" colspan="5" style="height: 132px">
				            						<a href="https://www.musicow.com/auction/${auction.idx}" target="_blank"><img class="float-left" style="width: 120px !important; height: 120px !important;" src="${auction.song_img3}"></a>
				            						<a href="https://www.musicow.com/auction/${auction.idx}" target="_blank"><h4 class="text-left font-weight-bold">&nbsp;&nbsp;${auction.song}</h4></a>
				            						<h5 class="text-left font-weight-bold">&nbsp;&nbsp;${auction.singer}</h5>
				            						<h5 class="text-left font-weight-bold text-danger">&nbsp;&nbsp;${auction.txt_time_left}</h5>
				            						<h6 class="text-left font-weight-bold" style="color:#999">&nbsp;&nbsp;업데이트 : <fmt:formatDate value="${auction.updatedate}" pattern="HH:mm:ss"/></h6>
				            					</td>
			            					</tr>
			            					<tr>
			            						<td colspan="5" class="" style="color:#999">
			            							&nbsp;&nbsp;옥션 수량 : <fmt:formatNumber value="${auction.totalunits}" pattern="#,###" />주 / 시작가 : <fmt:formatNumber value="${auction.startprice}" pattern="#,###" />원
			            						</td>
			            					</tr>
			            					<tr class="">
				            					<td class="txVol_text" style="width:20%">가격</td>
				            					<td class="txVol_text" style="width:20%">입찰</td>
				            					<td class="txVol_text" style="width:20%">누적</td>
				            					<td class="txVol_text" style="width:20%">여유</td>
				            					<td class="txVol_text" style="width:20%">수익</td>
			            					</tr>
			            				</thead>
			            				<tbody>
			            					<c:set var="rowNum" value="1"/>
			            					<c:forEach items="${auction.bidInfo}" var="list">
		            							<tr class="${rowNum==5?"text-danger font-weight-bold":""} ${rowNum==4?"text-info font-weight-bold":""}">
			           								<td class="txVol_text" style="width:25%"><fmt:formatNumber value="${list[0]}" pattern="#,###" /></td>
			           								<td class="txVol_text" style="width:25%"><fmt:formatNumber value="${list[1]}" pattern="#,###" /></td>
				            						<td class="txVol_text" style="width:25%"><fmt:formatNumber value="${list[2]}" pattern="#,###" /></td>
				            						<td class="txVol_text" style="width:25%"><fmt:formatNumber value="${list[3]}" pattern="#,###" /></td>
				            						<td class="txVol_text" style="width:25%"><fmt:formatNumber value="${list[4]}" pattern=".0" />%</td>
				            					</tr>
				            				<c:set var="rowNum" value="${rowNum+1}"/>
			            					</c:forEach>	
			            				</tbody>
			            			</table>
		            			</div>
		            		
		            			
		            		</c:forEach>
		           			
		            	</div>
		            	
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
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
