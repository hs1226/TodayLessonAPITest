package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class SeniorDTO {

	private int senior_no;
	private int lesson_no;
	private String senior_account;
	private String senior_email;
	private String senior_phone;
	private String senior_cmo;
	private String senior_nick;
	private String member_id;
}
