<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>내 정보 관리</h1>
<div>
<h3>비밀번호 재확인</h3>
<p>본인 확인을 위해 한번 더 비밀번호를 입력해주세요
<br>비밀번호는 타인에게 노출되지 않도록 주의해 주세요</p>
<form method="post" action="hm_us_mymanage2">
<input type="password" id="member_pwd" name="member_pwd" placeholder="8~20자 영문숫자 조합">
<input type ="submit" value="확인">
<input type ="reset" value="취소">
</form>
</div>
</body>
</html>