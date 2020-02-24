package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class FreeBoardDTO {

	private int freeboard_no;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_writedate;
	private int freeboard_category;
	private int freeboard_readno;
	private String member_id;
}
