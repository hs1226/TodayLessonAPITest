package com.todaylesson.apitest;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.service.MailSendService;

@Controller
public class FindPasswordController {
	
	@Autowired
	   private MailSendService mailSender;
	
	@RequestMapping("/findPw")
	public String findPw()
	{
		
		return "hm_find_pw";
	}
	
	@RequestMapping(value="/findPassword",method=RequestMethod.POST)
	@ResponseBody
	public String findPassword(@RequestParam("inputId_2")String member_id,
            @RequestParam("inputEmail_2") String member_email
            ,HttpServletRequest request){
		
		mailSender.mailSendWithPassword(member_id, member_email, request);
		System.out.println(member_email);
		
		return "/userSearchPassword";
	}
	
	@RequestMapping("/hmapitest")
	public String hmapitest()
	{
		return "hm_api_test";
	}
	
	
	@RequestMapping("/hmexceltest")
	public String hmexceltest()
	{
		return "hm_exceltest";
	}
	
	/*
	
	
	//솔이언니가 준거
	@Autowired
	   private JavaMailSenderImpl mailSender;
	   
	   @RequestMapping("/sendmail")
	   public String sendmail() {
	      final MimeMessagePreparator pp = new MimeMessagePreparator() {
			
	         
	         @Override
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "utf-8");
	            helper.setFrom("todaylesson@naver.com");
	            helper.setTo("todaylesson@naver.com");
	            helper.setSubject("안녕");
	            helper.setText("<b>은별이~~~~~~~~~~~~~~</b>"
	                  + "<br>"
	                  + "<img src="+"https://ssl.pstatic.net/tveta/libs/1260/1260649/19aabf7c9a09e0d9ed84_20200211140438611.jpg"+">", true);
	         }
	      };
	      
	      mailSender.send(pp);
	      return "sendmail";
	   }
*/

	
	
}
