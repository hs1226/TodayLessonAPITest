package com.todaylesson.csrf;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.csrf.InvalidCsrfTokenException;
import org.springframework.security.web.csrf.MissingCsrfTokenException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class IfpAccessDeniedHandler implements AccessDeniedHandler {
	 
	@Override
	    public void handle(HttpServletRequest request, HttpServletResponse response,

	            AccessDeniedException accessDeniedException) throws IOException, ServletException {

	    	

	       final Log logger = LogFactory.getLog( IfpAccessDeniedHandler.class );

	 

	       String ajaxHeader = ((HttpServletRequest) request).getHeader("X-Requested-With");

	       String url = request.getRequestURL().toString();

		   String queryString = request.getQueryString();

		   String contentType = response.getContentType();

		   

		   // response.sendRedirect(request.getContextPath() + "/common/page_error.jsp");

		   logger.info("############################[Security AccessDenied]##############################");

		   logger.info("##### [X-Requested-With ::::::::: [" + ajaxHeader + "] #####");

		   logger.info("##### [ContentType      ::::::::: [" + contentType + "] #####");

		   logger.info("##### " + url + "?" + queryString + " #####");

		   logger.info("#################################################################################");

	       	   

		   if(accessDeniedException instanceof InvalidCsrfTokenException) {

	           response.setStatus(HttpServletResponse.SC_FORBIDDEN);

	       }

	       // 서버가 재시작된 경우 csrfToken이 없어지게 되므로, 아래와 같은 Exception이 발생함

	       if(accessDeniedException instanceof MissingCsrfTokenException) {

	           response.setStatus(HttpServletResponse.SC_FORBIDDEN);

	       }

	    }
}
