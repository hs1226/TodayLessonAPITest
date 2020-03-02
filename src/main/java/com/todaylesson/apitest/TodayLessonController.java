package com.todaylesson.apitest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.DTO.Member_AuthDTO;
import com.todaylesson.service.LoginService;
import com.todaylesson.service.MailSendService;
import com.todaylesson.service.MemberService;

@Controller
public class TodayLessonController {

   @Resource(name="loginService")
   private LoginService loginService;
   
	@Resource(name="memberService")
	private MemberService memberService;
   
   @Autowired
   private MailSendService mailSender;
   
   
    @RequestMapping("/todaylessonadmin")
      public String admin()
      {
         //return "/todaylesson_sec/todaylesson_sec_admin";
          return "TodayLesson_AdminPage/hs_ad_main";
      }
    
    @RequestMapping("/todaylessonsenior")
    public String senior() {
       return "/todaylesson_sec/todaylesson_sec_senior"; 
    }
       
    @RequestMapping("/todaylessonmember")
    public String member()
    {
       return "/todaylesson_sec/todaylesson_sec_member";
    }
       
       @RequestMapping("/todaylesson")
       public String all()
       {
          //return "/todaylesson_sec/todaylesson_sec_all";
          return "/TodayLesson_UserPage/hs_us_main";
       }
          
       @RequestMapping("/error")
       public String error()
       {
           return "/todaylesson_sec__error";
       }
              
       @RequestMapping("/customlogin")
       public String login(String error, String logout, Model model)
       { 
    	   
    	  if (error !=null)
             model.addAttribute("error", "Please check your ID or Password");
             
          if(logout !=null)
             model.addAttribute("logout","logout");
          
          
          return "/TodayLesson_UserPage/hs_us_main_sec_login";
       }
       
       /*  모달창 실험했던거... 나중에 다시 하기*/
       /*@RequestMapping("/customlogin")
       @ResponseBody
       public String login(String error, String logout,
    		             HttpServletRequest request, Model model)
       { 
    	   
    	  if (error !=null)
             model.addAttribute("error", "Please check your ID or Password");
             
          if(logout !=null)
             model.addAttribute("logout","logout");
          
          
          //return "/TodayLesson_UserPage/hs_us_main_sec_login";
          return "/TodayLesson_UserPage/hs_us_main_sec_logintest";
       }*/
       
       @RequestMapping("/logout")
       public String logout() {
    	   return "redirect:/customlogin";
       }
    		   
    		   
       @RequestMapping("/join")
       public String join(HttpServletRequest request, Model model) throws Exception {	   
    	   
    	   /*은지 sms인증*/
              String api_key = "NCSRC0XSPD85BDRL"; //위에서 받은 api key를 추가
              String api_secret = "2LVQYEMQFBIBEG8WVXKQOWQ6KPDDVJQ9";  //위에서 받은 api secret를 추가

              com.todaylesson.Sms.Coolsms coolsms = new com.todaylesson.Sms.Coolsms(api_key, api_secret);
              //이 부분은 홈페이지에서 받은 자바파일을 추가한다음 그 클래스를 import해야 쓸 수 있는 클래스이다.
              

              HashMap<String, String> set = new HashMap<String, String>();
              set.put("from", "01026063254"); // 수신번호

              set.put("to", (String)request.getParameter("to")); // 발신번호, jsp에서 전송한 발신번호를 받아 map에 저장한다.
              set.put("text", (String)request.getParameter("text")); // 문자내용, jsp에서 전송한 문자내용을 받아 map에 저장한다.
              set.put("type", "sms"); // 문자 타입
              String text=(String)request.getParameter("text");
              model.addAttribute("to",(String)request.getParameter("to"));
              model.addAttribute("auth_num",text);
             
              System.out.println(set);

              JSONObject result = coolsms.send(set); // 보내기&전송결과받기

              if ((boolean)result.get("status") == true) {

                // 메시지 보내기 성공 및 전송결과 출력
                System.out.println("성공");
                System.out.println(result.get("group_id")); // 그룹아이디
                System.out.println(result.get("result_code")); // 결과코드
                System.out.println(result.get("result_message")); // 결과 메시지
                System.out.println(result.get("success_count")); // 메시지아이디
                System.out.println(result.get("에러메세지수: error_count")); // 여러개 보낼시 오류난 메시지 수
              } else {

                // 메시지 보내기 실패
                System.out.println("실패");
                System.out.println(result.get("code")); // REST API 에러코드
                System.out.println(result.get("message")); // 에러메시지
              }
           return "/todaylesson_joinform";
       }
       
