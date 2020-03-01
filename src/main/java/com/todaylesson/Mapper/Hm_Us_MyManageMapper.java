package com.todaylesson.Mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Hm_Us_MyManageMapper {

	boolean checkpwd(HashMap<String, Object> map);

	
	
}
