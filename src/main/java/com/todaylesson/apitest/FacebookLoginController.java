package com.todaylesson.apitest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FacebookLoginController {
	
	@RequestMapping("facebooklogin")
	public String facebooklogin()
	{
		return "ej_facebooklogin";
	}

}
