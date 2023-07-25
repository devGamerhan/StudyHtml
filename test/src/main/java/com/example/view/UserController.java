package com.example.view;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

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
	
	//아이디 중복 체크
	@GetMapping("/userIdCheck.do")
	public void idCheck(HttpServletResponse response, HttpServletRequest request) {
		String id = request.getParameter("param");
		userService.idCheck(response, id);
	}
	
	
	//메인화면
	@GetMapping("/main.do")
	public String main(Model model, HttpSession session) {
		
		if(session.getAttribute("id") == null) {
			return "main";
		}
		else {
			UserVO user = userService.getMain((String)session.getAttribute("id"));
			model.addAttribute("user", user);
			return "main";
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
			session.setAttribute("team",user.getTeam());
		}
		else {
			System.out.println("유저 정보 없음");
		}
		return "redirect:main.do";
	}
	
	//로그아웃
	@GetMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:main.do";
	}
}
