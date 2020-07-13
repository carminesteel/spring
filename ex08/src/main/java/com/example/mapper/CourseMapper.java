package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import com.example.domain.CourseVO;
import com.example.domain.Criteria;
import com.example.domain.EnrollmentsVO;

public interface CourseMapper {
	public List<CourseVO> listAll();
	public List<CourseVO> list(Criteria cri);
	public int totalCount(CourseVO vo);
	public List<HashMap<String,Object>> slist(String lcode);
}
