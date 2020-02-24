package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Question_1_1DTO {

	private int question_no;
	private int question_group;
	private String question_title;
	private String question_content;
	private String question_answer;
	private String member_id;
}
