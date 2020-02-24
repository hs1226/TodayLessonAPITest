package com.todaylesson.DTO;

import lombok.AllArgsConstructor;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class MyListDTO {

	private int mylike_no;
	private int product_no;
	private int lesson_no;
	private String member_id;
}
