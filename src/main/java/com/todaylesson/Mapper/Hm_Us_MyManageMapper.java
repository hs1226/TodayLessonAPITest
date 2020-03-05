package com.todaylesson.Mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface Hm_Us_MyManageMapper {


	public List<MemberDTO> memberlist();

	public MemberDTO myinfolist(String member_id);

	
	
}
