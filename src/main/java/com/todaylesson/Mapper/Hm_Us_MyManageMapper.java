package com.todaylesson.Mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Hm_Us_MyManageMapper {

	public boolean checkpwd(HashMap<String, Object> map);

	public List<MemberDTO> memberlist();

	
	
}
