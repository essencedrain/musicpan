<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- amcharts -->
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
<!-- amcharts -->
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1">
		            </div>
		            
		            <div class="center_area col-lg-10" >
		            
		            	<div class="mb-4 pb-4 board_1200banner_bot_930">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253342 });
							</script>
		            	</div>
		            	<div class="mb-4 pb-4 board_993banner_bot_780">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253345 });
							</script>
		            	</div>
		            	<div class="mb-4 pb-4 board_768banner_bot_700">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253348 });
							</script>
		            	</div>
		            	<div class="mb-4 pb-4 board_551banner_bot_520">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253352 });
							</script>
		            	</div>
		            	<div class="mb-4 pb-4 board_550banner_bot_320 text-center">
		            		<script src="https://ads-partners.coupang.com/g.js"></script>
							<script>
								new PartnersCoupang.G({ id:253356 });
							</script>
		            	</div>
		            
		            
		            	<div class="pt-3 pb-4">
		                	<h3 class="board_heading"><a href="/chart/idx/${songBasic.idx}">가격·거래량 차트 <i class="fas fa-sync-alt"></i></a></h3>
		                </div>
	                	<h4 class="text-danger font-weight-bold pb-4"><a href="https://www.musicow.com/song/${songBasic.idx}" target="_blank">${songBasic.song} / ${songBasic.singer} <i class="fas fa-external-link-alt"></i></a></h4>
		                
		                
		            	<div id="chartdiv" class="pb-4 mb-4" style="width: 100%; height: 500px;"></div>
		            	
		            	
		            	<div class="pb-5 mb-5">
		            		<table class="table table-bordered">
		            			<tr class="table-secondary text-center font-weight-bold">
		                			<td colspan="2" class="text-nowrap">곡 정보</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">곡명 / 가수</td>
		                			<td class="text-nowrap">${songBasic.song} / ${songBasic.singer}</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">작곡가</td>
		                			<td class="text-nowrap">${songBasic.composer}</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">작사가</td>
		                			<td class="text-nowrap">${songBasic.lyricist}</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">편곡가</td>
		                			<c:choose>
		                				<c:when test="${songBasic.arranger.length() > 0}">
		                					<td class="text-nowrap">${songBasic.arranger}</td>
		                				</c:when>
		                				<c:otherwise>
		                					<td class="text-nowrap">없음</td>
		                				</c:otherwise>
		                			</c:choose>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">공표일</td>
		                			<td class="text-nowrap"><fmt:formatDate value="${songBasic.releasedate}" type="date" dateStyle="full" /></td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">형태</td>
		                			<c:choose>
		                				<c:when test="${songBasic.copyRight==1}">
		                					<td class="text-nowrap">저작권</td>
		                				</c:when>
		                				<c:otherwise>
		                					<td class="text-nowrap">인접권</td>
		                				</c:otherwise>
		                			</c:choose>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">2차저작물작성권</td>
		                			<c:choose>
		                				<c:when test="${songBasic.secRight==1}">
		                					<td class="text-nowrap">O</td>
		                				</c:when>
		                				<c:otherwise>
		                					<td class="text-nowrap">X</td>
		                				</c:otherwise>
		                			</c:choose>
		                		</tr>
		            		</table>
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
<!-- amcharts -->
<script>
//Themes begin
am4core.useTheme(am4themes_animated);

var chart = am4core.create("chartdiv", am4charts.XYChart);

//Add data 
var dataC = ${historyIdx};

chart.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";

dataC.forEach(function (row, index) {
	  row.date = new Date(row.date);
	  dataC[index] = row;
	});

chart.data = dataC;
let dateAxis = chart.xAxes.push(new am4charts.DateAxis());
//dateAxis.renderer.grid.template.location = 0;
dateAxis.cursorTooltipEnabled = false;

dateAxis.startLocation = -2;
dateAxis.endLocation = 2;
dateAxis.renderer.minGridDistance = 100;
dateAxis.dateFormats.setKey("year", "yyyy");
dateAxis.dateFormats.setKey("month", "yyyy-MM");
dateAxis.dateFormats.setKey("week", "yyyy-MM-dd");
dateAxis.dateFormats.setKey("day", "yyyy-MM-dd");
dateAxis.dateFormats.setKey("hour", "MM-dd HH");
dateAxis.dateFormats.setKey("minute", "dd HH:mm");
dateAxis.dateFormats.setKey("second", "HH:mm:ss");

dateAxis.periodChangeDateFormats.setKey("year", "yyyy");
dateAxis.periodChangeDateFormats.setKey("month", "yyyy-MM");
dateAxis.periodChangeDateFormats.setKey("week", "yyyy-MM-dd");
dateAxis.periodChangeDateFormats.setKey("day", "yyyy-MM-dd");
dateAxis.periodChangeDateFormats.setKey("hour", "MM-dd HH");
dateAxis.periodChangeDateFormats.setKey("minute", "dd HH:mm");
dateAxis.periodChangeDateFormats.setKey("second", "HH:mm:ss");

dateAxis.groupData = true;
/*
dateAxis.baseInterval = {
		  "timeUnit": "minute",
		  "count": 1
		}
*/


let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis.cursorTooltipEnabled = false;
valueAxis.extraMax = 0.5; 
//valueAxis.extraMin = 0.1; 

var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());
valueAxis2.cursorTooltipEnabled = false;
valueAxis2.min = 0;
valueAxis2.syncWithAxis = valueAxis;
valueAxis2.renderer.opposite = true;
valueAxis2.maxPrecision = 0;
valueAxis2.extraMax = 0.5;

// Create series
/*
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "hisprice";
series.dataFields.dateX = "date";
series.yAxis = valueAxis;
//series.bullets.push(new am4charts.CircleBullet());
series.strokeWidth = 3;
series.tooltipText = "{dateX}\n가격 : [bold]{valueY}[/]";

var series2 = chart.series.push(new am4charts.ColumnSeries());
series2.dataFields.valueY = "hisunit";
series2.dataFields.dateX = "date";
series2.yAxis = valueAxis2;
series2.groupFields.valueY = "sum";
series2.tooltipText = "거래수량 : [bold]{valueY}[/]";
*/

var series = chart.series.push(new am4charts.ColumnSeries());
series.dataFields.valueY = "hisunit";
series.dataFields.dateX = "date";
series.yAxis = valueAxis2;
series.groupFields.valueY = "sum";
series.tooltipText = "거래수량 : [bold]{valueY}[/]";

var series2 = chart.series.push(new am4charts.LineSeries());
series2.dataFields.valueY = "hisprice";
series2.dataFields.dateX = "date";
series2.yAxis = valueAxis;
//series.bullets.push(new am4charts.CircleBullet());
series2.strokeWidth = 3;
series2.tooltipText = "{dateX}\n가격 : [bold]{valueY}[/]";





//Create scrollbars
chart.scrollbarX = new am4core.Scrollbar();
chart.scrollbarX.parent = chart.bottomAxesContainer;
//chart.scrollbarX.scale =0.5;
//chart.scrollbarX.thumb.minWidth = 50;
chart.cursor = new am4charts.XYCursor();
</script>
<!-- amcharts -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
