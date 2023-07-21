<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />

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
	$(document).ready(function() {
		//여기 아래 부분
		$('#nb_content').summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	          
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
		
	}); 
	</script>
	
	<script>
	 function writeform_check(){
		 var writeForm = document.writeForm;

	      /* let nb_title = $("#nb_title").val();
	      let nb_attachedFile = $("#nb_attachedFile").val();
	      
	      console.log(nb_attachedFile);
	      
	      if(nb_title == ""){
	        alert("제목를 입력해주세요");
	        nb_title.focus();
	        return false;
	      }; */
			//debugger;
	      
	      writeForm.method = "post";
	      writeForm.action = "${contextPath}/Notice/createBoard.do"; 
	      writeForm.submit();
	    }
	 
	</script>
	<!-- enctype="multipart/form-data" -->
</head>

<body>

	<div class="container">

		<h1 class="Main_Title" style="color: #f58e45;">게시글 작성</h1>
		
		<form name="writeForm" method="post"  enctype="multipart/form-data">
			<div
				style="border: 10px solid #f7a063; border-radius: 20px; margin-bottom: 20px; margin-top: 30px;">
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
						<td><input class="form-control" placeholder="Title"
							type="text" name="nb_title" id="nb_title" style="width: 50%" /></td>
					</tr>
					<tr>
						<th>내용</th>
						<td style="width: 1000px"><textarea id="nb_content"
								name="nb_content"></textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input class="form-control" placeholder="file"
							type="file" name="nb_attachedFile" id="nb_attachedFile"
							style="width: 50%" /></td>
					</tr>
				</table>
			</div>
			<div style="margin: auto">
				<div class="d-grid gap-2 col-6 mx-auto">
					<button class="btn btn-warning" type="button"
						onclick="writeform_check()" style="">작성하기</button>
				</div>
			</div>
		</form>

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