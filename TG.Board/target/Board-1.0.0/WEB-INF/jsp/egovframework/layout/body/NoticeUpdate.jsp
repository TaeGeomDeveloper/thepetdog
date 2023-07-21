<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}" /> --%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title> 썸머노트 </title>
	
	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	
	<script>
	/* $(document).ready(function() {
		//여기 아래 부분
		$('#nb_content').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
	          
		});

		// 서머노트 쓰기 비활성화
		$('#nb_content').summernote('disable');
		// 서머노트 쓰기 활성화
		$('#nb_content').summernote('enable');
		// 서머노트 리셋
		$('#nb_content').summernote('reset');

		// 마지막으로 한 행동 취소 ( 뒤로가기 )
		$('#nb_content').summernote('undo');
		// 앞으로가기
		$('#nb_content').summernote('redo');
	}); */
	
	$(document).ready(function() {
		  $('#nb_content').summernote({
	 	    	placeholder: 'content',
		        minHeight: 370,
		        maxHeight: null,
		        focus: true, 
		        lang : 'ko-KR'
		  });
		  // Summernote에 글 내용 추가하는 코드
		  $("#nb_content").summernote('code',  '${notice.nb_content}');
		});
	</script>

<script>
     function update_check(){
         var updateForm = document.updateForm;
         let nb_title = $("#nb_title").val();

         if(nb_title == ""){
             alert("제목를 입력해주세요");
             nb_title.focus();
             return false;
         };

         updateForm.method = "post";
         updateForm.action = "/Board/Notice/updateBoard.do";
         //writeForm.action = "/Board/Notice/createBoard.do"; 
         updateForm.submit();
     }
 </script>

	<!-- enctype="multipart/form-data" -->
	
</head>

<body>

	<div class="container">

		<h1 class="Main_Title" style="color: #f58e45;">게시글 작성</h1>
		
		<form name="updateForm" enctype="multipart/form-data">
			<div style="border: 10px solid #f7a063; border-radius: 20px; margin-bottom: 20px; margin-top: 30px;">
				<table style="margin: 20px">
					<tr>
						<th>ID</th>
						<td><input class="form-control" placeholder="id" type="text"
							name="nb_id" id="nb_id" value="${member.id}" readonly="readonly"
							style="width: 25%" /></td>
					</tr>
					<tr>
						<th>작성자</th>
						<td><input class="form-control" placeholder="name"
							type="text" name="nb_name" id="nb_name" value="${member.name}"
							readonly="readonly" style="width: 25%" /></td>
					</tr>
					<tr>
                        <th>제목</th>
                        <td><input class="form-control" type="text" name="nb_title" id="nb_title" maxlength='50' value="${notice.nb_title}" style="width: 80%;"></td>
                        <td><input type="hidden" name="nb_seq" value="${notice.nb_seq}" ></td>
                    </tr>
                    <tr>
                        <th>내용</th>
                        <td width="1000px" ><textarea name="nb_content" id="nb_content"></textarea>
                        </td>
                    </tr>
                    <tr>
						<th>첨부파일</th>
						<td><input class="form-control" placeholder="file"
							type="file" name="nb_attachedFile" id="nb_attachedFile"
							style="width: 50%" /></td>
					</tr>
                </table>
             </div>
		</form>
		<div style="margin: auto">
			<div class="d-grid gap-2 col-6 mx-auto">
				<button class="btn btn-warning" type="button"
					onclick="update_check()" style="">수정완료</button>
			</div>
		</div>
	</div>

	<!-- div에 에디터를 사용하는 경우 -->
	<!-- <div id="summernote">Hello Summernote</div> -->

</body>

<style>
	th {
		padding:20px;
	}
</style>

</html>