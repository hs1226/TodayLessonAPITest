package com.todaylesson.apitest;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.service.JY_US_LessonService;


@Controller
public class JY_US_LessonController {

	
	@Resource(name="lessonservice")
	private JY_US_LessonService lessonservice;

	
	
	@RequestMapping("/lesson_list")
	public String list(Model model){
		List<LessonDTO> list = lessonservice.list();
		model.addAttribute("list",list);
		return "jy_lesson_list";
	}
	
	
	
	@RequestMapping("/lesson_write")
	public String write() {
		return "jy_lesson_write";
	}
	
	@RequestMapping("/jusoPopup")
	public String jusoPopup() {
		return "jy_jusoPopup";
	}	
	
	
	
	
	@RequestMapping("/jy_insertresult")
	public String insertresult(LessonDTO dto, Model model) {
		
	
		System.out.println("                     " +dto.toString());
		
		int result =lessonservice.insertLesson(dto);
		
		model.addAttribute("result",result);
		
		return "jy_insertresult";
	}
	
	
	/*
	@RequestMapping("/jy_insertresult")
	public String insertresult(@RequestParam String lesson_title,
			@RequestParam String lesson_content, @RequestParam int lesson_member_max,
			@RequestParam int lesson_category, @RequestParam int lesson_cost,
			@RequestParam String lesson_open_period, @RequestParam String lesson_close_period,
			@RequestParam int lesson_type, @RequestParam(required=false) String lesson_time,
			@RequestParam(required=false) int lesson_zipno, @RequestParam(required=false) String lesson_addr, 
			@RequestParam(required=false) String lesson_lat,@RequestParam(required=false) String lesson_long,
			@RequestParam int lesson_number, @RequestParam String lesson_senior_title, @RequestParam String lesson_senior_content, Model model) {
		
		LessonDTO dto = new LessonDTO();
		dto.setLesson_title(lesson_title);
		dto.setLesson_content(lesson_content);
		dto.setLesson_member_max(lesson_member_max);
		dto.setLesson_category(lesson_category);
		dto.setLesson_cost(lesson_cost);
		dto.setLesson_open_period(lesson_open_period);
		dto.setLesson_close_period(lesson_close_period);
		dto.setLesson_type(lesson_type);
		dto.setLesson_time(lesson_time);
		dto.setLesson_zipcode(lesson_zipno);
		dto.setLesson_addr(lesson_addr);
		dto.setLesson_lat(lesson_lat);
		dto.setLesson_long(lesson_long);
		dto.setLesson_number(lesson_number);
		dto.setLesson_senior_title(lesson_senior_title);
		dto.setLesson_senior_content(lesson_senior_content);
		
		System.out.println("                     " +dto.toString());
		
	
		int result =lessonservice.insertLesson(dto);
		
		model.addAttribute("result",result);
		
		return "jy_insertresult";
	}
	
	*/
	
	
	
	
	
}
