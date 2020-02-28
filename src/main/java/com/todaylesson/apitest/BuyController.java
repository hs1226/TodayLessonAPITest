package com.todaylesson.apitest;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class BuyController {

	// аж╪р 

	@RequestMapping("buy")
	public String list(Model model){
		return "buy";
	}

}
