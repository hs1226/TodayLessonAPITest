package com.todaylesson.DTO;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class LessonDTO {

	private int lesson_no;
	private String lesson_title;
	private String lesson_content;
	private int lesson_cost;
	private int lesson_member_max;
	private int lesson_category;
	//private String lesson_thumb;
	private String lesson_register_date;
	private String lesson_open_period;
	private String lesson_close_period;
	private int lesson_number;
	private int lesson_type;
	private int lesson_junior_count;
	private int lesson_result;
	private String lesson_time;
	private String lesson_addr;
	private String lesson_lat;
	private String lesson_long;
	private int lesson_readno;
	private String lesson_senior_title;
	private String lesson_senior_content;
	private int lesson_zipcode;
	
	
	
	
	public LessonDTO(String lesson_title, String lesson_content, int lesson_cost, int lesson_member_max,
			int lesson_category, String lesson_thumb, String lesson_open_period,
			String lesson_close_period, int lesson_number, int lesson_type, int lesson_junior_count, int lesson_result,int lesson_readno,
			String lesson_senior_title, String lesson_senior_content) {
		this.lesson_title = lesson_title;
		this.lesson_content = lesson_content;
		this.lesson_cost = lesson_cost;
		this.lesson_member_max = lesson_member_max;
		this.lesson_category = lesson_category;
		//this.lesson_thumb = lesson_thumb;
		this.lesson_open_period = lesson_open_period;
		this.lesson_close_period = lesson_close_period;
		this.lesson_number = lesson_number;
		this.lesson_type = lesson_type;
		this.lesson_junior_count = lesson_junior_count;
		this.lesson_result = lesson_result;
		this.lesson_readno = lesson_readno;
		this.lesson_senior_title = lesson_senior_title;
		this.lesson_senior_content = lesson_senior_content;
	}
	
	
}
