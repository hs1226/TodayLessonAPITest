package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
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
	private String lesson_thumb;
	private String lesson_register_date;
	private String lesson_open_period;
	private String lesson_close_period;
	private int lesson_number;
	private int lesson_type;
	private int lesson_junior_count;
	private int lesson_result;
	private String lessont_time;
	private String lesson_addr;
	private String lesson_lat;
	private String lesson_long;
	private int lesson_readno;
	private String lesson_senior_title;
	private String lesson_senior_content;
	private int lesson_zipcode;
}
