<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 비밀번호 중복확인 */
$(function(){
	$("#alert-success").hide();
	$("#alert-danger").hide();
	
	$("input").keyup(function(){
		var pwd1 = $("#member_pwd").val();
		var pwd2 = $("#member_pwd2").val();
		if(pwd1 !="" || pwd2 !=""){
			if(pwd1 == pwd2){
					$("#alert-success").show();
					$("#alert-danger").hide();
					$("#submit").removeAttr("disabled");

				}else{
					$("#alert-success").hide();
					$("#alert-danger").show();
					$("#submit").attr("disabled", "disabled");
				}

			}

		});

	});
</script>
</head>
<body>
<c:set var="dto" value="${dto}"></c:set>
<form method="post" action="hm_us_mymanageupdate">
<ul>
<li>
<label for="member_id">아이디</label>
<input type ="text" id="member_id" name="member_id" value="${dto.member_id}" readonly="readonly">
</li>
<li>
<label for="member_pwd">패스워드 변경</label>
<input type="password" id="member_pwd" name="member_pwd">
</li>
<li>
<label for ="member_pwd2">패스워드 재확인</label>
<input type="password" id="member_pwd2" name="member_pwd2">
<br>
<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다</div>
<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
</li>
<li>
<label for="member_nick">닉네임</label>
<input type="text" id="member_nick" name="member_nick" value="${dto.member_nick}">
</li>
<li>
<label for="member_birth">생년월일</label>
<input type="date" id="member_birth" name="member_birth" value="${dto.member_birth}">
</li>
<li>
<label for="member_zipcode">우편번호</label>
<input type="text" id="member_zipcode" name="member_zipcode" value="${dto.member_zipcode}">
<input type="button" onclick="openDaumZipAddress();" value="주소찾기"/>
</li>
<li>
<label for="member_addr">상세주소</label>
<input type="text" id="member_addr" name="member_addr" value="${dto.member_addr}">
</li>
<li>
<label for="member_phone">핸드폰 번호</label>
<input type="text" id="member_phone" name="member_phone" value="${dto.member_phone}">
</li>
<li>
<label for="member_email">이메일</label>
<input type="text" id="member_email" name="member_email" value="${dto.member_email}">
</li>
<li>
<input type="button" id="managebtn" value="수정">
<input type="button" id="managebtn2" value="취소">ㄴ
</li>
</ul>
</form>
</body>
</html>