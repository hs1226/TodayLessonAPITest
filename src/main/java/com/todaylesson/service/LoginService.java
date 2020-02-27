package com.todaylesson.service;

import java.util.HashMap;

public interface LoginService {
	int idCheck(String member_id);

	String get_searchId(HashMap<String, Object>  map);

}
