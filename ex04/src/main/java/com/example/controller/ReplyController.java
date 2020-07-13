package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.ReplyMapper;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	@Autowired
	ReplyMapper mapper;
	
	@RequestMapping("list")
	public void list(Model model, Criteria cri) {
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.total());
		
		model.addAttribute(cri);
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.list(cri));
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ReplyVO vo, Criteria cri, Model model) {
		System.out.println(vo.toString());
		mapper.insert(vo);
		model.addAttribute("page", cri.getPage());
		return "redirect:list";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int rno, Criteria cri, Model model) {
		mapper.delete(rno);
		model.addAttribute("page", cri.getPage());
		return "redirect:list";
	}
}
