<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- tabulator css -->
<!--<link rel="stylesheet" href="/resources/css/tabulator.min.css">-->
<link rel="stylesheet" href="https://uicdn.toast.com/tui-grid/latest/tui-grid.css" />
<link rel="stylesheet" href="https://uicdn.toast.com/tui.pagination/latest/tui-pagination.css" />
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1">
		            </div><!-- <div class="left_area col-lg-1 bg-danger"> -->
		            
		            <div class="center_area col-lg-10" >
		            	
		            	<div class="heading pb-4">
		                	<h1 class="pb-5">데이터 테이블 샘플</h1>
		                	<!--  <div id="example-table"></div>-->
		                	<div id="grid"></div>
		                </div>
		                
		            </div><!-- <div class="center_area col-lg-10" > -->
		            
		            <div class="right_area col-lg-1">
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

<script type="text/javascript" src="https://uicdn.toast.com/tui.code-snippet/v1.5.0/tui-code-snippet.js"></script>
<script type="text/javascript" src="https://uicdn.toast.com/tui.pagination/v3.3.0/tui-pagination.js"></script>
<script src="https://uicdn.toast.com/tui-grid/latest/tui-grid.js"></script>

<script type="text/javascript">

var gridData = ${dataList};

var grid = new tui.Grid({
	el: document.getElementById('grid')
	,data: gridData
	,scrollX: true
    ,scrollY: false
    //,rowHeaders: ['rowNum']
    ,columnOptions: {
        resizable: true
        ,frozenCount: 1 // 3개의 컬럼을 고정하고
        ,frozenBorderWidth: 2 // 고정 컬럼의 경계선 너비를 2px로 한다.
   		}
	,columns: [
		{
			header: '노래'
			,name: 'song'
			,sortable: true
			,filter: 'select'
			,width: 150
		}
		,{
			header: '가수'
			,name: 'singer'
			,sortable: true
			,filter: 'select'
			,width: 100
			,align: 'center'
		}
		,{
			header: '매수'
			,name: 'buyprice'
			,sortable: true
			,sortingType: 'desc'
			,width: 80
			,align: 'center'
		}
		,{
			header: '잔량'
			,name: 'buyunit'
			,sortable: true
			,sortingType: 'desc'
			,width: 30
			,align: 'center'
		}
		,{
			header: '매도'
			,name: 'sellprice'
			,sortingType: 'desc'
			,sortable: true
			,width: 80
			,align: 'center'
		}
		,{
			header: '잔량'
			,name: 'sellunit'
			,sortable: true
			,sortingType: 'desc'
			,width: 30
			,align: 'center'
		}
		,{
			header: '최근거래가'
			,name: 'recentprice'
			,sortable: true
			,width: 100
			,align: 'center'
		}
		,{
			header: '8%적정가'
			,name: 'pricefor8'
			,sortable: true
			,width: 100
			,align: 'center'
		}
		,{
			header: '최저낙찰가'
			,name: 'auctionmin'
			,sortable: true
			,width: 100
			,align: 'center'
		}
		,{
			header: '옥션갭low%'
			,name: 'auctiongap_low'
			,sortable: true
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '옥션평균가'
			,name: 'auctionavg'
			,sortable: true
			,width: 100
			,align: 'center'
		}
		,{
			header: '옥션갭avg%'
			,name: 'auctiongap_avg'
			,sortable: true
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '수익률3'
			,name: 'avg3f'
			,sortable: true
			,sortingType: 'desc'
			,width: 100
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '수익률6'
			,name: 'avg6f'
			,sortable: true
			,sortingType: 'desc'
			,width: 100
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '수익률12'
			,name: 'avg12f'
			,sortable: true
			,sortingType: 'desc'
			,width: 100
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '수익률All'
			,name: 'avgallf'
			,sortable: true
			,sortingType: 'desc'
			,width: 100
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '자료제공횟수'
			,name: 'alltime'
			,sortable: true
			,width: 120
			,align: 'center'
		}
		,{
			header: '변동계수12'
			,name: 'cv12'
			,sortable: true
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '변동계수all'
			,name: 'cvall'
			,sortable: true
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '공표년'
			,name: 'finalrelease'
			,sortable: true
			,width: 100
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '뮤카옥션수량'
			,name: 'auctionunits'
			,sortable: true
			,width: 110
			,align: 'center'
		}
		,{
			header: '총지분수'
			,name: 'stockCnt'
			,sortable: true
			,width: 100
			,align: 'center'
		}
		,{
			header: '구성율-방송'
			,name: 'broadcast'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성율-전송'
			,name: 'transfer'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성율-복제'
			,name: 'duplication'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성율-공연'
			,name: 'performance'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성율-해외'
			,name: 'oversea'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성율-기타'
			,name: 'etc'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '저작권기준월'
			,name: 'feemonth'
			,width: 100
			,align: 'center'
		}
		,{
			header: '업데이트'
			,name: 'finalupdate'
			,width: 60
			,align: 'center'
		}
		,{
			header: 'idx'
			,name: 'idx'
			,width: 60
			,align: 'center'
		}
		
	]
	,pageOptions: {
		useClient: true,
    	perPage: 15
  	}
});

tui.Grid.applyTheme('clean');


grid.on('click', (ev) => {
	  if (ev.columnName === 'song') {
		  Swal.fire({
			  title: '새창을 띄우시겠습니까?',
			  text: "뮤지카우 유저마켓 "+ev.nativeEvent.target.textContent+'곡으로',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#0F4C81',
			  cancelButtonColor: '#b71515',
			  confirmButtonText: '이동',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
				  window.open("https://www.musicow.com/song/"+grid.getValue(ev.rowKey,"idx"));
			  }
			})
	  }//if
	  //return ev.stop();
	  //console.log('test : ' + ev);
	  //console.log('ev.rowKey : ' + ev.rowKey);
	  //console.log('ev.columnName : ' + ev.columnName);
	  //console.log('ev.nativeEvent.target.textContent : ' + ev.nativeEvent.target.textContent);
	  //console.log('test : ' + grid.getValue(ev.rowKey,"idx") );
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
