package com.example.view;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.biz.board.ScheduleService;
import com.example.biz.board.ScheduleVO;

@Controller
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;

	/*
	 *	관리자가 컨트롤 하는 schedule 내용 관련
	 *	1. 스케줄 관리 화면
	 * 	2. 스케줄 등록
	 * 	3. 스케줄 수정
	 *  4. 스케줄 삭제
	 **/
	
	// 1. 스케줄 관리 화면
	@GetMapping("/scheduleManager.do")
	public String scheduleManager(Model model) {
		List<ScheduleVO> scheduleList = scheduleService.getScheduleList();
		model.addAttribute("scheduleList",scheduleList);
		return "scheduleManager";
	}
	
	// 2. 스케줄 등록
	@PostMapping("/insertSchedule.do")
	public void insertSchedule(ScheduleVO vo, HttpServletResponse response) {
		scheduleService.insertSchedule(vo);
		response.setContentType("text/html;charset=utf-8;");
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('등록되었습니다.'); location.href='scheduleManager.do';</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 3. 스케줄 수정
	
}
