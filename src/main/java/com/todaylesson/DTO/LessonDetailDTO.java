package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class LessonDetailDTO {

	private int lessondetail_no;
	private int lesson_no;
	private int senior_no;
	private String lessondetail_title;
	private String lessondetail_content;
	private String lessondetail_video_url;
	private int lessondetail_chapter;
	private int lessondetail_comp;
	private String member_id;
}
