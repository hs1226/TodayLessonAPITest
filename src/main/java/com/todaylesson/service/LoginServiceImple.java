package com.todaylesson.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.MemberMapper;

@Service(value="loginService")
public class LoginServiceImple implements LoginService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int idCheck(String member_id) {
		
		
		
		return mapper.idCheck(member_id);
	}

}
