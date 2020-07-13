package com.example.mapper;

import com.example.domain.UserVO;

public interface UserMapper {
	public void insert(UserVO vo);
	public UserVO read(String id);
}
