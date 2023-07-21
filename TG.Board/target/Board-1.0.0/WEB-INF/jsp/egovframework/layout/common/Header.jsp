<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<c:set var="contexPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title> 헤더 </title>
	
	<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
</head>

<body>

	<header class="py-2 bg-light border-bottom" >
    <div class="container">
    
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      	<img src="<c:url value='/images/egovframework/example/dog.jpg'/>" alt="" style="width:50px; height:50px;"/>
        <!-- <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
        </a> -->

        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
       <!--    <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li> -->
          <!-- <li><a href="#" class="nav-link px-2 link-secondary">Home</a></li> -->
        <li><a href="/Board/main.do" class="nav-link px-2 link-dark"><h3>애견나라</h3></a></li>
          <!-- <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
          <li><a href="#" class="nav-link px-2 text-white">About</a></li> -->
        </ul>

       <!--  <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
        </form> -->

		<!-- 로그인 파트 -->
		<c:choose>
			<c:when test="${member != null}">
				<h3 style="margin-right:10px">환영합니다. ${member.name} 님  </h3>
						<div class="dropdown">
							<div class="profile">
								<img class="dropbtn"
									src="<c:url value='/images/egovframework/example/dog.jpg'/>">
								<div class="dropdown-content">
									<ul>
										<!-- <li><i class='bx bx-cog'></i><span>Settings</span></li> -->
										<li>
											<a href="#">
												<i class='bx bx-user'></i><span>Profiles</span></li>
											</a>
										<li>
											<a href="Logout.do">
												<i class='bx bx-log-in-circle'></i><span>Logout</span>
											</a>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</c:when>
			<c:otherwise>
				<div class="text-end">
					<a href = "loginPage.do" class="no-underline"> 
			    		<button type="button" class="btn btn-outline-primary me-2">로그인</button>
			    	</a>
			    	<a href = "Register.do" class="no-underline"> 
			    		<button type="button" class="btn btn-warning">회원가입</button>
			    	</a>
			    </div>  
			</c:otherwise>
		</c:choose>
        
      </div>
      
    </div>
  </header>

	<%-- <table border=0 width="100%">
		<h1><font size=30>헤더 부분입니다.</font></h1>
	</table>
	
	<div class="login">
		<!-- <a href = "loginPage.do" class="no-underline"> 
			<h3>로그인</h3>	
		</a> -->
		<c:choose>
			<c:when test="${member != null}">
				<h3>환영합니다. ${member.name} 님</h3>
				<a href = "Logout.do" class="no-underline"> 
					<h3>로그아웃</h3>
				</a>
			</c:when>
			<c:otherwise>
				<a href = "loginPage.do" class="no-underline"> 
					<h3>로그인</h3>
				</a>
			</c:otherwise>
		</c:choose>
	</div> --%>
		
</body>

<style>
	div.login {
		text-align:right;
		padding-right:50px;
	}
	
	.container2 {
	   	height: 20vh;
	    display: flex;
	    /* justify-content: center; */
	}
	
	.profile {
    position: relative;
    text-align: center;
    margin-top: 0px
	}
	
	.profile img {
	    width: 60px;
	    height: 60px;
	    border-radius: 50%;
	    border: 2px solid white;
	    cursor: pointer
	}
	
	.dropdown-content {
	    display: none;
	    position: absolute;
	    background-color: #f1f1f1;
	    min-width: 160px;
	    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	    z-index: 1;
	    transition:all 2s;
	}
	
	/* .dropdown-content a {
	    color: black;
	    padding: 12px 16px;
	    text-decoration: none;
	    display: block
	} */
	
	/* .dropdown-content a:hover {
	    background-color: #ddd
	} */
	
	.dropdown:hover .dropdown-content {
	    display: block
	}
	
	.profile ul {
	    background-color: #fff;
	    width: 200px;
	    height: 100px;
	    border-radius: 10px;
	    right: 36px;
	    top: 0px;
	    position: absolute;
	    padding: 8px;
	    transition: all 0.5s;
	    z-index: 1
	}
	
	.profile ul::before {
	    content: '';
	    position: absolute;
	    background-color: #fff;
	    height: 10px;
	    width: 10px;
	    top: -5px;
	    transform: rotate(45deg)
	}
	
	.profile ul li {
	    list-style: none;
	    text-align: left;
	    font-size: 15px;
	    padding: 10px;
	    display: flex;
	    align-items: center;
	    transition: all 0.5s;
	    cursor: pointer;
	    border-radius: 4px
	}
	
	.profile ul li:hover {
	    background-color: #eee
	}
	
	.profile ul li i {
	    margin-right: 7px
	}
</style>

</html>