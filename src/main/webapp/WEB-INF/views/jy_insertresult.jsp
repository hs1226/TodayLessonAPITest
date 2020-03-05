<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

if (${result} > 0) {
	alert("추가 성공!");
	//location.href="${pageContext.request.contextPath }/lessonlist";
} else {
	

	alert("추가 실패!");
	//location.href="${pageContext.request.contextPath }/lessonlist";
	
}





</script>
</head>
<body>
</body>
</html>