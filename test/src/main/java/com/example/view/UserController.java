package com.example.view;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.biz.user.UserService;
import com.example.biz.user.UserVO;


@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	//회원가입
	@PostMapping("/insertUser.do")
	public void insertUser(UserVO vo, HttpServletResponse response) {
		userService.insertUser(vo);
		System.out.println("회원 등록 완료");
		response.setContentType("text/html;charset=utf-8;");
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>window.close();</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
		
	//로그인
	@PostMapping("/login.do")
	public String login(UserVO vo, HttpSession session) {
		
		UserVO user = userService.getUser(vo);
		
		if(user != null) {
			session.setAttribute("id",user.getId());
			session.setAttribute("name",user.getName());
			session.setAttribute("role",user.getRole());
		}
		else {
			System.out.println("유저 정보 없음");
		}
		return "redirect:main.jsp";
	}
	
	//로그아웃
	@RequestMapping(value="logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login.do";
	}
}
