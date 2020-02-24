package com.todaylesson.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {

	private int product_no;
	private String product_name;
	private int product_cost;
	private int product_stock;
	private int product_like;
	private String product_content;
	private int product_category;
	private int product_sale;
	private String product_thumb;
	private int product_option;
}
