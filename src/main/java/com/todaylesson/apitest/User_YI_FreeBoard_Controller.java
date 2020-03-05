package com.todaylesson.apitest;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;
import com.todaylesson.service.User_YI_FreeBoard_Service;

@Controller
public class User_YI_FreeBoard_Controller {

	@Resource(name="user_YI_FreeBoard_Service")
	private User_YI_FreeBoard_Service service;
	
	@RequestMapping(value="/freeboard", method=RequestMethod.GET)
	public String list(Model model)
	{
		List<SQLjoin_Member_FreeBoardDTO> list=service.freeboard_list();
		model.addAttribute("list",list);
		return "yi_freeboard";
	}
	
	@RequestMapping("/detail/{freeboard_no}")
	public String detail(@PathVariable int freeboard_no,Model model)
	{
		SQLjoin_Member_FreeBoardDTO dto= service.freeboard_detail(freeboard_no);
		model.addAttribute("dto",dto);
		return "yi_freeboard_detail";
	}
}
