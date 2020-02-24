package com.todaylesson.service;

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
	public UserDetails loadUserByUsername(String userid) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		MemberDTO dto=mapper.getUserById(userid);
		if(dto==null)
			 throw new UsernameNotFoundException(userid);
		
		return new CustomerUserDetails(dto);
	}

}
