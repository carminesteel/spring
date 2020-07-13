package com.example.controller;




import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.UserVO;
import com.example.mapper.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class UserTest {
    @Autowired
    private UserMapper mapper;
   
    @Test
    public void list() {
    	mapper.list();
    }
    @Test
    public void read() {
    	mapper.read("testid");
    }
    @Test
    public void insert() {
    	UserVO vo=new UserVO();
    	vo.setId("testid");
    	vo.setName("테스트");
    	vo.setPass("aosdkasodk");    	
    	mapper.insert(vo);
    }
    
    @Test
    public void update() {
    	UserVO vo=new UserVO();
    	vo.setId("testid");
    	vo.setName("테스트수정됌");
    	vo.setPass("aosdkasodk");
    	mapper.update(vo);
    }
   
    @Test
    public void delete() { 	
    	mapper.delete("testid");
    }
   
    
}
