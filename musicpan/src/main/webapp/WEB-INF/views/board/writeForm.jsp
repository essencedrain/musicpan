<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<%@include file="../includes/header.jsp"%>
<script src="/resources/ckeditor/ckeditor.js"></script>
            <!-- =================================================================================================  -->
            <!-- start  -->
            <!-- =================================================================================================  -->
            
            <div class="container">
	            <div class="row">
	            
	            	<div class="left_area col-lg-1 ">
		            </div>
		            
		            <div class="center_area col-lg-10" >
		            	<div class="heading pb-4">
		            		<h3 class="board_heading"><a href="/board/${b_name}/list">${b_name2} 게시판</a></h3>
		                </div>
		                
		                <form name="writeForm" action="/board/register" method="post" id="writeForm">
		                	
		                	<sec:authorize access="hasRole('ROLE_ADMIN')">
								<div class="custom-control custom-checkbox mb-2">
								  <input type="checkbox" class="custom-control-input" id="notice_flag" value="1" name="notice_flag">
								  <label class="custom-control-label" for="notice_flag">공지사항</label>
								</div>
		                	</sec:authorize>
		                	
			                <div class="form-group">
	                   			<input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요."/>
	                		</div>
	                		
							<textarea class="form-control" id="ck_content" name="content"></textarea>
			                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			                <input type="hidden" name="id" value='<sec:authentication property="principal.username"/>' />
			                <input type="hidden" name="b_name" value="${b_name}" />
		                </form>
		                
		                <div class="file_upload mt-3 p-2 bg-light">
		                	<div class="file_upload_main">
								<input id="input_uploadFile" type='file' name='uploadFile' multiple>
								<button type="button" id='uploadBtn' class="btn btn-outline-secondary btn-sm text-center mx-1" onclick="uploadBtnClick()">파일 업로드</button>
								 <span class="file_info">파일 크기 제한 : 10.00MB (<span class="file_size_status">0</span>KB / 40.00MB)</span>
								 <br><span class="file_info">(허용 확장자 : *.jpg, *.jpeg, *.gif, *.png, *.doc, *.hwp, *.xls, *.ppt, *.pdf)</span>
								 <div id="proBarDiv" class="progress mb-2 d-none" style="height:10px">
							    	<div id="proBar" class="progress-bar bg-info progress-bar-striped progress-bar-animated" style="width:20%;height:10px"></div>
							  	 </div>
							</div>
							<div class='uploadResult mt-2 p-2'>
								<div class="wrapResult d-flex flex-wrap align-content-start bg-light"></div>
							</div>
						</div>
						
                		<div class="text-right mt-2">
			                <button type="button" class="btn btn-outline-secondary text-center mx-1" onclick="javascript:window.history.back();">돌아가기</button>
			                <button type="button" id="writeFormSubmit" class="btn btn-primary text-center mx-1">등록</button>
		                </div>
		            </div>
		            
		            <div class="right_area col-lg-1 ">
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
<script type="text/javascript">
var totalFileSize = 0;
</script>

	<!-- =================================================================================================  -->
	<!-- Start 글쓰기 폼 기본 처리 -->
	<!-- =================================================================================================  -->
	<script type="text/javascript">
	//리사이징 제한
	CKEDITOR.config.resize_enabled = false
	CKEDITOR.replace('ck_content', {height: 500});
	
	
	$("#writeFormSubmit").on("click", function(e){
	    e.preventDefault();
	    
	    if($.trim($('#title').val())=="" || $.trim($('#title').val()).length ==0){
	    	swa("error", "제목을 입력해주세요")
	    	return;
	    }
	    
	    if( $('#title').val().length > 100){
	    	swa("error", "제목이 너무 깁니다")
	    	return;
	    }
	    
	    var content = CKEDITOR.instances["ck_content"].getData();
	    var content_len = CKEDITOR.instances["ck_content"].getData().length;
	    
	    if( $.trim( content )=="" || $.trim( content ).length ==0){
	    	swa("error", "내용을 입력해주세요")
	    	return;
	    }
	    
	    if( content_len > 21000 ){
	    	swa("error", "내용이 너무 깁니다")
	    	return;
	    }
	    
	    
	    var str = "";
	    $('.uploadResult .resultItems').each(function(i, obj){
	    	
	    	var jobj = $(obj);
	    	//console.dir(jobj);
	    	//console.log("-------------------------");
	        //console.log(jobj.data("filename"));
	        
	        str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	        str += "<input type='hidden' name='attachList["+i+"].fileSize' value='"+ jobj.data("size")+"'>";
	    	
	    });
	    
	  	//쿠키삽입
	    setCookie("mplwck${b_name}","yes",60);
	  	
	  	//전송
	    $("#writeForm").append(str).submit();
	    
	});
	
	
	function setCookie(name, value, exp) {
		  var date = new Date();
		  date.setTime(date.getTime() + exp*1000);
		  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	}
	</script>
	<!-- =================================================================================================  -->
	<!-- end 글쓰기 폼 기본 처리 -->
	<!-- =================================================================================================  -->


