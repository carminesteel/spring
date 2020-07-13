package com.example.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ReplyVO;
import com.example.mapper.ReplyMapper;

@Controller
@RequestMapping("/reply/")
public class ReplyController {
	@Autowired
	ReplyMapper mapper;
	
	@RequestMapping("list.json")
	@ResponseBody //이게 있으면 데이터가 리턴이 되고 없으면 페이지가 리턴
	public HashMap<String, Object> listJSON(Model model, Criteria cri, int bno) {
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		cri.setPerPageNum(5);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.total(bno));
		
		map.put("pm", pm);
		
		HashMap<String, Object> param=new HashMap<String, Object>();
		param.put("cri", cri);
		param.put("bno", bno);
		map.put("array", mapper.list(param));
		return map;

	}
	
	@RequestMapping("list")
	public void list(){
		
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public String insert(ReplyVO vo, RedirectAttributes rttr, Criteria cri) {
		System.out.println(vo.toString());
		rttr.addAttribute("page", cri.getPage());
		mapper.insert(vo);
		return "redirect:list";
	}
	
	@RequestMapping(value="delete", method=RequestMethod.GET)
	public String delete(int rno, RedirectAttributes rttr, Criteria cri) {
		//System.out.println(vo.toString());
		rttr.addAttribute("page", cri.getPage());
		mapper.delete(rno);
		return "redirect:list";
	}
}
