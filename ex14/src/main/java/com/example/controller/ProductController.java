package com.example.controller;

import java.io.File;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.example.domain.Criteria;
import com.example.domain.PageMaker;
import com.example.domain.ProductVO;
import com.example.mapper.ProductMapper;
import com.example.service.ProductService;

@Controller
public class ProductController {
	@Resource(name="uploadPath")
	private String path;
	
	@Autowired
	ProductMapper mapper;
	
	@Autowired
	ProductService service;
	
	@RequestMapping("/pro/insert")
	public void insert() {		
	}
	
	@RequestMapping("/pro/read")
	public void read(String pcode, Model model) {
		model.addAttribute("vo", mapper.read(pcode));
		model.addAttribute("list",mapper.getAttach(pcode));
	}
	
	@RequestMapping("/pro/list")
	public void list(Model model, Criteria cri) {
		System.out.println(cri.toString());
		
		cri.setPerPageNum(8);
		PageMaker pm=new PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(mapper.totalCount(cri));
		
		model.addAttribute("cri", cri);
		model.addAttribute("pm",pm);
		model.addAttribute("list",mapper.list(cri));
	}
	
	@RequestMapping(value="/pro/insert", method=RequestMethod.POST)
	public String insertPost(ProductVO vo, MultipartHttpServletRequest multi)throws Exception {
		MultipartFile file= multi.getFile("file");
		if(!file.isEmpty()) {
			String image=System.currentTimeMillis() + file.getOriginalFilename();
			file.transferTo(new File(path+File.separator+image));
			vo.setImage(image);
		}
		
		//첨부파일 업로드
		List<MultipartFile> files= multi.getFiles("files");
		ArrayList<String> images=new ArrayList<String>();
		
		for(MultipartFile addFile:files) {
			if(!addFile.isEmpty()) {
				String image=System.currentTimeMillis() + addFile.getOriginalFilename();
				addFile.transferTo(new File(path+File.separator+image));
				images.add(image);
			}
		}
		vo.setImages(images);
		System.out.println(vo.toString());
		
		service.insert(vo);
		return "redirect:list";		
	}
	
	@RequestMapping(value="/pro/delete", method=RequestMethod.POST)
	public String deletePost(ProductVO vo)throws Exception {
		
		String oldImage=vo.getImage();
		if(!oldImage.equals("")) {
			new File(path+File.separator+oldImage).delete();
		}
	
		//첨부파일 삭제
		List<String> images=mapper.getAttach(vo.getPcode());
		for(String image:images) {
				new File(path+File.separator+image).delete();
		}
		service.delete(vo.getPcode());
		return "redirect:list";		
	}
	
	@RequestMapping(value="/pro/update", method=RequestMethod.POST)
	public String updatePost(ProductVO vo, MultipartHttpServletRequest multi)throws Exception {
		System.out.println(vo.toString());
		MultipartFile file = multi.getFile("file");
		if (!file.isEmpty()) {

			String oldImage = vo.getImage();
			if (!oldImage.equals("")) {
				new File(path + File.separator + oldImage).delete();
			}
			String image = System.currentTimeMillis() + file.getOriginalFilename();// image에 파일명넣음
			file.transferTo(new File(path + File.separator + image));// 파일을 새로 저장함
			vo.setImage(image);// 파일명을 vo에 넣음
		}
		// 첨부파일 업로드
		List<MultipartFile> files = multi.getFiles("files");// 파일들 이름값 가져옴
		ArrayList<String> images = new ArrayList<String>();// images라는 어레이 생성

		if (!files.get(0).isEmpty()) {
			List<String> oldImages=mapper.getAttach(vo.getPcode());
			for(String oldImage:oldImages) {
				new File(path + File.pathSeparator + oldImage).delete();
			}
		}
		//새로운 첨부파일 업로드
		for(MultipartFile attFile:files) {
			if(!attFile.isEmpty()) {
				String image=System.currentTimeMillis() + attFile.getOriginalFilename();
				attFile.transferTo(new File(path + File.separator + image));
				images.add(image);
			}
		}
		vo.setImages(images);
		service.update(vo);
		return "redirect:list";
	}
	

	@RequestMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> display(String fileName) throws Exception {
		ResponseEntity<byte[]> result = null;

		if (!fileName.equals("")) {
			File file = new File(path + File.separator + fileName);
			HttpHeaders header = new HttpHeaders();
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		}
		return result;
	}
}
