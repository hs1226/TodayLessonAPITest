package com.todaylesson.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.DTO.TestboardDTO;


@Mapper
public interface JY_US_LessonMapper {

	public int insert(LessonDTO dto);

	
	public List<LessonDTO> list();

	// Å×½ºÆ®

	public int insertBoard(TestboardDTO dto);

	
	
}
