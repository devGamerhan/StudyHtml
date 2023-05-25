package com.example.view;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class VacationPageController {
	
	//회원가입
	@GetMapping("/vacation.do")
	public String vacationPage() {
		
		  return "vacation";
	}
}
