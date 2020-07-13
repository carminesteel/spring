package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.domain.MessageVO;
import com.example.mapper.MessageMapper;
import com.example.service.MessageService;

@RestController
public class MessageController {
	@Autowired
	MessageMapper mapper;
	
	@Autowired
	MessageService service;
	
	@RequestMapping("/message/sdelete")
	public void sdelete(int mid) {
		mapper.updateSdel(mid);
	}
	
	@RequestMapping("/list/send")
	public List<MessageVO> listSend(String id){		
		return mapper.listSend(id);
	}
	
	@RequestMapping("/list/received")
	public List<MessageVO> listReceived(String id){		
		return mapper.listReceived(id);
	}
	
	@RequestMapping("/message/insert")
	public void insert(MessageVO vo) {
		service.insert(vo);
	}
	
	@RequestMapping("/message/read")
	public MessageVO read(int mid) {
		return service.read(mid);
	}
}
