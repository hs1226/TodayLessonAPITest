<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="item" value="${dto }"></c:set>
글내용
글번호 : ${item.freeboard_no } <br>
작성자 : ${item.member_nick } <br>
조회수 : ${item.freeboard_readno } <br>
제목 : ${item.freeboard_title } <br>
내용 : ${item.freeboard_content } <br>

댓글 : <br>
<a href="freeboard_list"></a>

</body>
</html>
