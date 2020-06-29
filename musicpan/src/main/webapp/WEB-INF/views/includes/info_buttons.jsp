<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<div class="d-flex flex-wrap align-content-around">
	<button type="button" class="btn btn-light" onclick="location.href='/tables/priceInfo'">가격 정보</button>
	<button type="button" class="btn btn-light" onclick="location.href='/tables/metaInfo'">곡 정보</button>
	<button type="button" class="btn btn-light" onclick="location.href='/tables/tauVolume'">거래량 정보</button>
	<button type="button" class="btn btn-light" onclick="location.href='/tables/auctionInfo'">옥션 정보</button>
	<button type="button" class="btn btn-light" onclick="location.href='/tables/tauPickV1'"><i class="far fa-id-card"></i> 타우픽</button>
</div>

<div class="d-flex flex-wrap align-content-around pt-3 pb-2">
	<button type="button" class="btn btn-light" onclick="location.href='/board/free/list'">자유 게시판</button>
	<button type="button" class="btn btn-light" onclick="location.href='/board/analysis/list'">정보·분석 게시판</button>
	<!--  <button type="button" class="btn btn-secondary border-right-0 border-left-0" onclick="location.href='/board/analysis/list'">정보·분석 게시판</button> -->
</div>