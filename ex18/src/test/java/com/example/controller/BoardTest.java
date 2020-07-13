package com.example.controller;



import java.util.HashMap;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.Criteria;
import com.example.mapper.BoardMapper;
import com.example.mapper.MysqlMapper;
import com.example.mapper.ReplyMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardTest {
    @Autowired
    private BoardMapper mapper;
    
    @Autowired
    private ReplyMapper rMapper;
    
    @Test
    public void rlist(){
    	Criteria cri=new Criteria();
    	HashMap<String,Object> map=new HashMap<String,Object>();
    	map.put("cri", cri);
    	map.put("bno", 956);
    	rMapper.list(map);
    }
    
    @Test
    public void list(){
    	Criteria cri=new Criteria();
    	cri.setPerPageNum(5);
    	cri.setPage(1);
    	mapper.list(cri);
    }
}
