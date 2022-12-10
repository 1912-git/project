package com.spring_boot_mybatis.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring_boot_mybatis.project.service.MemberService;


@Controller
public class MemberController {
	@Autowired
	MemberService service;
	
	// 로그인 폼 열기
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/loginForm";
	}
	
	// 로그인 처리 : id와 pwd 전달 받아서 로그인 인증 완료 후 세션 설정
	@ResponseBody
	@RequestMapping("/login")
	public String loginCheck(@RequestParam HashMap<String, Object> param,
												HttpSession session) {
		// 로그인 체크 결과 
		String memId = service.loginCheck(param);
		String result = "fail";
		
		// 아이디와 비밀번호 일치하면 (로그인 성공하면)
		if(memId != null) {
			//로그인 성공하면 세션 변수 지정
			session.setAttribute("sid", memId);
			result = "success";
		}
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		//세션 무효화
		session.invalidate();		
		return "redirect:/"; // index로 포워딩 -> ProductController에 있는 @RequestMapping("/") 
	}
	
}