package com.example.view;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	 * 	3. 스케줄 가져오기
	 * 	4. 스케줄 수정
	 *  5. 스케줄 삭제 화면
	 *  6. 스케줄 삭제
	 **/
	
	// 1. 스케줄 관리 화면
	@GetMapping("/scheduleManager.do")
	public String scheduleManager(Model model) {
		List<ScheduleVO> scheduleList = scheduleService.getScheduleList();
		model.addAttribute("scheduleList",scheduleList);
		return "scheduleManager";
	}
	
	// 2. 스케줄 전체 가져오기
	@GetMapping("/schedule.do")
	public String getScheduleList(Model model) {
		List<ScheduleVO> scheduleList = scheduleService.getScheduleList();
		model.addAttribute("scheduleList",scheduleList);
		return "getScheduleList";
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
	
	// 3. 스케줄 가져오기
	@GetMapping("/getSchedule.do")
	public String getSchedule(Model model, @RequestParam String choiceColor) {
		/*
		 * # 기호는 html 에서 URL 로 인식하지 않기 때문에 substring 으로 잘라서 보내야됨
		 * 따라서 가져온 다음 다시 # 기호를 붙여줘야 데이터베이스에서 정상적으로 인식
		 * */
		ScheduleVO vo = new ScheduleVO();
		vo.setChoiceColor("#"+choiceColor);					
		ScheduleVO vo2 = scheduleService.getSchedule(vo);
		model.addAttribute("schedule",vo2);
		return "updateSchedule";
	}
	
	// 4. 스케줄 수정
	@PostMapping("/updateSchedule.do")
	public String updateSchedule(ScheduleVO vo) {
		scheduleService.updateSchedule(vo);
		return "redirect:scheduleManager.do";
	}
	
	// 5. 스케줄 삭제 화면
	@GetMapping("/deleteSchedulePage.do")
	public String deleteSchedulePage(Model model, @RequestParam String choiceColor) {
		ScheduleVO vo = new ScheduleVO();
		vo.setChoiceColor("#"+choiceColor);	
		model.addAttribute("schedule", vo);
		return "deleteSchedulePage";
	}
	
	// 6. 스케줄 삭제
	@GetMapping("/deleteSchedule.do")
	public String deleteSchedule(@RequestParam String choiceColor) {
		ScheduleVO vo = new ScheduleVO();
		vo.setChoiceColor("#"+choiceColor);	
		scheduleService.deleteSchedule(vo);
		return "redirect:scheduleManager.do";
	}
}
