<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%--
  작성자 : 윤태검

  일시 : 2023-07-06
  내용 : 회원 가입 화면.
--%>

<html lang="ko">

<head>
    <title>Main</title>
    
</head>

  <%-- 폰트 --%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Jua&display=swap');
    </style>

	<script>
		// 아이디 중복체크
        let idCheckYN = "N";
        let phoneCheckYN = "N";
        $(document).ready(function () {
            //console.log('in');
            $('#idCheck').on('click', function (event) {
                //alert(event.target.id);
                let memberId = $('#mi_id').val();
                let idCheck = /^[A-Za-z0-9]{6,12}$/;
                //debugger;
                console.log(idCheckYN);
                //alert(memberId);
                $.ajax({
                    type : 'get',
                    dataType : 'text',
                    url : "idCheck.do",
                    data : {mi_id : memberId},
                    success : function (data, status) {
                        //alert(data);
                        if(memberId == ""){
                            alert("아이디를 입력해주세요");
                            memberId.focus();
                            idCheckYN = "N"
                        }
                        if(!idCheck.test(memberId)){
                            $("#unrightId").css('display', 'inline-block');
                            $('#unrightId').html("사용할 수 없는 아이디 입니다.")
                            $("#rightId").css('display', 'none');
                            $('#mi_id').val("");
                            $('#mi_id').focus();
                            idCheckYN = "N"
                        }
                        if(data=='true'){
                            $("#unrightId").css('display', 'inline-block');
                            $('#unrightId').html("중복된 아이디 입니다.")
                            $("#rightId").css('display', 'none');
                            $('#mi_id').val("");
                            $('#mi_id').focus();
                            idCheckYN = "N"
                        }
                        if(idCheck.test(memberId)){
                            $("#rightId").css('display', 'inline-block');
                            $('#rightId').html("사용할 수 있는 아이디 입니다.")
                            $("#unrightId").css('display', 'none');
                            $('#isIdCheck').val('true');
                            idCheckYN = "Y"
                        }
                        console.log("idCheckYN :"+idCheckYN);
                    },
                    error : function (data, status){
                        alert('error'+status);
                    },
                    complete : function (xhr, status){
                        //alert(xhr.status);
                    }
                });
            });
        });
        
        // 비밀번호 체크
        $(document).focusout(function () {
            let pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
            let password1 = $("#password_1").val();

            if (password1 != '') {
                null;
            }

            if (pwdCheck.test(password1)) {
                $("#rightPwd").css('display', 'inline-block');
                $('#rightPwd').html("적합한 비밀번호 입니다.");
                $("#unrightPwd").css('display', 'none');
            } else {
                $("#rightPwd").css('display', 'none');
                $("#unrightPwd").css('display', 'inline-block');
                $('#unrightPwd').html("부적합 비밀번호 입니다.")
            }

        });
        // 비밀번호 확인 체크
        $(document).focusout(function () {
            var pwd1 = $("#password_1").val();
            var pwd2 = $("#password_2").val();

            if ( pwd1 != '' && pwd2 == '' ) {
                null;
            } else if (pwd1 != "" || pwd2 != "") {
                if (pwd1 == pwd2) {
                    $("#success").css('display', 'inline-block');
                    $('#success').html("비밀번호가 일치합니다");
                    $("#fail").css('display', 'none');
                } else {
                    $("#success").css('display', 'none');
                    $("#fail").css('display', 'inline-block');
                    $('#fail').html("비밀번호가 일치하지 않습니다. 비밀번호를 재확인 해주세요.")
                }
            }
        });
	</script>
	
	<script>
	// 회원가입 절차
	// 필수 입력 ( 아이디, 비번, 이름, 이메일  )
	
	function joinform_check() {

        var SendPerson = document.SendPerson;
        var re = /^[a-zA-Z0-9]{4,12}$/ // 아이디와 패스워드가 적합한지 검사할 정규식
        var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
       	// var arrNum1 = new Array(); // 주민번호 앞자리숫자 6개를 담을 배열
        // var arrNum2 = new Array(); // 주민번호 뒷자리숫자 7개를 담을 배열

        let id = $("#mi_id").val();
        let password1 = $("#password_1").val();
        let password2 = $("#password_2").val();
        let name = $("#mi_name").val();
        //let regNum1 = document.getElementById("regNum1");
        //let regNum2 = document.getElementById("regNum2");
        //let address = $("#mi_address").val();
        //let addressCode = $("#mi_addressCode").val();
        //let addressDetail = $("#mi_addressDetail").val();
        //let mi_phone = $("#mi_phone").val()
        //let mi_phone_1 = $("#mi_phone1").val()
        //let mi_phone_2 = $("#mi_phone2").val();
        //let authNum = $("#authNum").val();
        let email = $("#mi_email").val();
        let emailAddress = $("#mi_email1").val();
        console.log(id);
        console.log(password1);
        console.log(password2);
        console.log(name);
        //console.log(regNum1);
        //console.log(regNum2);
        //console.log(address);
        //console.log(addressCode);
        //console.log(addressDetail);
        //console.log(mi_phone);
        //console.log(mi_phone_1);
        //console.log(mi_phone_2);
        //console.log(authNum);
        console.log(email);
        console.log(emailAddress);
        
        // 입력 체크
        if (id == "") {
            alert("아이디를 입력해주세요");
            id.focus();
            return false;
        };

        if(idCheckYN=="N"){
            alert("아이디 중복체크를 해주세요");
            return false;
        }

        /* if(phoneCheckYN=="N"){
            alert("인증번호를 확인해주세요.");
            return false;
        } */

        if (password1 == "") {
            alert("비밀번호를 입력해주세요");
            password1.focus();
            return false;
        }

        if (password2 == "") {
            alert("비밀번호를 확인 해주세요");
            password2.focus();
            return false;
        }

        if(password1!=password2){
            alert("비밀번호가 일치하지 않습니다.");
            password1.focus();
            password2.focus();
            return false;
        }

        const pwdCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
        if (!pwdCheck.test(password1)) {
            alert("비밀번호는 영문자+숫자+특수문자 조합으로 8자리 이상 사용해야 합니다.");
            password1.focus();
            return false;
        }

        if (name == "") {
            alert("이름을 입력해주세요");
            name.focus();
            return false;
        }

        /* if (regNum1 == "", regNum2 == "") {
            alert("주민등록번호를 입력해주세요");
            regNum1.focus();
            regNum2.focus();
            return false;
        } */

       /*  if (address == "", addressDetail == "", addressCode == "") {
            alert("주소 관련 항목들을 입력해주세요");
            address.focus();
            addressDetail.focus();
            addressCode.focus();
            return false;
        } */

        /* if (mi_phone == "010", mi_phone_1=="", mi_phone_2=="") {
            alert("휴대전화를 입력해주세요");
            mi_phone.focus();
            mi_phone_1.focus();
            mi_phone_2.focus();
            return false;
        } */

       /*  if (authNum == "") {
            alert("인증번호를 입력해주세요");
            authNum.focus();
            return false;
        } */

        if (email == "") {
            alert("이메일을 입력해주세요");
            email.focus();
            return false;
        }

        if (emailAddress == "none") {
            alert("이메일 주소를 입력해주세요");
            emailAddress.focus();
            return false;
        }

        SendPerson.method = "post";
        SendPerson.action = "registProcess.do";
        SendPerson.submit();
    }
	</script>
	
