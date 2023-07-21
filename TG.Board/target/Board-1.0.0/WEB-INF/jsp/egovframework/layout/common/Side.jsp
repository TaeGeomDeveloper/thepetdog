<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}" /> --%>

<!DOCTYPE html>
<html lang="ko">



<head>
	<meta charset="UTF-8">
	<title>사이드 메뉴</title>
	
	<link href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css" rel="stylesheet">
	
	<script>
	$(document).ready(function () {
		const body = document.querySelector('body'),
	    sidebar = body.querySelector('nav'),
	    toggle = body.querySelector(".toggle"),
	    searchBtn = body.querySelector(".search-box"),
	    modeSwitch = body.querySelector(".toggle-switch"),
	    modeText = body.querySelector(".mode-text");
	
		toggle.addEventListener("click", () => {
		    sidebar.classList.toggle("close");
		})
		
		searchBtn.addEventListener("click", () => {
		    sidebar.classList.remove("close");
		})
		
		modeSwitch.addEventListener("click", () => {
		    body.classList.toggle("dark");
		
		    if (body.classList.contains("dark")) {
		        modeText.innerText = "Light mode";
		    } else {
		        modeText.innerText = "Dark mode";
		
		    }
		});
	});
	</script>
	
</head>

<style>
a {
	text-decoration: none;
}

/* @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
} */

:root{
   
    --body-color: #EEE8E8;
    --sidebar-color: #FFF;
    --primary-color: #1707c4;
    --primary-color-light: #F6F5FF;
    --toggle-color: #DDD;
    --text-color: #383838;
    --tran-03: all 0.2s ease;
    --tran-03: all 0.3s ease;
    --tran-04: all 0.3s ease;
    --tran-05: all 0.3s ease;
}

body{
    min-height: 100vh;
    background-color: var(--body-color);
    transition: var(--tran-05);
}

::selection{
    background-color: var(--primary-color);
    color: #fff;
}

body.dark{
    --body-color: #18191a;
    --sidebar-color: #242526;
    --primary-color: #3a3b3c;
    --primary-color-light: #3a3b3c;
    --toggle-color: #fff;
    --text-color: #ccc;
}

/* ===== Sidebar ===== */
 .sidebar{
    position: fixed;
    top: 0;
    left: 0;
    height: 100%;
    width: 250px;
    padding: 10px 14px;
    background: var(--sidebar-color);
    transition: var(--tran-05);
    z-index: 100;  
}
.sidebar.close{
    width: 88px;
}

/* ===== Reusable code - Here ===== */
.sidebar li{
    height: 50px;
    list-style: none;
    display: flex;
    align-items: center;
    margin-top: 10px;
}

.sidebar header .image,
.sidebar .icon{
    min-width: 60px;
    border-radius: 6px;
}

.sidebar .icon{
    min-width: 60px;
    border-radius: 6px;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 20px;
}

.sidebar .text,
.sidebar .icon{
    color: var(--text-color);
    transition: var(--tran-03);
}

.sidebar .text{
    font-size: 17px;
    font-weight: 500;
    white-space: nowrap;
    opacity: 1;
}
.sidebar.close .text{
    opacity: 0;
}
/* =========================== */

.sidebar header{
    position: relative;
}

.sidebar header .image-text{
    display: flex;
    align-items: center;
}
.sidebar header .logo-text{
    display: flex;
    flex-direction: column;
}
header .image-text .name {
    margin-top: 2px;
    font-size: 18px;
    font-weight: 600;
}

header .image-text .profession{
    font-size: 16px;
    margin-top: -2px;
    display: block;
}

.sidebar header .image{
    display: flex;
    align-items: center;
    justify-content: center;
}

.sidebar header .image img{
    width: 40px;
    border-radius: 6px;
}

.sidebar header .toggle{
    position: absolute;
    top: 50%;
    right: -35px;
    transform: translateY(-50%) rotate(180deg);
    height: 40px;
    width: 40px;
    background-color: var(--primary-color);
    color: var(--sidebar-color);
    border-radius: 3px;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 22px;
    cursor: pointer;
    transition: var(--tran-05);
}

body.dark .sidebar header .toggle{
    color: var(--text-color);
}

.sidebar.close .toggle{
    transform: translateY(-50%) rotate(0deg);
}

.sidebar .menu{
    margin-top: 40px;
}

.sidebar li.search-box{
    border-radius: 6px;
    background-color: var(--primary-color-light);
    cursor: pointer;
    transition: var(--tran-05);
}

.sidebar li.search-box input{
    height: 100%;
    width: 100%;
    outline: none;
    border: none;
    background-color: var(--primary-color-light);
    color: var(--text-color);
    border-radius: 6px;
    font-size: 17px;
    font-weight: 500;
    transition: var(--tran-05);
}
.sidebar li a{
    list-style: none;
    height: 100%;
    background-color: transparent;
    display: flex;
    align-items: center;
    height: 100%;
    width: 100%;
    border-radius: 6px;
    text-decoration: none;
    transition: var(--tran-03);
}

.sidebar li a:hover{
    background-color: var(--primary-color);
}
.sidebar li a:hover .icon,
.sidebar li a:hover .text{
    color: var(--sidebar-color);
}
body.dark .sidebar li a:hover .icon,
body.dark .sidebar li a:hover .text{
    color: var(--text-color);
}

.sidebar .menu-bar{
    height: calc(100% - 55px);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    overflow-y: scroll;
}
.menu-bar::-webkit-scrollbar{
    display: none;
}
.sidebar .menu-bar .mode{
    border-radius: 6px;
    background-color: var(--primary-color-light);
    position: relative;
    transition: var(--tran-05);
}

