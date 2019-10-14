package com.todoList.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.todoList.web.service.MemberService;
import com.todoList.web.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	MemberService service;
	
	// 아이디 중복확인
	@RequestMapping(value = "checkid", method = RequestMethod.POST)
	public String idcheck(RedirectAttributes rttr, String userid) {
		boolean result = service.checkid(userid);
		rttr.addFlashAttribute("result", result);
		rttr.addFlashAttribute("userid", userid);
		return "redirect:/member/checkidForm";
	}
	
	// 아이디 중복확인 화면 이동
	@RequestMapping(value = "checkidForm", method = RequestMethod.GET)
	public String idcheckForm() {
		return "/member/checkidForm";
	}
	
	// 회원가입 화면 이동
	@RequestMapping(value = "signupForm", method = RequestMethod.GET)
	public String signupForm() {
		return "/member/signupForm";
	}
	
	// 회원탈퇴 화면 이동
	@RequestMapping(value = "withdrawForm", method = RequestMethod.GET)
	public String withdrawForm() {
		return "/member/withdrawForm";
	}
	
	// 로그인 화면 이동
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/loginForm";
	}
	
	// 회원가입
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup(MemberVO vo) {
		service.signup(vo);
		return "redirect:/";
	}
	
	// 회원탈퇴
	@RequestMapping(value = "withdraw", method = RequestMethod.POST)
	public String withdraw(MemberVO vo, HttpSession session) {
		service.withdraw(vo, session);
		return "redirect:logout";
	}
	
	// 로그인
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		service.login(vo, session);
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		service.logout(session);
		return "redirect:/";
	}
}
