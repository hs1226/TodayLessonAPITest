package com.todaylesson.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.TestboardDTO;
import com.todaylesson.Mapper.JY_US_LessonMapper;

@Service(value="lessonservice")
public class JY_US_LessonServiceImple implements JY_US_LessonService {

	@Autowired
	public JY_US_LessonMapper mapper;
	
	@Override
	public int insertLesson(LessonDTO dto) {	
		return mapper.insert(dto);
	}

	@Override
	public List<LessonDTO> list() {
		return mapper.list();
	}

	
	
	// 테스트용

	@Override
	public int insertBoard(TestboardDTO dto) {
		return mapper.insertBoard(dto);
	}
	
}
