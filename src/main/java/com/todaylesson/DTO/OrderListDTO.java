package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class OrderListDTO {

	private int orderlist_no;
	private int product_no;
	private int lesson_no;
	private int cart_no;
	private String orderlist_date;
	private int orderlist_status;
	private int orderlist_cost;
	private String member_id;
}
