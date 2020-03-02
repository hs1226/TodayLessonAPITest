package com.todaylesson.apitest;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.User_YI_FreeBoard_Service;

@Controller
public class User_YI_FreeBoard_Controller {

	@Resource(name="user_YI_FreeBoard_Service")
	private User_YI_FreeBoard_Service service;
	
	@RequestMapping("/freeboard")
	public String list(Model model)
	{
		List<SQLjoin_Member_FreeBoardDTO> list=service.freeboard_list();
		model.addAttribute("list",list);
		return "yi_freeboard";
	}
	
}
