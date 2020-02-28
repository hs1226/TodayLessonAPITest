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

<script type="text/javascript" src="resources/JS/hs_us_main_header.js"></script>


</head>
<body>
   <div>
      <div class="hs_us_mainheader_topdiv">
         <div class="hs_us_mainheader_topdiv_width">
            <span>지금 당신의 취미를 찾아보세요</span>
            <span class="hs_us_mainheader_topdiv_cartloginsearchbox">
               <a href=""><i class="fa fa-shopping-cart"></i></a>
               <sec:authorize access="isAnonymous()">  <!-- 모든사람들이 다 -->
                  <a href="/customlogin" onclick="document.getElementById('hs_us_mainheader_loginmodal_div').style.display='block'" style="width:auto;" class="hs_us_mainheader_login">로그인 </a><span style="margin-left: 10px;">|</span><a href="">회원가입</a>
               </sec:authorize>

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
                  <div id="hs_us_mainheader_loginmodal_div" class="hs_us_mainheader_loginmodal">
                     <form method="post" action="/todaylesson">
                        <div class="hs_us_mainheader_loginmodalform_div">
                           <b>오늘의 레슨에 오신것을 환영합니다!</b>
                           <br>
                           <span>오늘의 레슨은 서로간의 재능을 연결해 모두의 경쟁력을 높이는 플랫폼 서비스입니다.</span>
                           <!-- 창닫는 X Button -->
                           <span onclick="document.getElementById('hs_us_mainheader_loginmodal_div').style.display='none'" class="hs_us_mainheader_loginmodal_close" title="Close Login">&times;</span>
                        <div class="hs_us_mainheader_loginform">
                           <label>ID</label>
                           <input type='text' name='username' placeholder="아이디 입력하시오" required="required">
                           <br>
                           <label>PW</label>
                           <input type='password' name='password' placeholder="비밀번호를 입력하시오" required="required">
                           <br>
                           <label>
                           <input type='checkbox' name='remember-me'> Remember me
                           </label>
                           <br>
                           <input type="submit" value="로그인">
                           <br>
                           <span><c:out value="${error}"/></span>
                           <span><c:out value="${logout}"/></span>
                        </div>
           
                        <div class=""></div>
           
                        <div>
                           <a>카카오</a>
                           <a>네이버</a>
                           <a>구글</a>
                           <a>페이스북</a>
                        </div>
           
                        <div class="hs_us_mainheader_findidpw">
                           <a href="">아이디찾기</a><span>|</span><a href="">비밀번호찾기</a>
                        </div>
           
                        <div class="hs_us_mainheader_join">
                           <span>
                              <span>아직도 오늘의 레슨 회원이 아니신가요?</span><a href="">회원가입</a>
                           </span> 
                        </div>
   
                        </div> 
                        <!-- security_form에 넣어줘야하는거(안넣어주면 에러 남) -->
                        <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
          
                     </form>
                  </div> 
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