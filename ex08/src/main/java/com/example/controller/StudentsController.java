package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.CourseMapper;
import com.example.mapper.StudentsMapper;

@Controller
public class StudentsController {
	@Autowired
	StudentsMapper mapper;
	
	@Autowired
	CourseMapper cmapper;
	
	@RequestMapping("/stu/list")
	public String list(Model model, Criteria cri) {
		cri.setPerPageNum(4);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount());		
		model.addAttribute("pm",pm);
		
		model.addAttribute("list", mapper.list(cri));
		model.addAttribute("clist", cmapper.listAll());
		return "/stu/list";
	}
	
	@RequestMapping("/stu/rest/elist")
	@ResponseBody
	public List<HashMap<String,Object>> elist(String scode){
		return mapper.elist(scode);
	}
	
	
}
