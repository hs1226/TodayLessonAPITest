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
<table class="table">
<thead>
<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
</thead>
<c:forEach var="item" items="${list }">

<tbody>
<tr>
<td>${item.freeboard_category }</td>
<td>${item.freeboard_no}</td>
<td><a href="detail/${item.freeboard_no }">${item.freeboard_title }</a></td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td><c:out value=" ${item.freeboard_readno }"></c:out></td>
</tr>
</tbody>

</c:forEach>
</table>

  <sec:authorize access="isAuthenticated()">
                 <!--  <form action="/logout" method='post'> -->
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="freeboard_write">글쓰기</a><span style="margin-left: 10px;">
                 <!--  </form> -->
               </sec:authorize>

</body>
</html>
