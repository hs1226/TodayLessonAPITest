package com.todaylesson.apitest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Speetch_TestController {

	@RequestMapping("test")
	public String boardWrite() {
		  return "speechtest";
		}
	
}
