package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class LReviewDTO {

	private int lreview_no;
	private int orderlist_no;
	private String lreview_content;
	private String lreview_date;
	private String lreview_filepath;
}
