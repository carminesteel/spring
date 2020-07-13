package com.example.mapper;

import java.util.List;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;

public interface BoardMapper {
	public List<BoardVO> list(Criteria cri);
	public int totalCount(Criteria cri);
	public void insert(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int bno);
	public BoardVO read(int bno);
	public int count(int bno);
	
}
