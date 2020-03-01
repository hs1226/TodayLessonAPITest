<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->

<!--header style-->
<link rel="stylesheet" href="resources/CSS/hs_us_main_header.css">
<!--header style-->

<!-- header javascript -->
<script type="text/javascript" src="resources/JS/hs_us_main_header.js"></script>
<!-- header javascript -->

</head>
<body>
   <div>
      <div class="hs_us_mainheader_topdiv">
         <div class="hs_us_mainheader_topdiv_width">
            <span>지금 당신의 취미를 찾아보세요</span>
            <!-- 모든사람들이 다 --><span class="hs_us_mainheader_topdiv_cartloginsearchbox">
               <a href=""><i class="fa fa-shopping-cart"></i></a>
               <sec:authorize access="isAnonymous()">  
                  <a href="/customlogin" class="hs_us_mainheader_login">로그인 </a><span style="margin-left: 10px;">|</span><a href="">회원가입</a>
               </sec:authorize>
<!-- onclick="document.getElementById('hs_us_mainheader_loginmodal_div').style.display='block'" style="width:auto;" -->
               <!-- 로그인한 사람들만  -->
               <sec:authorize access="isAuthenticated()">
                  <form action="/logout" method='post'>
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="">마이페이지</a><span style="margin-left: 10px;">|</span><a href="">로그아웃</a>
                  </form>
               </sec:authorize>
               <a href=""><i class='fas fa-search'></i></a>
            </span>
         </div>
      </div>
      <!-- 로그인 modal -->
      
     <%--  <jsp:include page="hs_us_main_sec_login.jsp"/> --%>
      
      <!-- 로그인 modal -->            
      <div class="hs_us_mainheader_center">
         <a href="/alluser">
            <img src="resources/IMG/User_Logo.png" alt="User_Logo" style="width: 11%;">
         </a>
         <span class="hs_us_mainheader_center_senior">
            <a href="">
               <button>시니어지원 🌴</button>
            </a>
         </span>
      </div>
      <div class="hs_us_mainheader_line"></div>
      <div class="hs_us_mainheader_navbox">
         <nav>
            <a href="">얼리버드</a>
            <a href="">전체레슨</a>
            <a href="">자유게시판</a>
            <a href="">스토어</a>
            <a href="">이벤트</a>
         </nav>
      </div>
      <div class="hs_us_mainheader_line"></div>
   </div>
</body>
</html>