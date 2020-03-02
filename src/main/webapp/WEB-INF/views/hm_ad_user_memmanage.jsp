<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<table>
<thead><tr><th>no</th><th>Id</th><th>이름</th>
<th>닉네임</th><th>적립금</th><th>등급</th><th>가입일</th></tr></thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr><td>${item.member_no}</td>
<td>${item.member_id}</td>
<td>${item.member_name}</td>
<td>${item.member_nick}</td>
<td>${item.member_point}</td>
<td>${item.member_level}</td>
<td>${item.member_join_date}</td></tr>
</c:forEach>
</tbody>
</table>


</body>
</html>