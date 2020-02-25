package com.todaylesson.service;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.MemberMapper;
import com.todaylesson.DTO.CustomerUserDetails;
import com.todaylesson.DTO.MemberDTO;

@Service(value="customerService")
public class CustomUserDetailService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String member_id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		MemberDTO dto=mapper.getUserById(member_id);
		if(dto==null)
			 throw new UsernameNotFoundException(member_id);
		
		return new CustomerUserDetails(dto);
	}

}
