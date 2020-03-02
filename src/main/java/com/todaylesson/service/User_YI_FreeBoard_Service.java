package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

public interface User_YI_FreeBoard_Service {

	public List<SQLjoin_Member_FreeBoardDTO> freeboard_list();

}
