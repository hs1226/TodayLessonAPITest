package com.todaylesson.service;

import java.util.HashMap;

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

	@Override
	public String get_searchId(HashMap<String, Object> map) {
		String result="";
		result=mapper.searchId(map);
		return result;
	}

	
}
