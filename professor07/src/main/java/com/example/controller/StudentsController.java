package com.example.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.StudentsMapper;

@Controller
public class StudentsController {
	@Autowired
	StudentsMapper mapper;
	
	@RequestMapping("/stu/list")
	public String list(Model model, Criteria cri){
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount());
		
		model.addAttribute("pm", pm);
		
		model.addAttribute("list", mapper.list(cri));
		return "/stu/list";
	}
	
	@RequestMapping("/stu/rest/elist")
	@ResponseBody
	public HashMap<String,Object> elist(String scode){
		HashMap<String,Object> map=new HashMap<String,Object>();
		map.put("array", mapper.elist(scode));
		return map;
	}
}
