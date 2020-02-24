package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class BoardReplyDTO {

	private int boardreply_no;
	private int freeboard_no;
	private String boardreply_content;
	private String boardreply_writedate;
	private String member_id;
}
