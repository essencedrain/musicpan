<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- tabulator css -->
<!--<link rel="stylesheet" href="/resources/css/tabulator.min.css">-->
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1 bg-danger">
		            </div><!-- <div class="left_area col-lg-1 bg-danger"> -->
		            
		            <div class="center_area col-lg-10" >
		            	
		            	<div class="heading pb-4">
		                	<h1 class="pb-5">데이터 테이블 샘플</h1>
		                	<!--  <div id="example-table"></div>-->
		                	<div id="grid"></div>
		                </div>
		                
		            </div><!-- <div class="center_area col-lg-10" > -->
		            
		            <div class="right_area col-lg-1 bg-danger">
	           	 	</div><!-- <div class="right_area col-lg-1 bg-danger"> -->
	            
	            </div><!-- <div class="row"> -->
            </div><!-- <div class="container"> -->
            
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


<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<script type="text/javascript">
const gridData = [];
(function() {
  for (let i = 0; i < 120; i += 1) {
    gridData.push({
      c1: 'User' + (i + 1),
      c2: ((i + 5) % 8) * 100 + i,
      c3: ((i + 3) % 7) * 60
    });
  }
})();

const grid = new tui.Grid({
  el: document.getElementById('grid'),
  data: gridData,
  scrollX: false,
  bodyHeight: 300,
  rowHeaders: ['rowNum'],
  columns: [
    {
      header: 'User ID',
      name: 'c1',
      align: 'center',
      editor: 'text'
    },
    {
      header: 'Score',
      name: 'c2',
      className: 'clickable',
      editor: 'text'
    },
    {
      header: 'Item Count',
      name: 'c3',
      editor: 'text'
    }
  ],
  summary: {
    height: 40,
    position: 'bottom', // or 'top'
    columnContent: {
      c2: {
        template: function(valueMap) {
          return "MAX: " + valueMap.max + "<br>MIN: " + valueMap.min;
        }
      },
      c3: {
        template: function(valueMap) {
          return "TOTAL: " + valueMap.sum+"<br>AVG: "+ valueMap.avg.toFixed(2);
        }
      }
    }
  }
});
</script>


<!-- tabulator js -->
 
<!-- <script src="/resources/js/tabulator.min.js"></script>
<script type="text/javascript">
//define data
var tabledata = [
    {id:1, name:"Billy Bob", age:12, gender:"male", height:95, col:"red", dob:"14/05/2010"},
    {id:2, name:"Jenny Jane", age:42, gender:"female", height:142, col:"blue", dob:"30/07/1954"},
    {id:3, name:"Steve McAlistaire", age:35, gender:"male", height:176, col:"green", dob:"04/11/1982"},
];

//define table
var table = new Tabulator("#example-table", {
    data:tabledata,
    autoColumns:true,
});
</script>-->
<!-- tabulator js -->

<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->





<%@include file="../includes/footer.jsp"%>
