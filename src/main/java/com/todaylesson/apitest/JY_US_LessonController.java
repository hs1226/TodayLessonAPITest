package com.todaylesson.apitest;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.todaylesson.DTO.LessonDTO;
import com.todaylesson.utils.UploadFileUtils;

public class JY_US_LessonController {

	
	private String path = "temp";
	// 파일이 저장되는 폴더
	
	
	@RequestMapping("lesson_write")
	public String write() {
		return "jy_lessonwrite";
	}
	
	@RequestMapping("jusoPopup")
	public String jusoPopup() {
		return "jy_jusoPopup";
	}	
	
	
	
	// 해당하는 객체를 스프링은 다 가지고 있으므로 원하는 객체를 주입 받아서 사용하면 됨
	// 그래서 httpsession도 가능
	@RequestMapping("insertresult")
	public String insertresult(HttpServletRequest request, LessonDTO dto, MultipartFile file) throws IOException, Exception {
		
		
		String imgUploadPath = path + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = path + File.separator + "images" + File.separator + "none.png";
		}

		dto.setLesson_thumb(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		return "insertresult";
	}
	
	
	
	
	
	
}
