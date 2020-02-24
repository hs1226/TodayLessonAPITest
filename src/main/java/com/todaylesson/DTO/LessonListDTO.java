package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class LessonListDTO {

	private int lessonlist_no;
	private int lessondetail_no;
	private String lessonlist_date;
	private int lessonlist_status;
}
