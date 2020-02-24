package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class PdReviewDTO {

	private int pdreview_no;
	private int orderlist_no;
	private String pdreview_filepath;
	private String pdreview_content;
	private String pdreview_date;
	
}
