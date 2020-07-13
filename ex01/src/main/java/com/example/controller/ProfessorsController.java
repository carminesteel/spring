package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.ProfessorsVO;
import com.example.mapper.ProfessorsMapper;

@Controller
@RequestMapping("/pro/")
public class ProfessorsController {
	@Autowired
	ProfessorsMapper mapper;

	@RequestMapping("list")
	public String list(Model model) {
		model.addAttribute("list", mapper.list());
		return "pro/list";
	}

	@RequestMapping("insert")
	public String insert() {
		return "pro/insert";
	}

	@RequestMapping(value = "insert", method = RequestMethod.POST)
	public String insertPost(ProfessorsVO vo) {
		System.out.println(vo.toString());
		mapper.insert(vo);
		return "redirect:list";		
	}
}
