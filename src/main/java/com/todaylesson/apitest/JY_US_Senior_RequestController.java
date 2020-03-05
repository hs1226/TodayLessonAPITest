package com.todaylesson.apitest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class JY_US_Senior_RequestController {

	
	@RequestMapping("senior_request")
	public String Senior_Request_PopUp() {
		return "jy_senior_request";
	}
	

	@RequestMapping("senior_request_form/{member_id}")
	public String Senior_Request_Button() {
		return "jy_senior_form";
	}
	
	@RequestMapping("senior_switch")
	public String Senior_Form() {
		return "jy_senior_switch";
	}
	
}
