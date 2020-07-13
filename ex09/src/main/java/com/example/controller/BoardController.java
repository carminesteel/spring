package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.mapper.BoardMapper;

@Controller
public class BoardController {
	@Autowired
	BoardMapper mapper;
	
	@RequestMapping("/board/list")
	public String list(Criteria cri, Model model) {
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.list(cri));
		System.out.println(model);
		return "/board/list";
		
	}
	
	@RequestMapping("/board/read")
	public void read(int bno, Model model) {
		model.addAttribute("vo", mapper.read(bno));
	}
	
	@RequestMapping(value="/board/update", method=RequestMethod.POST)
	@ResponseBody
	public void update(BoardVO vo) {
		mapper.update(vo);
	}
	
	@RequestMapping("/board/delete")
	@ResponseBody
	public int delete(int bno) {
		int cnt=mapper.count(bno);
		if(cnt==0) {
		mapper.delete(bno);
		}
		
		return cnt;
	}
	/*
	@RequestMapping("/board/count")
	public int count(int bno) {
		mapper.delete(bno);
		return count;
	}
	*/
}