       @RequestMapping("/joinresult")
		 public String joinresult(@RequestParam("id") String member_id
				 				, @RequestParam("pwd") String member_pwd
				 				, @RequestParam("name") String member_name
				 				, @RequestParam("birth") String member_birth
				 				, @RequestParam("email") String member_email
				 				, @RequestParam("phone") String member_phone
				 				, @RequestParam("zipcode") int member_zipcode
				 				, @RequestParam("nick") String member_nick
				
	 				, @RequestParam("addrselect") int addrselect
	 				,@RequestParam("roadaddr") String roadaddr
	 				,@RequestParam("jibunaddr") String jibunaddr
	 				, @RequestParam("detailaddr") String detailaddr
				 				,  MemberDTO dto,Model model)
		 {

			 
			 dto.setMember_id(member_id);
			 dto.setMember_pwd(member_pwd);
			 dto.setMember_name(member_name);
			 dto.setMember_birth(member_birth);
			 dto.setMember_email(member_email);
			 dto.setMember_phone(member_phone);
			 dto.setMember_zipcode(member_zipcode);
			 dto.setMember_nick(member_nick);
			 
			//전체주소(도로or지번주소 + 상세주소) addr에 셋팅
			 String fulladdr= "";	
			 if(addrselect==0)
					{fulladdr=roadaddr;}
					else
					{fulladdr=jibunaddr;}
			 
			 
			 dto.setMember_addr(fulladdr+" "+detailaddr);
			 
			 List<Member_AuthDTO> list=new ArrayList<>();
			
			 //auth를 list에 넣어서 dto에 셋팅
			 list.add(new Member_AuthDTO("ROLE_USER",dto.getMember_id()));
			 dto.setAuthList(list);
			 
			 
			 int result=memberService.insert(dto);
			 model.addAttribute("result",result);
			 
			 return "yi_joinresult";
		 } 
       
       
       
       @RequestMapping("/findId")
       public String findId()
       {
          return "yi_find_id";
       }
       
       /*id중복 체크*/
         @ResponseBody 
          @RequestMapping(value="/idCheck", method= RequestMethod.POST)
          public int idCheck(@RequestParam("id") String member_id,Model model)
          {
              System.out.println(member_id);
              int row = loginService.idCheck(member_id);
              model.addAttribute("data",row);
              return row;
          }
       /*id 찾기*/
         @ResponseBody
         @RequestMapping(value = "/userSearch", method = RequestMethod.POST)
         public String userIdSearch(@RequestParam("inputName_1") String member_name, 
               @RequestParam("inputPhone_1") String member_phone) {
            HashMap<String,Object> map=new HashMap<>();
            System.out.println(member_name);
            System.out.println(member_phone);
            map.put("member_name", member_name);
            map.put("member_phone", member_phone);
            String result = loginService.get_searchId(map);
            
            System.out.println(result);

            return result;
         }
      
         
         
         
         /*pwd 찾기*/
         @RequestMapping(value="/searchPassword",method=RequestMethod.POST)
         @ResponseBody
         public String passwordSearch(@RequestParam("inputId_2")String member_id,
               @RequestParam("inputEmail_2") String member_email
               ,HttpServletRequest request) {
            mailSender.mailSendWithPassword(member_id,member_email,request);
            System.out.println(member_email);
            return "/userSearchPassword";
                                           
            
         }
         

       
       @RequestMapping("/ej_join")
       public String joinej()
       {
          return "/ej_joinform";
       }
       
       //jsp에 넣어줘서 필요없음
      /* @RequestMapping("/logout")
       public String logout()
       {
          return "/yi_logout";
       }*/

}
