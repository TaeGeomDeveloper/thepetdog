<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- <c:set var="contexPath" value="${pageContext.request.contextPath}" /> --%>

<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title> 로그인페이지 </title>
	
	<script>
        $(document).ready(function () {
            $("#fn_login").on('click', function (event) {
                var SendPerson = document.SendPerson;

                let id = $("#floatingInputID").val();
                let pwd = $("#floatingInputPassword").val();

                $.ajax({
                    url: "login.do",
                    type: "POST",
                    data: {mi_id: id, mi_password: pwd},
                    success: function (data, status) {
                        if (data == 'false') {
                            console.log("data false");
                            alert("등록되어 있지 않는 회원입니다.");
                            $("#mi_id").val('');
                            $("#mi_password").val('');
                        } else {
                            console.log("data true");
                            SendPerson.method = "POST";
                            SendPerson.action = "main.do";
                            SendPerson.submit();
                        }
                    },
                    error: function (data, status) {
                        alert('error' + status);
                    }
                });
            });
        });

    </script>
    
	
</head>

<body>

	<div class="Main_Box" align="center">
		<div id="MB">
			<form name="SendPerson" >
				<table class="c">
					<img src="<c:url value='/images/egovframework/example/dog.jpg'/>" alt="" style="width:200px; height:200px;"/>
					<h1 style="text-align: center; font-size: 60px; margin-top: 20px;">로그인</h1>
					<tr>
						<td class="form-floating w-80" align="center"><input
							type="text" class="form-control" id="floatingInputID"
							placeholder="아이디" name="mi_id"> <label
							for="floatingInputID"></label></td>
					</tr>
					<tr>
						<td class="form-floating w-80" align="center"><input
							type="password" class="form-control" id="floatingInputPassword"
							placeholder="비밀번호" name="mi_password"> <label
							for="floatingInputPassword"></label></td>
					</tr>
					<tr>
						<td class="checkbox mb-3"><input type="checkbox"
							value="remember-me"> 기억하기</td>
					</tr>
					<tr>
						<td align="center">
							<button class="btn btn-primary btn-lg" type="button" id="fn_login">로그인</button>
						</td>
					</tr>
				</table>
			</form>
			<form name="Find">
				<table class="c" align="center">
					<tr>
						<td><a href="">
								<button class="button w-100" type="submit" onclick="fn_find()">ID
									또는 PW 찾기</button>
						</a></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>	

<style>
	body {
            position: relative;
        }
   	
   	.Main_Box {
   		 display: flex;
		  justify-content: center;
		  align-items: center;
		  min-height: 70vh;
   	}
        
	div.loginBox {
		/* padding:50px;
		width:500px;
		margin-top: 100px;
		margin-left: 500px;
		border: 3px solid #73AD21; */
	}
</style>

</html>