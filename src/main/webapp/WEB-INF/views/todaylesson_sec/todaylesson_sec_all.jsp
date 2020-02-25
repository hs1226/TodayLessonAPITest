<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
로그인 상관없이 모든 사람이 볼수 있음.

<!-- 모든사람들이 다 -->
<sec:authorize access="isAnonymous()">
   <a href="/customlogin">로그인</a>
</sec:authorize>

<!-- 
      모달창으로 만들꺼라서 로그인 모달창 만들때 이거 추가하기
      <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
 -->

<!-- 로그인한 사람들만  -->
<sec:authorize access="isAuthenticated()">
   <form action="/logout" method='post'>
   <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
   <button>로그아웃</button>
   </form>
</sec:authorize>


</body>
</html>