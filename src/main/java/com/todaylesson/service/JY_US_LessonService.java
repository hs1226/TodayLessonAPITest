package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.TestboardDTO;

public interface JY_US_LessonService {

	public int insertLesson(LessonDTO dto);

	public List<LessonDTO> list();

	
	// Å×½ºÆ®

	public int insertBoard(TestboardDTO dto);

}
