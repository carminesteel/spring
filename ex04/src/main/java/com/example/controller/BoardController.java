package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;

@Controller
@RequestMapping("/board/")
public class BoardController {
	@Autowired
	BoardMapper mapper;
	
	@RequestMapping("list")
	public void list(Model model, Criteria cri) {
		cri.setPerPageNum(10);
		
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totCount(cri));
		
		model.addAttribute("list",mapper.list(cri));
		model.addAttribute("cri",cri);
		model.addAttribute("pm", pm);
	}
	@RequestMapping("insert")
	public void insert() {
				
	}
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insertPost(BoardVO vo) {
		System.out.println(vo.toString());
		mapper.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping("read")
	public void read(int bno, Model model, Criteria cri) {
		model.addAttribute("vo", mapper.read(bno));
		model.addAttribute("cri", cri);
	}
	
	@RequestMapping(value="update", method=RequestMethod.POST)
	public String updatePost(BoardVO vo, Model model, Criteria cri) {
		System.out.println(vo.toString());		
		mapper.update(vo);
		model.addAttribute("page", cri.getPage());
		model.addAttribute("searchType", cri.getSearchType());
		model.addAttribute("keyword", cri.getKeyword());
		return "redirect:list";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.POST)
	public String deletePost(int bno) {
		mapper.delete(bno);
		return "redirect:list";
	}
}
