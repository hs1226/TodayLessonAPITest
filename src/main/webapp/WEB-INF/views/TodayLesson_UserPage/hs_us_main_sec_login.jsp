<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <h1>Custom Login Page</h1>
  <h2><c:out value="${error}"/></h2>
  <h2><c:out value="${logout}"/></h2>

  <form method='post' action="/login">

  <div>
    <input type='text' name='username' placeholder="아이디 입력하시오">
  </div>
  <div>
    <input type='password' name='password' placeholder="비밀번호를 입력하시오">
  </div>

  <div>
    <input type='checkbox' name='remember-me'> Remember Me
  </div>

  <div>
    <input type='submit'>
  </div>
    <input type="hidden" name="${_csrf.parameterName}"
    value="${_csrf.token}" />

  </form>


<%--    <div>
      <form method="post" action="/todaylesson">
         <div class="hs_us_mainheader_loginmodalform_div">
            <b>오늘의 레슨에 오신것을 환영합니다!</b>
            <br>
            <span>오늘의 레슨은 서로간의 재능을 연결해 모두의 경쟁력을 높이는 플랫폼 서비스입니다.</span>           
            <div>
               <span><c:out value="${error}"/></span>
               <span><c:out value="${logout}"/></span>
               <label>ID</label>
               <input type='text' name='member_id' placeholder="아이디 입력하시오" required="required">
               <br>
               <label>PW</label>
               <input type='password' name='member_pwd' placeholder="비밀번호를 입력하시오" required="required">
               <br>
               <label>
               <input type='checkbox' name='remember-me'> Remember me
               </label>
               <br>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
               <input type="submit" value="로그인">
               <br>    
            </div>
            <!-- 로그인 line  -->
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
         
      </form>
   </div> --%>

</body>
</html>