</head>
	
<%--몸통--%>
<body>
		<div class="container">
			<div class="Main_Box" align="center"">
				<div id="MB">
					<h1 class="Main_Title">회원가입</h1>
					<h5>필수입력 : ID, PWD, 이름, 이메일</h3>
					<div style="border: 5px solid #0080FF; border-radius: 20px; padding: 20px; height: auto; text-align: left; min-height: 600px; margin-top:20px;">
					<form name="SendPerson" style="margin-top: 20px;">
						<input type="hidden" name="" id="isIdCheck" value="false">
						<table>
							<tr>
								<th>ID</th>
								<td class="d-flex p-2"><input
									class="form-control form-control" type="text" name="mi_id"
									id="mi_id" maxlength="12"
									oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '').replace(/(\..*)\./g, '$1');">
									<input type="button" class="btn btn-primary" name="id_check"
									value="중복확인" id="idCheck">  <span
									style="font-size: 10pt;">아이디는 영문+숫자 조합으로 6~12자리 사용해야
										합니다.</span></td>
							</tr>
							<tr>
								<th></th>
								<td>
									<span id="rightId" style="display: none; color: green"></span> 
									<span id="unrightId" style="display: none; color: red"></span>
								</td>
							</tr>	
							<tr>
								<th>PWD</th>
								<td class="d-flex p-2"><input
									class="form-control form-control" type="password"
									name="mi_password" id="password_1">  <span
									style="font-size: 10pt;">비밀번호는 8자 이상이어야 하며, 숫자/소문자/특수문자를
										모두 포함해야 합니다.</span></td>
							</tr>
							<tr>
								<th></th>
								<td>
									<span id="rightPwd" style="display: none; color: green"></span> 
									<span id="unrightPwd" style="display: none; color: red"></span>
								</td>
							</tr>
							<tr>
								<th>비밀번호 확인</th>
								<td><input class="form-control form-control"
									type="password" id="password_2"> <span id="success"
									style="display: none;"></span> <span id="fail"
									style="display: none; color: red"></span></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input class="form-control form-control" type="text"
									name="mi_name" id="mi_name"></td>
							</tr>
							<tr>
								<th>주민등록번호</th>
								<td class="d-flex p-2"><input
									class="form-control form-control" type="text"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									name="mi_regidentRegNumber" id="regNum1" maxlength="6"><span
									style="font-size: 20pt;"> - </span> <input
									class="form-control form-control" type="password"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');"
									name="mi_regidentRegNumber" id="regNum2" maxlength="7">
								</td>
							</tr>
							<div id="callBackDiv">
								<input type="hidden" style="width: 500px;" id="roadFullAddr"
									name="roadFullAddr" />
								<tr>
									<th>도로명주소</th>
									<td class="d-flex p-2"><input
										class="form-control form-control" type="text"
										style="width: 500px;" id="mi_address" name="mi_address"
										readonly="readonly" />
										<button class="btn btn-primary" type="button" onClick="goPopup();">주소
											찾기</button></td>
								</tr>
								<tr>
									<th>상세주소</th>
									<td><input class="form-control form-control" type="text"
										style="width: 500px;" id="mi_addressDetail"
										name="mi_addressDetail" readonly="readonly" /></td>
								</tr>
								<input type="hidden" style="width: 500px;" id="roadAddrPart2"
									name="roadAddrPart2" /> <input type="hidden"
									style="width: 500px;" id="engAddr" name="engAddr" /> <input
									type="hidden" style="width: 500px;" id="jibunAddr"
									name="jibunAddr" />
								<tr>
									<th>우편번호</th>
									<td><input class="form-control form-control" type="text"
										style="width: 100px;" id="mi_addressCode"
										name="mi_addressCode" readonly="readonly" /></td>
								</tr>
							</div>
							<tr>
								<th>휴대전화</th>
								<td class="d-flex p-2"><select class="form-select"
									style="width: 100px" name="mi_phone" id="mi_phone">
										<option value="010" selected="selected">010</option>
								</select><span style="font-size: 20pt;"> - </span> <input
									class="form-control form-control" style="width: 100px;"
									type="text" name="mi_phone" id="mi_phone1" maxlength="4"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
									<span style="font-size: 20pt;"> - </span> <input
									class="form-control form-control" style="width: 100px;"
									type="text" name="mi_phone" id="mi_phone2" maxlength="4"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
									<input type="button" id="sendSMS" class="btn btn-primary"
									value="인증번호 받기" /></td>
							</tr>
							<tr>
								<td><span id="submitPop"
									style="display: none; color: lightgray"> </span></td>
							</tr>
							<tr>
								<th>인증 번호</th>
								<td><input type="text" id="authNum"
									placeholder="인증 번호를 입력하세요"> <input type="button"
									value="확인" class="button" id="checkQualifiedNumber"></td>
							</tr>
							<tr>
								<th>일반전화</th>
								<td class="d-flex p-2"><select class="form-select"
									style="width: 100px" name="mi_wireline" id="mi_wireline">
										<option selected="selected" value="none">선택</option>
										<option value="031">031</option>
										<option value="032">032</option>
										<option value="033">033</option>
										<option value="041">041</option>
										<option value="042">042</option>
										<option value="043">043</option>
										<option value="044">044</option>
										<option value="051">051</option>
										<option value="052">052</option>
										<option value="053">053</option>
										<option value="054">054</option>
										<option value="055">055</option>
										<option value="061">061</option>
										<option value="062">062</option>
										<option value="063">063</option>
										<option value="064">064</option>
								</select><span style="font-size: 20pt;"> - </span> <input
									class="form-control form-control" style="width: 100px;"
									type="text" name="mi_wireline" id="mi_wireline1" maxlength="3"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /><span
									style="font-size: 20pt;"> - </span> <input
									class="form-control form-control" style="width: 100px;"
									type="text" name="mi_wireline" id="mi_wireline2" maxlength="4"
									oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" />
								</td>
							</tr>
							<tr>
								<th>이메일주소</th>
								<td class="d-flex p-2"><input
									class="form-control form-control" type="text" name="mi_email"
									id="mi_email"
									oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '').replace(/(\..*)\./g, '$1');"><span
									style="font-size: 20pt;"> @ </span> <input
									class="form-control form-control" type="text" name="mi_email1"
									id="mi_email1" /> <select class="form-select"
									style="width: 200px" name="domain_list" id="domain_list">
										<option value="type" selected="selected">직접입력</option>
										<option value="naver.com">naver.com</option>
										<option value="daum.net">daum.net</option>
										<option value="gmail.com">gmail.com</option>
										<option value="nate.com">nate.com</option>
								</select></td>
							</tr>
							<tr>
								<td><input type="hidden" name="mi_joinDate"></td>
							</tr>
						</table>
						</form>
					</div>
					<button class="btn btn-primary btn-lg" type="button" onclick="joinform_check();" style="margin-top:20px;"
							id="validate">가입 하기</button>
				</div>
			</div>
		</div>
</body>

<style>
	body {
            position: relative;
        }
    th {
            text-align: center;
           /*  background: #aeed9d; */
            max-width: 100px;
            min-width: 100px;
        }
    .Main_Box {
   		 display: flex;
		  justify-content: center;
		  align-items: center;
   	}
</style>


</html>