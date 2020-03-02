package com.todaylesson.apitest;

import org.springframework.web.bind.annotation.RequestMapping;

public class JY_US_LessonController {

	@RequestMapping("lesson_write")
	public String write() {
		return "jy_lessonwrite";
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup() {
		return "jy_jusoPopup";
	}
	
}
