package com.todaylesson.csrf;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.web.util.matcher.RequestMatcher;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/**

 * IfpCsrfRequestMatcher.java

 * - 요청에 대해 스프링 시큐리티에서 CSRF를 적용할건지 아닐건지 판단

 * 

 * ################ Spring Security CSRF Protection 설정 ##################

 * [CsrfTokenAdder.java, 서블릿필터] ###"응답에 태그 삽입"###

 * - Spring Security4 이상은 CSRF Enabled가 기본설정

 * - HttpServletRequest(일반  JSP요청), XMLHttpRequest(AJAX) 요청이든 응답에 Csrf 히든테그 삽입

 * - CSRF Protection을 위한 Text/Html 응답에 히든태그 Xsrf Token 삽입

 * - AJAX JSON응답(콤보 채우기등)은 히든태그 Csrf Token 삽입할 필요없다.

 * 

 * [security-config.xaml]

 * - 애당초 Spring Security 적용이 필요없는 부분에 대한 정의(/resources, /images 등)

 * - RequestMatcher에 대한 정의(스프링 시큐리티에서 요청에 대해 CSRF를 적용할건지 아닐건지 판단)

 * - AccessDeniedHandler에 대한 정의(403 에러발생시 대응)

 * 

 * [IfpCsrfRequestMatcher.java] ###"요청에 따라 CSRF 적용여부 결정"###

 * - 스프링 시큐리티에서 CSRF를 적용할건지 아닐건지 판단

 * - AJAX CALL, 첫화면, 최측메뉴로딩, 팝업로등 요청은 CSRF 적용하지 않음

 * - (TEXT/HTML을 응답으로 보낸는 부분은 CsrfTokenAdder 필터에서 Csrf 히든태그 삽입함)

 * - 403 Forbidden 에러가 발생하는 부분이 있다면 이곳에서 추가할 것

 * 

 * [IfpAccessDeniedHandler.java]

 * - 403 Forbidden 에러 발생하는 경우 처리하는 핸들러

 * ######################################################################


 */


public class IfpCsrfRequestMatcher implements RequestMatcher {
	

  final Log logger = LogFactory.getLog( IfpAccessDeniedHandler.class );

	

    @Override

    public boolean matches(HttpServletRequest request) {

    	

    	String strUrl = request.getRequestURL().toString();

    	String strUri = request.getRequestURI();

    	String queryString = request.getQueryString() == null ? "" : request.getQueryString();

    	String contentType = request.getContentType() == null ? "" : request.getContentType();

 

    	//---------------------------------------------------------

    	// CSRF 필터링, 필요시 추가 하세요. 여기에 추가안하시면 403 오류 발생!

    	//---------------------------------------------------------

    	// AJAX CALL

        if ("XMLHttpRequest".equals(request.getHeader("X-Requested-With")))        	                                           

        	                                           return false;
  //화수
     // 첫화면
        else if ("/".equals(strUri))                   return false;        
     // 첫화면
        else if ("/todaylesson".equals(strUri))                   return false;
     //관리자화면
        else if ("/todaylessonadmin".equals(strUri))                   return false;  
     //시니어화면
        else if ("/todaylessonsenior".equals(strUri))                   return false;   
     //로그인
        else if ("/customlogin".equals(strUri))                   return false;
     //로그아웃
        else if ("/logout".equals(strUri))                   return false;
        
      

        
        
  //용인
      //TodayLessonController
      //회원가입
        else if ("/join".equals(strUri))                   return false;
      //아이디찾기
        else if ("/findId".equals(strUri))                   return false;
      //회원가입결과
        /*else if ("/joinresult".equals(strUri))                   return false;*/
      //id찾기
        else if ("/userSearch".equals(strUri))                   return false;
      //User_YI_FreeBoard_Controller
      //자유게시판
        else if ("/freeboard".equals(strUri))                   return false;
      //게시글상세보기
        else if ("/detail/{freeboard_no}".equals(strUri))                   return false;   
        
        
        
   //혜미
      //혜미비번찾기 
        else if ("/findPw".equals(strUri))                   
        	 return false; 
      //혜미 이메일 & 아이디 값 받아서 임시 비밀번호 전송
        else if("/findPassword".equals(strUri))
             return false;
     //혜미 내 정보관리 페이지로 가기
        else if("/hm_us_mymanage".equals(strUri))
             return false;
     //혜미 내 정보 관리 1차 비밀번호 인증받기
        else if("/hm_us_mymanage2".equals(strUri))
             return false; 
     //   
        
        
   //은지
        
        
        
        
   //진영
      //진영글쓰기
        else if ("/lesson_write".equals(strUri))                   
        	 return false;  
      //진영주소팝업
        else if ("/jusoPopup".equals(strUri))    
        	 return false;   
        
        
        
        

        else {

        	logger.info("###################################### request.getRequestURL() :: " + strUrl);

        	logger.info("###################################### request.getRequestURI() :: " + strUri);

        	logger.info("###################################### request.getQueryString() :: " + queryString);

        	logger.info("###################################### request.getContentType() :: " + contentType);        	

        }

        return true;

    }
}
