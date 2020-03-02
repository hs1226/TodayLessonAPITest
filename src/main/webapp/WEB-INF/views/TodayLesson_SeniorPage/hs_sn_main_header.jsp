<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>      
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!--header style-->
<link rel="stylesheet" href="resources/CSS/hs_sn_main_header.css">
<!--header style-->

</head>
<body>
   <div class="hs_sn_mainheader_width">
      <div class="hs_sn_mainheader_box">
         <sec:authorize access="isAuthenticated()">
            <form action="/logout" method='post'>
               <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
               <span class="hs_sn_mainheader_namelogout">
                  <a href="">올에오님(닉네임)</a><span style="margin-left: 10px; color: white;">|</span><a href="/logout">로그아웃</a>
               </span>
            </form>
         </sec:authorize>
         <div class="hs_sn_mainheader_logo_adminmode">
            <a href="">
               <b>시니어모드</b>
            </a>
            <a href="">
               <img src="resources/IMG/SN_AD_Logo.png" alt="SN_AD_Logo" style="width: 15%;">
            </a>
            
        </div>
      </div>
   </div>
</body>
</html>