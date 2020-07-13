package com.example.controller;




import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.AddressVO;
import com.example.mapper.AddressMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //���� SpringJUnit4ClassRunner.class import�Ѵ�.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class AddressTest {
    @Autowired
    private AddressMapper mapper;
   
    @Test
    public void list() {
    	mapper.list();
    }
    @Test
    public void read() {
    	mapper.read(11);
    }
    @Test
    public void insert() {
    	AddressVO vo=new AddressVO();
    	vo.setName("�׽�Ʈ");
    	vo.setAddress("��õ");
    	vo.setTel("010-0003-0003");    	
    	mapper.insert(vo);
    }
    
    @Test
    public void update() {
    	AddressVO vo=new AddressVO();
    	vo.setId(11);
    	vo.setName("�׽�Ʈ2");
    	vo.setAddress("����");
    	vo.setTel("010-4242-0003");    	
    	mapper.update(vo);
    }
   
    @Test
    public void delete() { 	
    	mapper.delete(11);
    }
   
    
}
