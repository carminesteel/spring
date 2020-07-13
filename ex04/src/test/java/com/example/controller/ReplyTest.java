package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.ReplyVO;
import com.example.mapper.ReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyTest {
    @Autowired
    private ReplyMapper mapper;
    
   
    
    @Test
    public void read() {
    	mapper.read(16);
    }
    
    @Test
    public void update() {
    	ReplyVO vo=new ReplyVO();
    	vo.setRno(16);
    	vo.setReply("16zzz.");
    	mapper.update(vo);
    }
}
