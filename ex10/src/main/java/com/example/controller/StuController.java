package com.example.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.Criteria;
import com.example.domain.EnrollVO;
import com.example.domain.PageMaker;
import com.example.domain.StuVO;
import com.example.mapper.CouMapper;
import com.example.mapper.ProMapper;
import com.example.mapper.StuMapper;

/**
 * Handles requests for the application home page.
 */
@Controller
public class StuController {
	@Autowired
	StuMapper mapper;
	
	@Autowired
	ProMapper pMapper;
	
	@Autowired
	CouMapper cMapper;
	
	@RequestMapping(value = "/stu/list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		PageMaker pm=new PageMaker();
		cri.setPerPageNum(3);
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount());
		
		model.addAttribute("pm", pm);
		model.addAttribute("list", mapper.list(cri));
		mapper.list(cri);
	}
	
	@RequestMapping(value = "/stu/read", method = RequestMethod.GET)
	public void read(String scode, Model model,int page) {
	
		model.addAttribute("vo",mapper.read(scode));
		model.addAttribute("page",page);
		model.addAttribute("plist",pMapper.plist());
		model.addAttribute("clist",cMapper.list());

	}
	
	@RequestMapping(value = "/stu/enrollCount")
	@ResponseBody
	public int enrollCount(String scode) {
		return mapper.enrollCount(scode);		
	}
	
	@RequestMapping(value = "/stu/update", method = RequestMethod.POST)
	public String update(StuVO vo, int page) {
		mapper.update(vo);
		return "redirect:list?page="+page;		
	}
	
	@RequestMapping(value = "/stu/listEnroll")
	@ResponseBody
	public HashMap<String,Object> listEnroll(String scode){		
		HashMap<String, Object> map = new HashMap<String,Object>();
		map.put("list", mapper.listEnroll(scode));
		map.put("total", mapper.enrollCount(scode));
		return map;	
	}
	
	@RequestMapping(value = "/stu/chartEnroll")
	@ResponseBody
	public ArrayList chartEnroll(String scode){		
		ArrayList arrayList=new ArrayList();
		ArrayList array=new ArrayList();
		array.add("과목명");
		array.add("점수");
		arrayList.add(array);
		
		List<EnrollVO> list=mapper.listEnroll(scode);
		for(EnrollVO vo:list) {
			array=new ArrayList();
			array.add(vo.getLname());
			array.add(vo.getGrade());
			arrayList.add(array);
		}
		return arrayList;	
	}
	
	@RequestMapping(value = "/stu/chart")
	public void chart() {
		
	}
	
}
