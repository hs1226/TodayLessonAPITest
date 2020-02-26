package com.todaylesson.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.MemberDTO;

@Mapper
public interface MemberMapper {
   public int insertMember(MemberDTO dto);
   public int insertMemberSub(MemberDTO dto);
   public MemberDTO getUserById(String member_id);
public int idCheck(String member_id);	
	
}