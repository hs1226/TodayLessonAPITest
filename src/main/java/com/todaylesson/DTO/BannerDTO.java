package com.todaylesson.DTO;

import lombok.NoArgsConstructor;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class BannerDTO {

	private int banner_no;
	private String banner_title;
	private String banner_filepath;
}
