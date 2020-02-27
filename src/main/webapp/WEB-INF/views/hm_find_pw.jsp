<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

<script>


</script>
</head>
<body>

<form id="searchP" method="post" action="findPassword">
<ul>
<li>
<label for="inputId">아이디</label>
<input type="text"  class="form-control" id="inputId_2" name="inputId_2" placeholder="ex) godmisu">
</li>
<li>
<label>이메일</label>
<input type="text"  class="form-control" id="inputEmail_2" name="inputEmail_2" placeholder="ex) E-mail@gmail.com">
</li>
<li>
<input type="submit" id="searchBtn2" class="btn btn-primary btn-block" value="확인">
<a class="btn btn-danger btn-block"	href="${pageContext.request.contextPath}">취소</a>
</li>
</ul>
<!-- 시큐리티 토큰 -->
    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />
</form>
</body>
</html>