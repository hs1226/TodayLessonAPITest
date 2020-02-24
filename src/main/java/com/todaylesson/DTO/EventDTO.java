package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EventDTO {

	private int event_no;
	private int event_group;
	private String event_title;
	private String event_content;
	private String event_startperiod;
	private String event_endperiod;
	private String event_thumbnail;
}
