package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.FreeBoardDTO;
import com.todaylesson.DTO.SQLjoin_Member_FreeBoardDTO;

@Mapper
public interface User_YI_FreeBoard_Mapper {

public List<SQLjoin_Member_FreeBoardDTO> freeboard_list();

}
