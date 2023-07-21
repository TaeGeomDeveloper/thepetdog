<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}" /> --%>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title> 게시글 내용 </title>
</head>

<body>
	
	<div class="container">
		<h1 class="Main_Title" style="color: #f58e45;">게시글</h1>
		
			<div class="d-flex justify-content-center" style="text-align: center; ">
                <table class="table align-middle" style="margin-top: 30px;  border: 5px solid #f7a063;">
                    <thead style="background-color: #f7a063">
                    <tr>
                        <th scope="col" style="width: 5%">번호</th>
                        <th scope="col" style="width: 35%">제목</th>
                        <th scope="col" style="width: 10%">작성자</th>
                        <th scope="col" style="width: 15%">등록일</th>
                        <th scope="col" style="width: 5%">조회수</th>
                        <th scope="col" style="width: 10%">첨부파일</th>
                        <!-- <th scope="col" style="width: 10%">다운 횟수</th> -->
                        <c:if test="${member.id == notice.nb_id}">
                            <th scope="col" >수정</th>
                            <th scope="col" >삭제</th>
                        </c:if>
                    </tr>
                    </thead>
                    <tbody class="table-group-divider">
                    <tr style="margin: auto">
                        <td>${notice.nb_seq}</td>
                        <td>${notice.nb_title}</td>
                        <td>${notice.nb_id}</td>
                        <td>${notice.nb_regDate}</td>
                        <td>${notice.nb_viewCount}</td>
                        <td><a href="/Board/Notice/download.do?nb_seq=${notice.nb_seq}&token=on">
                            ${notice.nb_originFileName}</a></td>
                       <%--  <td>${notice.nb_downloadCount}</td> --%>
                        <c:if test="${member.id == notice.nb_id}">
                            <td><a href="viewUpdatePage.do?nb_seq=${notice.nb_seq}">
                                <button class="button3">수정</button>
                            </a></td>
                            <td><a href="delete.do?nb_seq=${notice.nb_seq}">
                                <button class="button3">삭제</button>
                            </a></td>
                        </c:if>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div style="border: 5px solid #f7a063; border-radius: 20px; padding: 20px; height: auto; text-align: left; min-height: 600px">
                ${notice.nb_content}
            </div>
		
	</div>

</body>


<style>
body {
            position: relative;
        }
</style>

</html>