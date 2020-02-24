package com.todaylesson.DTO;

import lombok.NoArgsConstructor;

import lombok.AllArgsConstructor;

import lombok.Getter;

import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class AddrDTO {

	private String addr_name;
	private int addr_zipcode;
	private String addr_addr;
	private String member_id;
}
