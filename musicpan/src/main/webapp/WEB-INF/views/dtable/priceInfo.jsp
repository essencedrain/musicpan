<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<!-- data table -->
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/fixedcolumns/3.3.1/css/fixedColumns.dataTables.min.css">
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1">
		            </div><!-- <div class="left_area col-lg-1 bg-danger"> -->
		            
		            <div class="center_area col-lg-10" style="overflow: hidden;">
		            	
		            	<div class="pb-3">
		                	<h3 class="board_heading"><a href="/tables/${tableLink}">${tableTitle}</a></h3>
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
		                		<tr class="table-secondary text-center font-weight-bold">
		                			<td colspan="2" class="text-nowrap">현재가 기준 : 최저 매도호가</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">8%적정가</td>
		                			<td class="text-nowrap">12개월 수익률이 8%가 되기 위한 가격</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">옥션갭%</td>
		                			<td class="text-nowrap">옥션 전회차 최저낙찰가 대비 현재가%</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">수익률x</td>
		                			<td class="text-nowrap">현재가 및 최근 x개월 저작권료 기준 12개월 환산 수익률 (all은 자료제공횟수)</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">자료제공</td>
		                			<td class="text-nowrap">뮤지카우에서 제공한 월저작권료 정보제공 횟수 (ex:65 = 15,16,17,18,19년도 60개 + 20년도 1~5월)</td>
		                		</tr>
		                		<tr>
		                			<td class="text-nowrap font-weight-bold">변동계수(CV)</td>
		                			<td class="text-nowrap">저작권료 상대표준편차 : 값이 낮을수록 월 저작권료가 일정 / 높을수록 큰 달 작은 달 기복이 심함</td>
		                		</tr>
		                		<tr>
		                			<td colspan="2" class="text-nowrap text-left text-danger font-weight-bold">
		                				<h3>주의 사항</h3>
										<p>※ 가격정보는 10분마다 업데이트가 되므로 실시간 정보가 아닙니다.</p>
										<p>※ 본 데이터는 크롤링 특성상 갱신되지 않아 틀릴 수 있습니다.</p>
										<p>※ 본 데이터는 투자에 참고용으로만 사용해주십시오.</p>
		                			</td>
		                		</tr>
		                		<tr class="table-danger">
		                			<td colspan="2" class="text-nowrap text-center">화면에 아무것도 뜨지 않을때는 업데이트 중이므로 몇초뒤에 새로고침 해보시기 바랍니다.</td>
		                		</tr>
		                	</table>
		                </div>
							
							
						<form id="checkForm" name="checkForm" method="post" action="/tables/saveTableConfig">
		                	<div class="table-responsive pt-2 pb-4">
			                	<table class="table table-bordered table-sm">
			                		<tr>
			                			<td class="text-nowrap">
			                				<input type="checkbox" id="priceCheckBox1" class="priceCheckBox" name="priceCheckBox" data-cno="1" value="1">
				    						<label for="priceCheckBox1">가수</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox2" class="priceCheckBox" name="priceCheckBox" data-cno="2" value="2">
				    						<label for="priceCheckBox2">차트</label>
			                			</td>
		                			</tr>
			                		<tr>
			                			<td class="text-nowrap">
			                				<input type="checkbox" id="priceCheckBox3" class="priceCheckBox" name="priceCheckBox" data-cno="3" value="3">
				    						<label for="priceCheckBox3">매도호가</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox4" class="priceCheckBox" name="priceCheckBox" data-cno="4" value="4">
				    						<label for="priceCheckBox4">매도잔량</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox5" class="priceCheckBox" name="priceCheckBox" data-cno="5" value="5">
				    						<label for="priceCheckBox5">매수호가</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox6" class="priceCheckBox" name="priceCheckBox" data-cno="6" value="6">
				    						<label for="priceCheckBox6">매수잔량</label>
			                			</td>
		                			</tr>
			                		<tr>
			                			<td class="text-nowrap">
			                				<input type="checkbox" id="priceCheckBox7" class="priceCheckBox" name="priceCheckBox" data-cno="7" value="7">
				    						<label for="priceCheckBox7">최근거래가</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox8" class="priceCheckBox" name="priceCheckBox" data-cno="8" value="8">
				    						<label for="priceCheckBox8">옥션최저가</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox9" class="priceCheckBox" name="priceCheckBox" data-cno="9" value="9">
				    						<label for="priceCheckBox9">8%적정가</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox10" class="priceCheckBox" name="priceCheckBox" data-cno="10" value="10">
				    						<label for="priceCheckBox10">옥션갭%</label>
			                			</td>
		                			</tr>
			                		<tr>
			                			<td class="text-nowrap">
			                				<input type="checkbox" id="priceCheckBox11" class="priceCheckBox" name="priceCheckBox" data-cno="11" value="11">
				    						<label for="priceCheckBox11">수익률 3개월</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox12" class="priceCheckBox" name="priceCheckBox" data-cno="12" value="12">
				    						<label for="priceCheckBox12">수익률 6개월</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox13" class="priceCheckBox" name="priceCheckBox" data-cno="13" value="13">
				    						<label for="priceCheckBox13">수익률 1년</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox14" class="priceCheckBox" name="priceCheckBox" data-cno="14" value="14">
				    						<label for="priceCheckBox14">수익률 전체</label>
			                			</td>
		                			</tr>
			                		<tr>
			                			<td class="text-nowrap">
			                				<input type="checkbox" id="priceCheckBox15" class="priceCheckBox" name="priceCheckBox" data-cno="15" value="15">
				    						<label for="priceCheckBox15">저작권 정보 제공 횟수</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox16" class="priceCheckBox" name="priceCheckBox" data-cno="16" value="16">
				    						<label for="priceCheckBox16">CV(변동계수, 상대표준편차)</label>
				    						&nbsp;
						                	<input type="checkbox" id="priceCheckBox17" class="priceCheckBox" name="priceCheckBox" data-cno="17" value="17">
				    						<label for="priceCheckBox17">공표일</label>
			                			</td>
		                			</tr>
		                			<tr>
		                				<td>
		                					 <button class="btn btn-outline-primary" id="checkAll">전체선택</button>
		                					 <button class="btn btn-outline-primary" id="uncheckAll">전체해제</button>
		                					 <button class="btn btn-primary" id="saveCheckData">저장하기</button>
		                				</td>
		                			</tr>
			                	</table>
		                	</div>
		                	<sec:authorize access="isAuthenticated()">
		                		<input type='hidden' name='id' value="<sec:authentication property="principal.username"/>">
		                	</sec:authorize>
		                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                </form>
		                
	                	<table id="myTable" id="dataTables_set" class="display compact cell-border text-center" cellspacing="0" width="100%">
							<thead>
								<tr>
									<td>곡명</td>
									<td>가수</td>
									<td>차트</td>
									<td>매도</td>
									<td>잔량</td>
									<td>매수</td>
									<td>잔량</td>
									<td>최근거래가</td>
									<td>옥션최저가</td>
									<td>8%적정가</td>
									<td>옥션갭%</td>
									<td>수익률3</td>
									<td>수익률6</td>
									<td>수익률12</td>
									<td>수익률All</td>
									<td>자료제공</td>
									<td>CV</td>
									<td>공표년</td>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${dataList}" var="list">
									<tr>
										<td style="width:90px;" class="text-primary"><a href="https://www.musicow.com/song/${list.idx}" target='_blank'>${list.song}</a></td>
										<td>${list.singer}</td>
										<td class="text-primary"><a href="/chart/idx/${list.idx}" target='_blank'><i class="far fa-chart-bar"></i></a></td>
										<td class="text-white bg-primary font-weight-bold"><fmt:formatNumber value="${list.sellprice}" pattern="#,###" /></td>
										<td class="text-white bg-primary font-weight-bold"><fmt:formatNumber value="${list.sellunit}" pattern="#,###" /></td>
										
										<c:choose>
											<c:when test="${list.buyprice < list.auctionmin}">
												<td class="text-warning bg-danger font-weight-bold"><fmt:formatNumber value="${list.buyprice}" pattern="#,###" /></td>
											</c:when>
											<c:otherwise>
												<td class="text-white bg-danger font-weight-bold"><fmt:formatNumber value="${list.buyprice}" pattern="#,###" /></td>
											</c:otherwise>
										</c:choose>
										
										<td class="text-white bg-danger font-weight-bold"><fmt:formatNumber value="${list.buyunit}" pattern="#,###" /></td>
										
										<td><fmt:formatNumber value="${list.recentprice}" pattern="#,###" /></td>
										<td><fmt:formatNumber value="${list.auctionmin}" pattern="#,###" /></td>
										
										<c:choose>
											<c:when test="${list.sellprice > list.pricefor8}">
												<td class="text-info font-weight-bold"><fmt:formatNumber value="${list.pricefor8}" pattern="#,###" /></td>
											</c:when>
											<c:otherwise>
												<td><fmt:formatNumber value="${list.pricefor8}" pattern="#,###" /></td>
											</c:otherwise>
										</c:choose>
										
										
										<c:choose>
											<c:when test="${(list.sellprice-list.auctionmin) < 0}">
												<td class="text-success font-weight-bold">${list.auctiongap_low}%</td>
											</c:when>
											<c:otherwise>
												<td>${list.auctiongap_low}%</td>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.avg3f>7}">
												<td class="text-success font-weight-bold">${list.avg3f}%</td>
											</c:when>
											<c:when test="${list.avg3f<=7 && list.avg3f>5}">
												<td class="text-warning">${list.avg3f}%</td>
											</c:when>
											<c:otherwise>
												<td class="text-danger">${list.avg3f}%</td>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.avg6f>7}">
												<td class="text-success font-weight-bold">${list.avg6f}%</td>
											</c:when>
											<c:when test="${list.avg6f<=7 && list.avg6f>5}">
												<td class="text-warning">${list.avg6f}%</td>
											</c:when>
											<c:otherwise>
												<td class="text-danger">${list.avg6f}%</td>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.avg12f>7}">
												<td class="text-success font-weight-bold">${list.avg12f}%</td>
											</c:when>
											<c:when test="${list.avg12f<=7 && list.avg12f>5}">
												<td class="text-warning">${list.avg12f}%</td>
											</c:when>
											<c:otherwise>
												<td class="text-danger">${list.avg12f}%</td>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.avgallf>7}">
												<td class="text-success font-weight-bold">${list.avgallf}%</td>
											</c:when>
											<c:when test="${list.avgallf<=7 && list.avgallf>5}">
												<td class="text-warning">${list.avgallf}%</td>
											</c:when>
											<c:otherwise>
												<td class="text-danger">${list.avgallf}%</td>
											</c:otherwise>
										</c:choose>
										
										
										<c:choose>
											<c:when test="${list.alltime < 12}">
												<td class="text-danger font-weight-bold">${list.alltime}</td>
											</c:when>
											<c:when test="${list.alltime < 24 && list.alltime > 11}">
												<td class="text-warning font-weight-bold">${list.alltime}</td>
											</c:when>
											<c:otherwise>
												<td class="text-success font-weight-bold">${list.alltime}</td>
											</c:otherwise>
										</c:choose>
										
										<c:choose>
											<c:when test="${list.cvall < 1.7 && list.cvall > 1}">
												<td class="text-warning font-weight-bold">${list.cvall}</td>	
											</c:when>
											<c:when test="${list.cvall >= 1.7}">
												<td class="text-danger font-weight-bold">${list.cvall}</td>	
											</c:when>
											<c:otherwise>
												<td>${list.cvall}</td>
											</c:otherwise>
										</c:choose>
										
										<td>${list.finalrelease}</td>
										
									</tr>							
								</c:forEach>
							</tbody>                	
	                	</table>
		                <h6>업데이트 : ${updatedate}</h6>
		                
		                
		                
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
<!--  data table -->
<script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/fixedcolumns/3.3.1/js/dataTables.fixedColumns.min.js"></script>
<script src="https://cdn.datatables.net/plug-ins/1.10.21/dataRender/ellipsis.js"></script>

