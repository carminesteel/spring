package com.example.mapper;

import com.example.domain.EnrollmentsVO;

public interface EnrollmentsMapper {
	public void insert(EnrollmentsVO vo);
	public int read(EnrollmentsVO vo);
	public void delete(EnrollmentsVO vo);
	public void update(EnrollmentsVO vo);
}
