<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 시니어 모드에 있는 시니어 정보 관리로 이동하기 -->
<h2>시니어 지원하기</h2>
<form method="post" action="${pageContext.request.contextPath}/plus_senior">

<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.contextPath}">

<label>시니어 닉네임</label>
<input type="text" id="senior_nick" name="senior_nick">

<label>이메일</label>
<input type="text" id="senior_email" name="senior_email">

<label>연락처</label>
<input type="text" id="senior_phone" name="senior_phone">

<label>사업자번호</label>
<input type="text" id="senior_cmo" name="senior_cmo">

<label>계좌 정보</label>
<select>
<option></option>

</select>




</form>

</body>
</html>