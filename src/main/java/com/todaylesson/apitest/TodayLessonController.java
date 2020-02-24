package com.todaylesson.apitest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TodayLessonController {

	 @RequestMapping("/admin")
		public String admin()
		{
			return "/yi_member/yi_admin";
		}
	 
	 @RequestMapping("/senior")
	 public String senior() {
		 return "/yi_member/hs_senior"; 
	 }
		 
	 @RequestMapping("/member")
	 public String member()
	 {
		 return "/yi_member/yi_member";
	 }
		 
		 @RequestMapping("/all")
		 public String all()
		 {
			 return "/yi_member/yi_all";
		 }
		

		 
		 @RequestMapping("/error")
		 public String error()
		 {
			  return "/yi_error";
		 }
		 
		 
		 @RequestMapping("/customlogin")
		 public String login(String error, String logout, Model model)
		 {
			 if (error !=null)
				 model.addAttribute("error", "Please check your ID or Password");
			 	
			 if(logout !=null)
				 model.addAttribute("logout","logout");
			 
			 
			 return "/yi_login";
		 }
		 
		 //jsp에 넣어줘서 필요없음
		/* @RequestMapping("/logout")
		 public String logout()
		 {
			 return "/yi_logout";
		 }*/
	
}
