package com.example.controller;



import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.domain.EnrollmentsVO;
import com.example.mapper.CourseMapper;
import com.example.mapper.EnrollmentsMapper;
import com.example.mapper.StudentsMapper;

@RunWith(SpringJUnit4ClassRunner.class)  //먼저 SpringJUnit4ClassRunner.class import한다.
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class StudentsTest {
	
	@Autowired
    private StudentsMapper mapper;
	
	@Autowired
    private CourseMapper cmapper;
	
	@Autowired
    private EnrollmentsMapper emapper;
	
    @Test
    public void listAll() {
    	cmapper.listAll();
    }
    @Test
    public int read(EnrollmentsVO vo) {
    	int count=-1;
    	vo=new EnrollmentsVO();
    	emapper.read(vo);
    	return count;
    }

}
