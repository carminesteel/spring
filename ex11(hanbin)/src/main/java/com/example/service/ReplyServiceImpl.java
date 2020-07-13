package com.example.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.domain.ReplyVO;
import com.example.mapper.BoardMapper;
import com.example.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService {
	
	@Autowired
	ReplyMapper rmapper;
	
	@Autowired
	BoardMapper bmapper;
	
	@Transactional
	@Override
	public void insert(ReplyVO vo) {
		rmapper.insert(vo);
		bmapper.updateReplycnt(vo.getBno(), 1);
		
	}
	@Transactional
	@Override
	public void delete(int rno) {
		ReplyVO vo=rmapper.read(rno);
		rmapper.delete(rno);
		bmapper.updateReplycnt(vo.getBno(), -1);
	}

}