.menu-bar .mode .sun-moon{
    height: 50px;
    width: 60px;
}

.mode .sun-moon i{
    position: absolute;
}
.mode .sun-moon i.sun{
    opacity: 0;
}
body.dark .mode .sun-moon i.sun{
    opacity: 1;
}
body.dark .mode .sun-moon i.moon{
    opacity: 0;
}

.menu-bar .bottom-content .toggle-switch{
    position: absolute;
    right: 0;
    height: 100%;
    min-width: 60px;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 6px;
    cursor: pointer;
}
.toggle-switch .switch{
    position: relative;
    height: 22px;
    width: 40px;
    border-radius: 25px;
    background-color: var(--toggle-color);
    transition: var(--tran-05);
}

.switch::before{
    content: '';
    position: absolute;
    height: 15px;
    width: 15px;
    border-radius: 50%;
    top: 50%;
    left: 5px;
    transform: translateY(-50%);
    background-color: var(--sidebar-color);
    transition: var(--tran-04);
}

body.dark .switch::before{
    left: 20px;
}

.home{
    position: absolute;
    top: 0;
    left: 250px;
    height: 100vh;
    width: calc(100% - 250px);
    background-color: var(--body-color);
    transition: var(--tran-05);
}
.home .text{
    font-size: 30px;
    font-weight: 500;
    color: var(--text-color);
    padding: 12px 60px;
}

.sidebar.close ~ .home{
    left: 78px;
    height: 100vh;
    width: calc(100% - 78px);
}
body.dark .home .text{
    color: var(--text-color);
}

ol, ul {
  padding-left: 0;
}

</style>

<body>
	
	<nav class="sidebar close">
        <header>
            <div class="image-text">
                <span class="image">
                    <!--<img src="logo.png" alt="">-->
                </span>

                <div class="text logo-text">
                    <span class="name">애견나라</span>
                    <span class="profession">Menu</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">

                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text" placeholder="Search...">
                </li>

                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="/Board/main.do">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">HOME</span>
                        </a>
                    </li>   
					
				<li class="nav-link">
                        <a href="/Board/moa.do">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">애견 갤러리</span>
                        </a>
                    </li>
					
					<!-- <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">상점</span>
                        </a>
                    </li> -->
					
					<c:choose>
							<c:when test="${member != null}">
								<li class="nav-link">
									<!-- <a href="#">
	                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
	                            <span class="text nav-text">TEST</span>
	                        </a> --> <i class='bx bx-bar-chart-alt-2 icon'></i>
									<button type="button" class="btn btn-warning dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="width: 100%">
										<span class="text nav-text" style="color: white"> 회원 메뉴
										</span>
									</button>
	
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<li><a class="dropdown-item" href="/Board/Notice.do"><span class="text nav-text">게시글</span></a></li>
										<li><a class="dropdown-item" href="/Board/PatList.do"><span class="text nav-text">회원의 애완동물</span></a></li>
									</ul>
									
								</li>
							</c:when>
					</c:choose>

					
					<c:choose>
							<c:when test="${member != null}">
								<li class="nav-link">
									<!-- <a href="#">
	                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
	                            <span class="text nav-text">TEST</span>
	                        </a> --> <i class='bx bx-bar-chart-alt-2 icon'></i>
									<button type="button" class="btn btn-success dropdown-toggle"
										data-bs-toggle="dropdown" aria-expanded="false"
										style="width: 100%">
										<span class="text nav-text" style="color: white"> 관리자 메뉴
										</span>
									</button>
	
									<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
										<li><a class="dropdown-item" href="/Board/myPage.do"><span
												class="text nav-text">회원정보</span></a></li>
									</ul>
								</li>
							</c:when>
					</c:choose>

					<li class="nav-link">
                        <!-- <a href="#">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">TEST</span>
                        </a> -->
                 			<i class='bx bx-bar-chart-alt-2 icon' ></i>
							<button  type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="width:100%">
						      <span class="text nav-text" style="color:white"> TEST </span>
						  	</button>
						 
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
						    <li><a class="dropdown-item" href="/Board/board.do"><span class="text nav-text">미니 게시판</span></a></li>
						    <li><a class="dropdown-item" href="/Board/JVC.do"><span
												class="text nav-text">JV테스트</span></a></li>
						  </ul>
						  
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">Notifications</span>
                        </a>
                    </li>
   
                </ul>
            </div>

            <div class="bottom-content">
                <li class="">
                    <a href="Logout.do">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

                <li class="mode">
                    <div class="sun-moon">
                        <i class='bx bx-moon icon moon'></i>
                        <i class='bx bx-sun icon sun'></i>
                    </div>
                    <span class="mode-text text">Dark mode</span>

                    <div class="toggle-switch">
                        <span class="switch"></span>
                    </div>
                </li>

            </div>
        </div>

    </nav>

<!--     <section class="home">
        <div class="text">Dashboard Sidebar</div>
    </section> -->
	
	<%-- <h1>
	<a href = "main.do" class="no-underline">메인</a><br>
				<a href = "board.do" class="no-underline">게시판</a><br>
				<a href = "PatList.do" class="no-underline">애완동물정보</a><br>
				<a href = "Summernote.do" class="no-underline">썸머노트</a><br>
	<c:choose>
			<c:when test="${member != null}">
				<br>관리자 메뉴<br><br>
				<a href = "myPage.do" class="no-underline">회원정보</a><br>
				<a href = "JVC.do" class="no-underline">JV테스트</a><br>
			</c:when>
	</c:choose>
	</h1> --%>
	
	
</body>

</html>