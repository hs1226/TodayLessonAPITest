package com.todaylesson.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.todaylesson.Mapper.MemberMapper;
import com.todaylesson.DTO.MemberDTO;

@Service(value="memberService")
public class MemberService {

	@Autowired
	private MemberMapper mapper;
	
	 @Autowired
	private BCryptPasswordEncoder encoder;
	
	
	@Transactional
	public int insert(MemberDTO dto)
	{
       String changepwd= encoder.encode(dto.getMember_pwd());
       dto.setMember_pwd(changepwd);
		mapper.insertMember(dto);
		int r=mapper.insertMemberSub(dto);
		return r;
	}
}
