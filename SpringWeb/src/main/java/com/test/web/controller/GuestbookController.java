package com.test.web.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.test.web.service.GuestbookService;
import com.test.web.vo.GuestbookVO;

@Controller
@RequestMapping("/guestbook")
public class GuestbookController {
	
	@Autowired
	private GuestbookService service;
	
	@RequestMapping(value = "nullException", method = RequestMethod.GET)
	public String nullException() {
		throw new NullPointerException();
	}
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void download(int seq, HttpServletResponse response) {
		GuestbookVO vo = service.read(seq);
		service.download(vo, response);
	}
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(GuestbookVO vo) {
		service.delete(vo);
		return "redirect:/guestbook/guestbookList";
	}
	
	@RequestMapping(value = "guestbookList", method = {RequestMethod.GET, RequestMethod.POST})
	public String guestbookList(
			@RequestParam(value="searchItem", defaultValue="name") String searchItem
			,@RequestParam(value="searchKeyword", defaultValue="") String searchKeyword
			, Model model) {
		ArrayList<GuestbookVO> list = service.guestbookList(searchItem, searchKeyword);
		model.addAttribute("list", list);
		return "/guestbook/guestbookList";
	}
	
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(GuestbookVO vo, Model model, MultipartFile uploadFile) {
		boolean result = service.write(vo, uploadFile);
		model.addAttribute("writeResult", result);
		return "forward:/guestbook/guestbookList";
	}
}









