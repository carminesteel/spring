package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@Controller
public class UserController {
	@Autowired
	UserMapper mapper;
	
	@RequestMapping("/user/list")
	public void list(Model model, HttpSession session) {
		session.setAttribute("vos", 1);
		model.addAttribute("list", mapper.list());
		
	}	
	
	@RequestMapping("/user/listSend")
	public void read(Model model, String id) {
		model.addAttribute("list", mapper.list());
		model.addAttribute("vo", mapper.read(id));
	}
	
	@RequestMapping("/user/listReceived")
	public void send(Model model, String id) {
		model.addAttribute("vo", mapper.read(id));
	}
	
	
	@RequestMapping("/user/getUser")
	@ResponseBody
	public UserVO getUser(String id) {
		return mapper.read(id);
	}
	
	@RequestMapping("/user/login")
	public void login() {		
	}
	
	@RequestMapping(value="/user/login", method=RequestMethod.POST)
	@ResponseBody
	public int loginPost(UserVO vo, HttpSession session) {
		int result=0;
		String id=vo.getId();
		String pass=vo.getPass();
		
		UserVO userVO=mapper.read(id);
		if(userVO==null) {
			result=0;
		}else if(!userVO.getPass().equals(pass)) {
			result=1;
		}else {
			session.setAttribute("id", id);
			result=2;
		}		
		return result;
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
