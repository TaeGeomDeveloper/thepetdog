<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>

	 <!-- Include the JS for AG Grid -->
    <script src="https://cdn.jsdelivr.net/npm/ag-grid-community/dist/ag-grid-community.min.noStyle.js"></script>
    <!-- Include the core CSS, this is needed by the grid -->
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/ag-grid-community/styles/ag-grid.css"/>
    <!-- Include the theme CSS, only need to import the theme you are going to use -->
    <link rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/ag-grid-community/styles/ag-theme-alpine.css"/>
	
	<!-- include libraries(jQuery, bootstrap) -->
	<!-- <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet"> -->
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
	
	<!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	
	<meta charset="utf-8">
	<title> </title>
</head>

<body>

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>

 		<div class="header">
 			<tiles:insertAttribute name="header" />
 		</div>
 		<div class="body-wrapper">
 			<div class="side-left">
 				<tiles:insertAttribute name="side" />
	 		</div>
			<div class="content">
				<tiles:insertAttribute name="body"/>
			</div>	
	 		<div class="footer">
	 			<tiles:insertAttribute name="footer"/>
	 		</div> 
	 	</div>
</body>

<style>

	.Main_Title {
		text-align: center; 
		font-size: 60px; 
		margin-top:20px; 
		margin-bottom:20px;
	}

	@font-face {
	    font-family: 'GoryeongStrawberry';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2304-01@1.0/GoryeongStrawberry.woff2') format('woff2');
	    font-weight: normal;
	    font-style: normal;
	}

	html, body {
		font-family: 'GoryeongStrawberry' !important;
	    margin: 0;
	    padding: 0;
	    height: 100%;
	}
	div.header {
		text-align: center;
		position: static;
	}
	div.body-wrapper {
	    min-height: 100%;
	    position: relative;
	}
	div.side-left {
		/* text-align: center; */
	  	/* height:800px; */
	}
	div.content {
		/* width:85%; */
		/* text-align: center; */
		/* height:800px; */
		padding-bottom: 57px;
	}
	div.footer {
	    width: 100%;
	    height: 57px; /* footer의 높이 */
	    position: absolute;  
	    bottom: 0;
	    left: 0;
	}
}
</style>


</html>