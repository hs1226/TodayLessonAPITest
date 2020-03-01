package com.todaylesson.service;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.todaylesson.Mapper.Hm_Us_MyManageMapper;

@Service(value ="hm_us_mymanage")
public class Hm_Us_MyManageServiceImple implements Hm_Us_MyManageService {

	@Resource(name="hm_Us_MyManageMapper")
	private Hm_Us_MyManageMapper mapper;
	

	@Override
	public boolean checkpwd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boolean result = mapper.checkpwd(map);
		return result;
	}

}
