package com.example.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.example.domain.Criteria;
import com.example.domain.ReplyVO;

public interface ReplyMapper {
	
	public List<ReplyVO> list(HashMap<String, Object> param);
	public void insert(ReplyVO vo);
	public void delete(int rno);
	public ReplyVO read(int rno);
	public void update(ReplyVO vo);
	public int total(int bno);
}
