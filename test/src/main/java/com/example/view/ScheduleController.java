package com.example.view;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.biz.board.ScheduleService;

@Controller
public class ScheduleController {
	
	//@Autowired
	//private ScheduleService scheduleService;
	
	@GetMapping("/scheduleManager.do")
	public String ScheduleManager() {
		return "scheduleManager";
	}
}
