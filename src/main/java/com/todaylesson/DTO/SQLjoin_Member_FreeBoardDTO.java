package com.todaylesson.DTO;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SQLjoin_Member_FreeBoardDTO {
	//member
	private String member_id;
	private int member_no;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_phone;
	private String member_addr;
	private int member_zipcode;
	private int member_point;
	private int member_level;
	private String member_email;
	private String member_nick;
	private String member_join_date;
	private String member_key;
	private String member_value;
	private String member_img;
	private List<Member_AuthDTO> authList;
	
	//freeboard
	private int freeboard_no;
	private String freeboard_title;
	private String freeboard_content;
	private String freeboard_writedate;
	private int freeboard_category;
	private int freeboard_readno;

	
	
}
