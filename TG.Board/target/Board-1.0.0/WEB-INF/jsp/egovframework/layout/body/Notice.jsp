<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}" /> --%>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title> 게시글 </title>
	
	<script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css">
	
	  <script>
        $(document).ready(function () {
            $('#table_i').DataTable({
                order: [ [ 0, "desc" ] ]
            });
        });
    </script>
	
</head>

<body>
	
	<div class="container">
		<h1 class="Main_Title" style="color: #f58e45;">게시글</h1>
	
		<table id="table_i" class="table table-striped table-bordered" style="width:100%;">
                <thead style="background-color: #f7a063">
                <tr>
                    <th>글번호</th>
                    <th style="width: 40%">제목</th>
                    <th>작성자</th>
                    <th>등록일</th>
                    <th>조회수</th>
                    <th>첨부파일</th>
                    <c:if test="${user.id=='admin'}">
                        <th>삭제 버튼</th>
                    </c:if>
                </tr>
                </thead>
                <tbody class="table-group-divider">
                <c:forEach var="vo" items="${list}">
                    <tr>
                        <th scope="row">${vo.nb_seq}</th>
                        <td><a href="/Board/Notice/ReadBoard.do?nb_seq=${vo.nb_seq}">${vo.nb_title} </a></td>
                        <td> ${vo.nb_name}</td>
                        <td>${vo.nb_regDate}</td>
                        <td>${vo.nb_viewCount}</td>
                        <td>
                            <c:if test="${vo.nb_originFileName!=null}">
                                <a href="/Board/Notice/download.do?nb_seq=${vo.nb_seq}&token=on">
                                        ${vo.nb_originFileName}
                                </a>
                            </c:if>
                        </td>
                        <c:if test="${user.mi_id=='admin'}">
                            <td>
                                <a href="delete.do?nb_seq=${vo.nb_seq}">
                                    <button class="button4">삭제</button>
                                </a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
		
		<div style="margin: auto">
			<div class="d-grid gap-2 col-6 mx-auto">
				<a href="/Board/Summernote.do">
					<button class="btn btn-warning" type="button" style="width:100%">신규작성</button>
				</a>
			</div>
		</div>
		
	</div>

</body>


<style>
body {
            position: relative;
        }
</style>


</html>