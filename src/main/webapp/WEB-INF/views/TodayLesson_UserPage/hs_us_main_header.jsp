<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!--header style-->
<link rel="stylesheet" href="resources/CSS/hs_us_main_header.css">
<!--header style-->

<!-- header javascript 
<script type="text/javascript" src="resources/JS/hs_us_main_header.js"></script>
header javascript -->

 
 <!-- BOOTSTRAP DEPENDENCIES 
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap-theme.min.css">
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
 BOOTSTRAP DEPENDENCIES END-->



</head>
<body>
   <div>
      <div class="hs_us_mainheader_topdiv">
         <div class="hs_us_mainheader_topdiv_width">
            <span>지금 당신의 취미를 찾아보세요</span>
            <!-- 모든사람들이 다 --><span class="hs_us_mainheader_topdiv_cartloginsearchbox">
               <a href=""><i class="fa fa-shopping-cart"></i></a>
               <sec:authorize access="isAnonymous()">  
                  <a href="/customlogin" class="hs_us_mainheader_login" onclick="openModal();">로그인 </a><span style="margin-left: 10px;">|</span><a href="">회원가입</a>
               </sec:authorize>
               <!-- 로그인한 사람들만  -->
               <sec:authorize access="isAuthenticated()">
                 <!--  <form action="/logout" method='post'> -->
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="">마이페이지</a><span style="margin-left: 10px;">|</span><a href="/logout">로그아웃</a>
                 <!--  </form> -->
               </sec:authorize>
               <a href=""><i class='fas fa-search'></i></a>
            </span>
         </div>
      </div>
        <!-- 로그인 modal -->
                  <%--
                   onclick="openModal();" -> 로그인 a태그     숨기는건 했는테 모달로 뜨지 않음... 이건 그냥 나중에 다시...  
                  
                  <jsp:include page="hs_us_main_sec_logintest.jsp"/>  
                                 
                  --%>
                   
      
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