<c:choose>
	<c:when test="${config!=null}">
	    <c:forEach items="${config}" var="config2">
	    	<script>
	    		$('#priceCheckBox${config2}').prop("checked", true);
	    	</script>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<script>
			$('.priceCheckBox').each(function (index, item) {
	    		$(item).prop("checked", true);
	    	});
    	</script>
	</c:otherwise>
</c:choose>

<script>
$(document).ready( function () {
	var table = $('#myTable').DataTable({
			    	pageLength: 13
			    	,scrollX: true
			    	,fixedColumns: true
			    	,order: [[ 13, "desc" ]]
			    });
    $('#myTable_length').css("display", "none");
    
    
    
  
	//컬럼 체크박스처리
    $('.priceCheckBox').each(function (index, item) {
    	//console.log($(item).data('cno'));
    	if($(item).is(":checked")){
    		table.column( $(item).data('cno') ).visible( true );
    	}else{
    		table.column( $(item).data('cno') ).visible( false );
    	}
    	
    	$(item).change(function(){
    		if($(item).is(":checked")){
        		table.column( $(item).data('cno') ).visible( true );
        	}else{
        		table.column( $(item).data('cno') ).visible( false );
        	}
    	});
    });

    $('#checkAll').click(function(e){
    	e.preventDefault();
    	$('.priceCheckBox').each(function (index, item) {
    		$(item).prop("checked", true);
    		table.column( $(item).data('cno') ).visible( true );
    	});
    });
    $('#uncheckAll').click(function(e){
    	e.preventDefault();
    	$('.priceCheckBox').each(function (index, item) {
    		$(item).prop("checked", false);
    		table.column( $(item).data('cno') ).visible( false );
    	});
    });
    
    $('#saveCheckData').click(function(e){
    	e.preventDefault();
    	
    	var isSigned = false;
    	
    	<sec:authorize access="isAuthenticated()">
    		isSigned = true;
    	</sec:authorize>
    	
    	if(!isSigned){
    		swa("error",'로그인이 필요한 기능입니다.');
    		return;
    	}
    	
    	if ( $("input:checkbox[name=priceCheckBox]:checked").length<1 ) {
    		swa("error",'1개 이상 체크하셔야 합니다.');
    		return;
   	    }
    	$('#checkForm').submit();
    });
    
    /*
    $("#sellInfo").change(function(){
    	if($("#sellInfo").is(":checked")){
    		table.column(3).visible( true );
    		table.column(4).visible( true );
        }else{
        	table.column(3).visible( false );
        	table.column(4).visible( false );
        }
    });
    $("#buyInfo").change(function(){
    	if($("#buyInfo").is(":checked")){
    		table.column(5).visible( true );
    		table.column(6).visible( true );
        }else{
        	table.column(5).visible( false );
        	table.column(6).visible( false );
        }
    });
    */
    //table.column( 3 ).visible( false );
    
    
} );



function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

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
