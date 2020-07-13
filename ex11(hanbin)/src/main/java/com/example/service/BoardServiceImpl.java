package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.BoardVO;
import com.example.mapper.BoardMapper;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper mapper;
	
	@Transactional //둘중 하나라도 오류나면 기존상태로 돌리는것
	@Override
	public BoardVO read(int bno) {
		mapper.updateViewcnt(bno);
		return mapper.read(bno);
	}
	
	
}
