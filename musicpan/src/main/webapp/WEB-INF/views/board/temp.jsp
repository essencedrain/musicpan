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
	            
		            <div class="left_area col-lg-1 bg-info">
		            </div>
		            
		            <div class="center_area col-lg-10" >
			            <div class="heading pb-4">
		                	<h1>자유게시판</h1>
		                </div>
		            	<div class="table-responsive mt-4">
		            		<table class="table table-bordered">
		            			<thead class="text-center">
			                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>번호</nobr></td>
			                        <td style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>제목</nobr></td>
			                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>글쓴이</nobr></td>
			                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>등록일</nobr></td>
			                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>조회수</nobr></td>
			                    </thead>
                    			<tbody class="text-center">
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			
	                    			<tr>
	                    				<td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>1000</nobr></td>
                    					<td class="text-left" style="width: 60%; overflow:hidden;text-overflow:ellipsis;"><nobr>가나다라마바사</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>김구태</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>2018-20-20</nobr></td>
				                        <td style="width: 10%; overflow:hidden;text-overflow:ellipsis;"><nobr>800</nobr></td>
	                    			</tr>
	                    			
                    			</tbody>
		            		</table>
		            	</div>
		            </div>
		            
		            <div class="right_area col-lg-1 bg-info">
	           	 	</div>
	           	 	
            	</div>
            </div>
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
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
