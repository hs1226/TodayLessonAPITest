package com.todaylesson.service;

import java.util.List;

import com.todaylesson.DTO.LessonDTO;

public interface JY_US_LessonService {

	public int insertLesson(LessonDTO dto);

	public List<LessonDTO> list();

}