<!-- =================================================================================================  -->
<!-- Start 파일처리 -->
<!-- =================================================================================================  -->

<script type="text/javascript">
//=================================================================
// 파일처리 관련 펑션들
//=================================================================
function showImage(item){
	  
	var imgHtml = CKEDITOR.dom.element.createFromHtml( "<img class='"+$(item).next().data('file2')+"' src='/display?fileName="+$(item).next().data('file3')+"' /><br /><br />" );
    CKEDITOR.instances['ck_content'].insertElement(imgHtml);
}//showImage()	

function checkExtension(fileName, fileSize) {
		
		//var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
		var regex = new RegExp("(.*?)\.(jpg|jpeg|gif|png|doc|hwp|xls|xlsx|ppt|pptx|pdf)$");
		var maxSize = 10485760; //10MB	
	
		if (fileSize >= maxSize) {
			swa("error", "파일 사이즈 초과 (최대 10MB)");
			return false;
		}//if

		//if (regex.test(fileName)) {
		if (!regex.test(fileName)) {
			swa("error", "해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}//if
		
		return true;
}//function checkExtension(fileName, fileSize)

function uploadBtnClick(){
	//파일폼은 readonly라서 수정안됨, 복제해서 ajax에 다시 뿌려줌 (초기화 작업)
	var cloneObj = $(".file_upload_main").clone();
	
	var formData = new FormData();
	var inputFile = $("input[name='uploadFile']");
	var files = inputFile[0].files;
	
	if( files.length == 0 ){
		swa("error", "파일을 선택해주십시오");
		return;
	}
	
	//console.log(files);
	 
	//임시업로드총용량
	var totalFileSizeTemp = 0;
	
	//add filedate to formdata
	 for(var i = 0; i < files.length; i++){
		
		if (!checkExtension(files[i].name, files[i].size)) {
			return false;
		}
	 	
		totalFileSizeTemp += files[i].size;
		
	 	formData.append("uploadFile", files[i]);
	 }//for
	 
	 
	 if( (totalFileSize + totalFileSizeTemp) > 41943040){
		swa("error", "업로드 가능 용량 초과");
		return;
	 }
		
	 //업로드총용량 + 임시총용량
	 totalFileSize += totalFileSizeTemp;
	 
	 $.ajax({
		 url: '/uploadAjaxAction',
		 processData: false,
		 contentType: false,
		 data: formData,
		 type: 'POST',
		 dataType: 'json',
		 beforeSend: function(){
         	Swal.fire({
                 title: '잠시만 기다려주세요',
                 text: '작업중입니다.',
                 allowOutsideClick: false,
                 allowEscapeKey: false,
                 allowEnterKey: false,
                 onOpen: () => {
                     swal.showLoading();
                 }
         	});
         },
		 success: function(result){
		 	swa("success", "업로드 성공");
			showUploadedFile(result);
			
			//파일폼은 readonly라서 수정안됨, 복제해서 ajax에 다시 뿌려줌 (초기화 작업)
		 	$(".file_upload_main").html( cloneObj.html() );
		 	$('.file_size_status').text( (totalFileSize/1024).toFixed(1) );
		 	
			//테두리 on
			if(!$('.uploadResult').hasClass('borderToggle')){
				$('.uploadResult').addClass('borderToggle');
			}//if
				
			//프로그레스바 on
			var percentBar = (totalFileSize/41943040)*100;
			$('#proBar').css('width',percentBar+'%');
			$('#proBar').text( percentBar.toFixed(1)+"%" );
			
			//프로그레스바 색상
			$('#proBar').removeClass('bg-info');
			$('#proBar').removeClass('bg-warning');
			$('#proBar').removeClass('bg-danger');
			if(percentBar < 50){
				$('#proBar').addClass('bg-info');
			}else if(percentBar < 80){
				$('#proBar').addClass('bg-warning');			
			}else if(percentBar < 100){
				$('#proBar').addClass('bg-danger');
			}
			
			if($('#proBarDiv').hasClass('d-none')){
				$('#proBarDiv').removeClass('d-none');
			}//if
			
		 },
         error: function(xhr2, status2, er2){
         	swa("error", "파일 업로드 에러");
         }
	 }); //$.ajax
		 
}//function uploadBtnClick(){
	

function showUploadedFile(uploadResultArr) {
	
	//파일이름 출력
	var uploadResult = $(".uploadResult .wrapResult");
	 var str = "";
	 
	 $(uploadResultArr).each(function(i, obj) {

	 	if(!obj.image){//파일
	        
	        var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);
	        
	        var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
	        
	        str += "<div class='pb-2 pt-3 px-2 resultItems border justify-content-center d-flex align-items-center border' data-size='"+ obj.fileSize +"' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>"
	        	+"<div class='fileNameSize'><a href='/download?fileName="+fileCallPath+"'>"+ obj.fileName+"</a></div>"+
	            "<span data-size='"+ obj.fileSize +"' data-file=\'"+fileCallPath+"\' data-type='file'><i class=\"fas fa-times-circle text-danger deleteFileBtn\"></i></span></div>"
	        
	      }else{//이미지
	    	  
	    	//encodeURIComponent() URI호출에 적합한 문자열로 인코딩처리(공백, 한글 등 처리)
	        var fileCallPath =  encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid +"_"+obj.fileName);
			
	    	//본문에 바로 뿌리기 위한 원본 링크
	    	var fileCallPath2 =  encodeURIComponent( obj.uploadPath + "/" + obj.uuid +"_"+obj.fileName);
	    	
	    	//삭제하면 본문에서 삭제하기 위해 만드는 id용 이름
	    	var fileCallPath3 =  "z"+obj.uuid.substring(0,6);
	        
	        str += "<div class='pb-2 pt-3 px-2 resultItems border' data-size='"+ obj.fileSize +"' data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>"
        		+ "<a href=\"javascript:;\" onclick='showImage(this)'>"
        		+ "<img src='/display?fileName="+fileCallPath+"'></a>"
        		+ "<span data-size='"+ obj.fileSize +"' data-file=\'"+fileCallPath+"\' data-type='image' data-file2=\'"+fileCallPath3+"\' data-file3=\'"+fileCallPath2+"\'><i class=\"fas fa-times-circle text-danger deleteFileBtn\"></i></span></div>";
	        
	        var imgHtml = CKEDITOR.dom.element.createFromHtml( "<img class='"+fileCallPath3+"' src='/display?fileName="+fileCallPath2+"' /><br />" );
	        CKEDITOR.instances['ck_content'].insertElement(imgHtml);
	        
	      }//if
	 });//$(uploadResultArr).each(function(i, obj) {
	 uploadResult.append(str);
 }//showUploadedFile()
