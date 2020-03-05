package com.todaylesson.service;


import java.util.List;

import com.todaylesson.DTO.MemberDTO;

public interface Hm_Us_MyManageService {


	

	public List<MemberDTO> adminmemberlist();

	public MemberDTO MyInfolist(String member_id);

	public int MyInfoupdate(MemberDTO dto);

	

}
