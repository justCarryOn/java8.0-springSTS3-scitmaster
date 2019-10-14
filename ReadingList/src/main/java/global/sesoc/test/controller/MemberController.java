package global.sesoc.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.test.dao.BookRepository;
import global.sesoc.test.dao.MemberRepository;
import global.sesoc.test.vo.Member;

@Controller
public class MemberController {
	@Autowired
	MemberRepository repository;

	/**
	 * 로그인 폼 보기
	 */
	@RequestMapping (value="login", method=RequestMethod.GET)
	public String loginForm() {
		
		return "loginForm";
	}

	/**
	 * 로그인 처리
	 * @param member 사용자가 입력한 아이디, 비밀번호
	 * @param model Model객체
	 * @param session HttpSession객체
	 */
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String login(Member member, Model model, HttpSession session) {
		
		Member m = repository.selectOne(member);
		System.out.println(m);
		String message = "";
		if(m == null) {
			message = "로그인을 할 수 없습니다.";
			model.addAttribute("message", message);

			return "/loginForm";
		} else {
			session.setAttribute("loginId", m.getUserid());
			session.setAttribute("loginName", m.getUsername());
			
			return "redirect:/";
		}
	}
	
	/**
	 * 로그아웃 처리
	 * @param session HttpSession객체
	 */
	@RequestMapping (value="logout", method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}
