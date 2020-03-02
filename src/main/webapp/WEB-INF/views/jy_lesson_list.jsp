<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.thum{
width:500px; height:auto;
}

</style>

</head>
<body>

<table class="table">

<thead>
<tr>
<th scope="col">번호</th><th scope="col">주소</th><th scope="col">위도</th><th scope="col">경도</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td><c:out value="${item.lesson_no}"/></td>
<td><img alt="썸네일" src="${item.lesson_thumb}" class="thum"/></td>
<td><a href="detail/${item.lesson_title}"><c:out value="${item.lesson_title}"/></a></td>
<td><c:out value="${item.lesson_type}"/></td>
<td><c:out value="${item.lesson_senior_title}"/></td>
</tr>
</c:forEach>
</tbody>
</table>

<a href="${pageContext.request.contextPath }/jy_lesson_write">글쓰기</a>

</body>
</body>
</html>