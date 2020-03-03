package com.todaylesson.service;

import java.util.HashMap;
import java.util.List;

import com.todaylesson.DTO.MemberDTO;

public interface Hm_Us_MyManageService {


	public int checkpwd(HashMap<String, Object> map);

	public List<MemberDTO> adminmemberlist();

}
