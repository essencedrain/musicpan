<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- amcharts -->
<script src="//www.amcharts.com/lib/4/core.js"></script>
<script src="//www.amcharts.com/lib/4/charts.js"></script>
<!-- amcharts -->
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1">
		            </div>
		            
		            <div class="center_area col-lg-10" >
		            
		            	<div id="chartdiv" style="width: 100%; height: 400px;"></div>
		            	
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

var chart = am4core.create("chartdiv", am4charts.XYChart);

//Add data 
var dataC = [{
  "date": "2018-11-27 12:03:16",
  "litres": 24350,
  "units" : 4
}, {
  "date": "2019-09-04 13:09:52",
  "litres": 17700,
  "units" : 1
}, {
  "date": "2019-11-06 20:02:55",
  "litres": 16500,
  "units" : 2
}, {
	  "date": "2019-11-06 20:04:55",
	  "litres": 14500,
	  "units" : 2
}];

chart.dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss";

dataC.forEach(function (row, index) {
	  row.date = new Date(row.date);
	  dataC[index] = row;
	});

chart.data = dataC;
let dateAxis = chart.xAxes.push(new am4charts.DateAxis());
dateAxis.groupData = true;
dateAxis.baseInterval = {
		  "timeUnit": "minute",
		  "count": 1
		}



let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
var valueAxis2 = chart.yAxes.push(new am4charts.ValueAxis());

// Create series
var series = chart.series.push(new am4charts.LineSeries());
series.dataFields.valueY = "litres";
series.dataFields.dateX = "date";
series.bullets.push(new am4charts.CircleBullet());
series.tooltipText = "{dateX}: [b]{valueY}[/]";

var series2 = chart.series.push(new am4charts.ColumnSeries());
series2.dataFields.valueY = "units";
series2.dataFields.dateX = "date";
series2.yAxis = valueAxis2;
series2.groupFields.valueY = "sum";
chart.cursor = new am4charts.XYCursor();
</script>
<!-- amcharts -->
<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
