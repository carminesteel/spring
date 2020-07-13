package com.example.mapper;

import java.util.List;

import com.example.domain.SEnrollVO;
import com.example.domain.StudentsVO;

public interface StudentsMapper {
	public List<StudentsVO> list();
	public List<SEnrollVO> elist(String scode);
}
