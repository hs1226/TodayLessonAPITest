<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>

<input type="button" id="senior_request" 
onclick="window.open('${pageContext.request.contextPath}/senior_request_form/${pageContext.request.userPrincipal.name}','senior_form','width=570,height=420')" value="시니어 지원하기">

</body>
</html>