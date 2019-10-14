package global.sesoc.test.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.test.dao.BookRepository;
import global.sesoc.test.vo.Book;

@Controller
public class BookController {
	@Autowired
	BookRepository repository;
	
	@RequestMapping("/reading")
	public String readingList()	{
				
		return "readingList";
	}
	
	@RequestMapping("/readingList")
	@ResponseBody
	public List<Book> readingList(Model model ) {
		List<Book> readingList = repository.readingList();
		model.addAttribute("readingList", readingList);
		
		return readingList;
	}
	
	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	@ResponseBody
	public String regist(Book book, HttpSession session) {
		String userid = (String) session.getAttribute("loginId");
		System.out.println(userid);
		book.setUserid(userid);
		System.out.println("책 등록: " + book);		
		repository.insertReview(book);
		
		return "success";
	}
	
	@RequestMapping(value = "/deletebook", method = RequestMethod.GET)
	@ResponseBody
	public String regist(int booknum, HttpSession session) {
		int result = repository.deleteReview(booknum);
		
		if(result == 1) return "success";
		else 			return "fail";
	}
	
	@RequestMapping(value = "/searchshelf", method = RequestMethod.GET)
	@ResponseBody
	public List<Book> searchshelf(Book book, HttpSession session) {
		System.out.println("검색 : " + book);
		
		List<Book> searchList = repository.searchShelf(book);
		System.out.println("검색결과 : " + searchList);
		return searchList;
	}

	@RequestMapping(value = "/updatebook", method = RequestMethod.GET)
	@ResponseBody
	public Book searchBook(int booknum, HttpSession session) {
		Book searchList = repository.searchBook(booknum);
		
		return searchList;
	}
	@RequestMapping(value = "/updatebook", method = RequestMethod.POST)
	@ResponseBody
	public String updateBook(Book book, HttpSession session) {
		String userid = (String) session.getAttribute("loginId");
		book.setUserid(userid);
		repository.updateReview(book);
		
		return "success";
	}
}
