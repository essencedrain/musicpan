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
		            	
		            	<div class="pb-3">
		                	<h3 class="board_heading"><a href="/tables/metaInfo">곡 정보</a></h3>
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
		                
		                <div class="table-responsive pt-2 pb-4">
		                	<table class="table table-bordered table-sm">
		                		<tr class="table-info">
		                			<td colspan="2" class="text-nowrap text-center">노래제목 클릭시 뮤직카우 이동 가능, 엑셀로 블럭 복붙가능, 키보드 화살표 이동가능, 정렬, 필터(검색) 사용 가능</td>
		                		</tr>
		                		<tr>
		                			<td colspan="2" class="text-nowrap text-left text-danger font-weight-bold">
		                				<h3>주의 사항</h3>
										<p>※ 본 데이터는 크롤링 특성상 갱신되지 않아 틀릴 수 있습니다.</p>
										<p>※ 본 데이터는 투자에 참고용으로만 사용해주십시오.</p>
		                			</td>
		                		</tr>
		                		<tr class="table-danger">
		                			<td colspan="2" class="text-nowrap text-center">화면에 아무것도 뜨지 않을때는 업데이트 중이므로 몇초뒤에 새로고침 해보시기 바랍니다.</td>
		                		</tr>
		                	</table>
		                </div>
		                
	                	<div id="grid"></div>
		                
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
		            </div><!-- <div class="center_area col-lg-10" > -->
		            
		            <div class="right_area col-lg-1">
	           	 	</div><!-- <div class="right_area col-lg-1 bg-danger"> -->
	            
	            </div><!-- <div class="row"> -->
            </div><!-- <div class="container"> -->
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
			,width: 120
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
			header: '차트'
			,defaultValue: '<i class="far fa-chart-bar"></i>'
			,name: 'chart'
			,width: 50
			,align: 'center'
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
			header: '형태'
			,name: 'copyRight'
			,sortable: true
			,width: 100
			,align: 'center'
		}
		,{
			header: '2차작성권'
			,name: 'secRight'
			,sortable: true
			,width: 100
			,align: 'center'
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
			header: '구성률-방송'
			,name: 'broadcast'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성률-전송'
			,name: 'transfer'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성률-복제'
			,name: 'duplication'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성률-공연'
			,name: 'performance'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성률-해외'
			,name: 'oversea'
			,sortable: true
			,sortingType: 'desc'
			,width: 120
			,align: 'center'
			,filter: { type: 'number', showApplyBtn: true, showClearBtn: true }
		}
		,{
			header: '구성률-기타'
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
		,{
			header: '작곡가'
			,name: 'composer'
			,sortable: true
			,filter: 'select'
			,width: 300
		}
		,{
			header: '작사가'
			,name: 'lyricist'
			,sortable: true
			,filter: 'select'
			,width: 300
		}
		,{
			header: '편곡가'
			,name: 'arranger'
			,sortable: true
			,filter: 'select'
			,width: 300
		}
		
	]
	,pageOptions: {
		useClient: true,
    	perPage: 20
  	}
});

tui.Grid.applyTheme('clean');


grid.on('click', (ev) => {
	  if (ev.columnName === 'song' && ev.rowKey >=0) {
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
	  }else if(ev.columnName === 'chart' && ev.rowKey >=0){
		  Swal.fire({
			  title: '새창을 띄우시겠습니까?',
			  text: ev.nativeEvent.target.textContent+' 차트를 봅니다.',
			  icon: 'question',
			  showCancelButton: true,
			  confirmButtonColor: '#0F4C81',
			  cancelButtonColor: '#b71515',
			  confirmButtonText: '이동',
			  cancelButtonText: '취소'
			}).then((result) => {
			  if (result.value) {
				  window.open("/chart/idx/"+grid.getValue(ev.rowKey,"idx"));
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
