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
		            
		            	<div class="row">
		            		<div class="col-md-6 pt-3">
		            			<h5 class="text-primary font-weight-bold"><a href="/board/free/list">자유게시판</a></h6>
		            			<table id="txVol24" class="table table-sm text-left table-hover">
		            				<tbody>
		            					<c:forEach items="${board}" var="list">
			            					<tr>
			            						<td class="txVol24_text"><a href="/board/free/content/${list.bno}">&nbsp;${list.title}&nbsp;<span class="text-primary">${list.replyCnt>0?list.replyCnt:""}</span></a></td>
			            					</tr>	
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            		<div class="col-md-6 pt-3">
		            			<h5 class="font-weight-bold">최근 24시간 거래대금 순위</h6>
		            			<table id="txVol24" class="table table-sm text-center table-hover">
		            				<thead class="font-weight-bold">
		            					<tr class="">
			            					<td class="txVol24_text" style="width:6%">#</td>
			            					<td class="txVol24_text" style="width:33%">곡명</td>
			            					<td class="txVol24_text" style="width:33%">가수</td>
			            					<td class="txVol24_text" style="width:28%">거래대금</td>
		            					</tr>
		            				</thead>
		            				<tbody>
		            					<c:set var="rowNum" value="1"/>
		            					<c:forEach items="${txVol24}" var="list">
		            					<tr class="${rowNum==1?"table-warning font-weight-bold":""}">
		            						<td class="txVol24_text" style="width:6%">${rowNum}</td>
		            						<td class="txVol24_text" style="width:33%">${list.song}</td>
		            						<td class="txVol24_text" style="width:33%">${list.singer}</td>
		            						<td class="txVol24_text" style="width:28%"><fmt:formatNumber value="${list.vol}" pattern="#,###" /></td>
		            					</tr>	
		            					<c:set var="rowNum" value="${rowNum+1}"/>
		            					</c:forEach>
		            				</tbody>
		            			</table>
		            		</div>
		            	</div>
		            	
		            	<div class="heading pb-5">
		            		<div class="line"></div>
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
<!-- ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ FORM ↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓ -->
<!-- =================================================================================================  -->

<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ FORM ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->



<%@include file="./includes/footer.jsp"%>
