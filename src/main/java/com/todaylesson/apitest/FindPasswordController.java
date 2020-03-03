package com.todaylesson.apitest;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.service.Hm_Us_MyManageService;
import com.todaylesson.service.MailSendService;

@Controller
public class FindPasswordController {
	
	@Autowired
	   private MailSendService mailSender;
	
	@Resource(name="passwordEncoder")
	private BCryptPasswordEncoder encoder;
	
	
	@RequestMapping("/findPw")
	public String findPw()
	{
		
		return "hm_find_pw";
	}
	@Resource(name="hm_us_mymanage")
	private Hm_Us_MyManageService hm_mymanageservice;
	
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
	
	//내 정보관리
	@RequestMapping("/hm_us_mymanage")
	public String hm_us_mymanage1()
	{
		
		return "hm_us_mymanage";
	}

	//현재 세션 사용자의 객체가져오기
	/*Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	User user = (User) authentication.getPrincipal();

	*/


	@RequestMapping("/hm_us_mymanage2")
	public String currentUserName(@RequestParam("member_id") String member_id
								,@RequestParam("member_pwd") String member_pwd)
	{
		
		HashMap<String, Object> map = new HashMap<>();
		member_pwd = encoder.encode(member_pwd);//암호화
	
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		MemberDTO dto = hm_mymanageservice.checkpwd(map);

		System.out.println(member_id);
		System.out.println(dto.toString());
		
		return "hm_us_mymanagedetail";
	
		
		/*	if() 
		{
			return "hm_us_mymanagedetail";
		}
		else {
			return "hm_us_mymanagedetail2";
		}*/

		
		/*//현재 세션 사용자의 객체가져오기
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		User user = (User) authentication.getPrincipal();
		String member_id = user.getUsername();
		System.out.println(member_id);
		
		return "hm_us_mymanagedetail";*/
		
		/*
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication(); 
		User member_id = (User) authentication.getPrincipal();
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
		boolean result = hm_mymanageservice.checkpwd(map);
		
		System.out.println(member_id);
		System.out.println(result);
		if(result == true) 
		{
			return "hm_us_mymanagedetail";
		}
		else {
			return "hm_us_mymanagedetail2";
		}*/

	}
	
	//내정보관리 로그인된 아이디값을 시큐리티에서 가져와서 패스워드 인증함
	/*@RequestMapping("/hm_us_mymanage2") 
	@ResponseBody 
	public String currentUserName(Principal principal
								,@RequestParam("member_pwd")String member_pwd) 
	{
		String member_id = principal.getName();
	
		HashMap<String, Object> map = new HashMap<>();
		
		map.put("member_id", member_id);
		map.put("member_pwd", member_pwd);
	
		boolean result = hm_mymanageservice.checkpwd(map);	 
		 
  //result값 처리하고 return
		System.out.println(result);
		
		if(result == true) 
		{
			return "hm_us_mymanagedetail";
		}
		else {
			return "hm_us_mymanagedetail2";
		}
	}*/

	
	
	
	//관리자 - 회원관리(전체 리스트)
	@RequestMapping("/admin_manage")
	public String adminmembermanage(Model model)
	{
		
		List<MemberDTO> list =hm_mymanageservice.adminmemberlist();
		model.addAttribute("list",list);
		return "hm_ad_user_memmanage";
		
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
