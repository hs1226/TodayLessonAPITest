package com.todaylesson.apitest;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
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
			,@RequestParam("member_pwd") String member_pwd
			,Model model)
	{
		

	    String encoded_pwd=encoder.encode(member_pwd);
	    boolean result=encoder.matches(member_pwd , encoded_pwd);
	    
		
		System.out.println(member_pwd);
		System.out.println(result);
		
		if(result==true)
		{
			MemberDTO dto = hm_mymanageservice.MyInfolist(member_id);
			model.addAttribute("dto",dto);
			return "hm_us_mymanagedetail";
		}
		else {
			
			return "hm_us_mymanage";
		}
	}
	
	//내정보 수정
	@RequestMapping("/hm_us_mymanageupdate")
	public String hmusmymanageupdate(@RequestParam("member_id") String member_id
									,@RequestParam("member_pwd") String member_pwd
									,@RequestParam("member_name") String member_name
									,@RequestParam("member_birth") String member_birth
									,@RequestParam("member_email") String member_email
									,@RequestParam("member_phone") String member_phone
									,@RequestParam("member_zipcode") int member_zipcode
									,@RequestParam("addrselect") int addrselect
									,@RequestParam("roadaddr") String roadaddr
									,@RequestParam("jibunaddr") String jibunaddr
									,@RequestParam("detailaddr") String detailaddr
									,@RequestParam("member_nick") String member_nick
									,MemberDTO dto, Model model)
	{
		
		dto.setMember_id(member_id);
		dto.setMember_pwd(member_pwd);
		dto.setMember_name(member_name);
		dto.setMember_birth(member_birth);
		dto.setMember_email(member_email);
		dto.setMember_phone(member_phone);
		dto.setMember_zipcode(member_zipcode);
		dto.setMember_nick(member_nick);
		
		String fulladdr= "";	
		if(addrselect==0)
		{fulladdr=roadaddr;}
		else
		{fulladdr=jibunaddr;}
		
		dto.setMember_addr(fulladdr+" "+detailaddr);
		
		int result = hm_mymanageservice.MyInfoupdate(dto);
		model.addAttribute("result",result);

		return "hm_us_mymanageupdateresult";
	}
	
	//관리자 - 회원관리(전체 리스트)
	@RequestMapping("/admin_manage")
	public String adminmembermanage(Model model)
	{
		
		List<MemberDTO> list =hm_mymanageservice.adminmemberlist();
		model.addAttribute("list",list);
		return "hm_ad_user_memmanage";
		
	}
	
	
	
	
	
	
	
}