//=================================================================
//파일처리 관련 펑션들
//=================================================================
</script>

<script type="text/javascript">
$(document).ready(function(){
	
	//삭제
	$(".uploadResult").on("click","span", function(e){
		   
		  var targetFile = $(this).data("file");
		  var type = $(this).data("type");
		  //console.log(targetFile);
		  var idPath = $(this).data("file2");
		  var removeItem = $(this);
		  var sizeFile = $(this).data("size"); 
		  var sizeSpan = $('.file_size_status');
		  
		  
		  $.ajax({
		    url: '/deleteFile',
		    data: {fileName: targetFile, type:type},
		    dataType:'text',
		    type: 'POST',
		    beforeSend: function(){
            	Swal.fire({
                    title: '잠시만 기다려주세요',
                    text: '작업중입니다.',
                    allowOutsideClick: false,
                    allowEscapeKey: false,
                    allowEnterKey: false,
                    onOpen: () => {
                        swal.showLoading();
                    }
            	});
            },
		    success: function(result){
		    	
				swa("success", "삭제 성공");
		    	
		        if(type=='image'){
		        	var st = CKEDITOR.instances['ck_content'].document.find("."+idPath)

		        	st.$.forEach(function(v,i,o){
						v.remove();
		        	});
		        	
		        	 //화면에서 삭제
		         	 removeItem.parent().remove();
		         	 
		        	 
		         	totalFileSize -= sizeFile;
		        	 
		        	 //전체 파일사이즈 수정
		         	 sizeSpan.text( ( totalFileSize/1024).toFixed(1) );
		        	 
		         	//프로그레스바
		 			var percentBar = (totalFileSize/41943040)*100;
		 			
		         	//프로그레스바 색상
					$('#proBar').removeClass('bg-info');
					$('#proBar').removeClass('bg-warning');
					$('#proBar').removeClass('bg-danger');
					if(percentBar < 50){
						$('#proBar').addClass('bg-info');
					}else if(percentBar < 80){
						$('#proBar').addClass('bg-warning');			
					}else if(percentBar < 100){
						$('#proBar').addClass('bg-danger');
					}//if
					
		 			$('#proBar').css('width',percentBar+'%');
		 			$('#proBar').text( percentBar.toFixed(1)+"%" );
		        	 
		         }else{
		        	 removeItem.parent().remove();
					 
		        	 totalFileSize -= sizeFile;
		        	 
		        	//전체 파일사이즈 수정
		         	 sizeSpan.text( ( totalFileSize/1024).toFixed(1) );
		        	
		         	//프로그레스바
		 			var percentBar = (totalFileSize/41943040)*100;
		         	
		         	//프로그레스바 색상
		 			$('#proBar').removeClass('bg-info');
		 			$('#proBar').removeClass('bg-warning');
		 			$('#proBar').removeClass('bg-danger');
		 			if(percentBar < 50){
		 				$('#proBar').addClass('bg-info');
		 			}else if(percentBar < 80){
		 				$('#proBar').addClass('bg-warning');			
		 			}else if(percentBar < 100){
		 				$('#proBar').addClass('bg-danger');
		 			}//if
		 			$('#proBar').css('width',percentBar+'%');
		 			$('#proBar').text( percentBar.toFixed(1)+"%" );
		        	
		         }//if
		         
		         //테두리, 프로그레스바 off
		         if( $('.resultItems').length == 0 ){
		        	 if($('.uploadResult').hasClass('borderToggle')){
		 				$('.uploadResult').removeClass('borderToggle');
		 			 }//if
		        	 if(!$('#proBarDiv').hasClass('d-none')){
		 				$('#proBarDiv').addClass('d-none');
		 			 }//if
		         }//if
		         
			},
            error: function(xhr2, status2, er2){
            	swa("error", "파일 삭제 에러");
            }
		  }); //$.ajax
		  
	});//$(".uploadResult").on("click","span", function(e){
	
	
});//$(document).ready(function(){
</script>
<!-- =================================================================================================  -->
<!-- End 파일처리 -->
<!-- =================================================================================================  -->




<!-- =================================================================================================  -->
<!-- ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ js ↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑ -->
<!-- =================================================================================================  -->

<%@include file="../includes/footer.jsp"%>
