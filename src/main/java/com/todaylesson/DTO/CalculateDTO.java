package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class CalculateDTO {

	private int calculate_no;
	private int sales_no;
	private String calculate_date;
	private int calculate_comp;
}
