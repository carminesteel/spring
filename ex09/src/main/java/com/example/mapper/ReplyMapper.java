package com.example.mapper;

import java.util.List;

import com.example.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> list(int bno);
	public void insert(ReplyVO vo);
	public void delete(int rno);
	
}
