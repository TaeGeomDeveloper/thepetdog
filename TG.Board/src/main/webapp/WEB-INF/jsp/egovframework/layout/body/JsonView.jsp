<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title> JsonView </title>
	
	<script>
	 $(document).ready(function () {
         $("#fn_click").on('click', function (event) {
        	 
        	 $.ajax({
     		    url : "${contextPath}/JVC/test.do",
     		    success : function(data){
     		        console.log(data);
     		    } 
     		});
         });
         

		$("#fn_click2").on('click', function(event) {

				$.ajax({
					url : "${contextPath}/JVC/GetMembers.do",
					success : function(data) {
						console.log(data);
					}
				});
			});
		});
	</script>
	
	
</head>

<body>

	<div class="container">
		<h1 class="Main_Title">JsonView 페이지</h1>
		
				
		<div id="Main_Box" align="center">
			<button class="button w-100" type="button" id="fn_click">JsonView Test</button>
			<button class="button w-100" type="button" id="fn_click2">JsonView Test2</button>
		</div>
	</div>
		
</body>

</html>