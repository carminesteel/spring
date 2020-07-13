package com.example.mapper;

import java.util.ArrayList;

import com.example.domain.AddressVO;

public interface AddressMapper {

	public ArrayList<AddressVO> list();
	public void insert(AddressVO vo);
	public AddressVO read(int id);
	public void update(AddressVO vo);
	public void delete(int id);
	
}
