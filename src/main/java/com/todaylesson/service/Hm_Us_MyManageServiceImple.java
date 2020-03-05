package com.todaylesson.service;


import java.util.List;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.todaylesson.DTO.MemberDTO;
import com.todaylesson.Mapper.Hm_Us_MyManageMapper;

@Service(value ="hm_us_mymanage")
public class Hm_Us_MyManageServiceImple implements Hm_Us_MyManageService {

	@Resource(name="hm_Us_MyManageMapper")
	private Hm_Us_MyManageMapper mapper;
	


	@Override
	public List<MemberDTO> adminmemberlist() {
		// TODO Auto-generated method stub
		return mapper.memberlist();
		
	}



	@Override
	public MemberDTO MyInfolist(String member_id) {
		// TODO Auto-generated method stub
		return mapper.myinfolist(member_id);
	}



	@Override
	public int MyInfoupdate(MemberDTO dto) {
		// TODO Auto-generated method stub
		return mapper.myinfoupdate(dto);
	}





}
