package com.todaylesson.apitest;

import org.springframework.web.bind.annotation.RequestMapping;

public class JY_US_LessonController {

	@RequestMapping("write")
	public String write() {
		return "write";
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup() {
		return "jusoPopup";
	}
	
}
