package com.todaylesson.apitest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PayTestController {

	@RequestMapping("paytest")
	public String paytest() {
		  return "paytest";
		}
}
