<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

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
	
	<script>
	<script type="text/javascript">
		function linkPage(pageNo){
			location.href = "${contextPath}/Notice/NoticeList.do?pageNo="+pageNo;
		}
	</script>
	
</head>

<body>
	
	<div class="container">
		<h1 class="Main_Title" style="color: #f58e45;">게시글</h1>

		<!-- J 쿼리 테이블 -->
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
                        <td><a href="${contextPath}/Notice/ReadBoard.do?nb_seq=${vo.nb_seq}">${vo.nb_title} </a></td>
                        <td> ${vo.nb_name}</td>
                        <td>${vo.nb_regDate}</td>
                        <td>${vo.nb_viewCount}</td>
                        <td>
                            <c:if test="${vo.nb_originFileName!=null}">
                                <a href="${contextPath}/Notice/download.do?nb_seq=${vo.nb_seq}&token=on">
                                        ${vo.nb_originFileName}
                                </a>
                            </c:if>
                        </td>
                        <c:if test="${user.mi_id=='admin'}">
                            <td>
                                <a href="${contextPath}/Notice/delete.do?nb_seq=${vo.nb_seq}">
                                    <button class="button4">삭제</button>
                                </a>
                            </td>
                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
		
		
		<!-- 페이징 처리 -->
		<nav aria-label="Page navigation example">
			<ul class="pagination justify-content-center">

				<!-- 이전 -->
				<c:if test="${paging.currentPage eq 1}">
					<li class="page-item"><a class="page-link no-before"
						tabindex="-1" aria-disabled="true">이전</a></li>
				</c:if>
				<c:if test="${paging.currentPage ne 1}">
					<c:url var="before" value="/Notice.do">
						<c:param name="currentPage" value="${paging.currentPage - 1}" />
					</c:url>

					<li class="page-item"><a class="page-link" tabindex="-1"
						href="${before}" aria-disabled="true">이전</a></li>
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="page" begin="${paging.startPage}"
					end="${paging.endPage}">
					<c:if test="${page eq paging.currentPage }">
						<li class="page-item"><a
							class="page-link bg-primary text-light">${page}</a></li>
					</c:if>

					<c:if test="${page ne paging.currentPage }">
						<c:url var="pagination" value="/Notice.do">
							<c:param name="currentPage" value="${page}" />
						</c:url>

						<li class="page-item"><a class="page-link"
							href="${pagination}">${page}</a></li>
					</c:if>
				</c:forEach>

				<!-- 다음 -->
				<c:if test="${paging.currentPage eq paging.maxPage}">
					<li class="page-item"><a class="page-link no-before"
						tabindex="-1" aria-disabled="true">다음</a></li>
				</c:if>
				<c:if test="${paging.currentPage ne paging.maxPage}">
					<c:url var="after" value="/Notice.do">
						<c:param name="currentPage" value="${paging.currentPage + 1}" />
					</c:url>

					<li class="page-item"><a class="page-link" tabindex="-1"
						href="${after}" aria-disabled="true">다음</a></li>
				</c:if>

			</ul>
		</nav>
		
		
		<div style="margin: auto">
			<div class="d-grid gap-2 col-6 mx-auto">
				<a href="${contextPath}/Summernote.do">
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