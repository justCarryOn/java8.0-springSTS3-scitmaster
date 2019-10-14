package com.test.web.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.test.web.dao.GuestbookDAO;
import com.test.web.vo.GuestbookVO;

@Service
public class GuestbookService {
	
	@Autowired
	private GuestbookDAO dao;
	
	public boolean delete(GuestbookVO vo) {
//		GuestbookVO guestbookVO = dao.read(vo.getSeq());
		String savedFilename = dao.read(vo.getSeq()).getSavedFilename();
		
		if(dao.delete(vo) != 1) return false;
		File file = new File("C:/test/" + savedFilename);
		if(file.exists()) file.delete();
		return true;
	}
	
	public ArrayList<GuestbookVO> guestbookList(String searchItem, String searchKeyword) {
		HashMap<String, String> map = new HashMap<>();
		map.put("searchItem", searchItem);
		map.put("searchKeyword", searchKeyword);
		return dao.guestbookList(map);
	}
	
	public boolean write(GuestbookVO vo, MultipartFile uploadFile) {
		if(!uploadFile.isEmpty()) {
			String originalFilename = uploadFile.getOriginalFilename();
			String savedFilename = UUID.randomUUID().toString();
			
			vo.setOriginalFilename(originalFilename);
			vo.setSavedFilename(savedFilename);
			
			try {
				uploadFile.transferTo(new File("C:/test/" + savedFilename));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
		}
		if(dao.write(vo) != 1) return false;
		return true;
	}

	public GuestbookVO read(int seq) {
		return dao.read(seq);
	}

	public void download(GuestbookVO vo, HttpServletResponse response) {
		File file = new File("C:/test/" + vo.getSavedFilename());
		String originalFilename = vo.getOriginalFilename();
		
		try {
			response.setHeader("Content-Disposition",
					"attachment;filename=" + URLEncoder.encode(originalFilename, "UTF-8"));
			response.setContentLength((int)file.length());
			FileCopyUtils.copy(new FileInputStream(file), response.getOutputStream());
		} catch (IOException e) {
			e.printStackTrace();
		}
//		try {
//			response.setHeader("Content-Disposition", "inline");
//			response.addHeader("Content-Type", "text/html;charset=UTF-8");
//			PrintWriter p = response.getWriter();
//			p.write("<h1>직접 작성한 화면</h1>");
//			p.close();
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
	}
}












