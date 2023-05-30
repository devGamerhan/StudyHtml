package com.example.view;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.biz.board.VacationService;
import com.example.biz.board.VacationVO;

@Controller
public class VacationController {

	@Autowired
	private VacationService vacationService;
	
	/*	직원이 컨트롤 할 수 있는 부분에 대한 내용 관련
	 *	1. 휴가서 작성 페이지
	 *	2. 휴가서 작성 버튼 클릭
	 * 	3. 마이 페이지
	 * 	4. 작성한 휴가서 삭제
	 * 
	 **/
	
	//1.휴가서 페이지
	@GetMapping("/vacation.do")
	public String vacationPage() {
		  return "vacation";
	}
	
	//2.휴가서 작성
	@PostMapping("/insertVacation.do")
	public void insertVacation(VacationVO vo, HttpServletResponse response) {
		vacationService.insertVacation(vo);
		System.out.println("휴가서 등록 완료");
		response.setContentType("text/html;charset=utf-8;");
		
		try {
			PrintWriter out = response.getWriter();
			out.print("<script>alert('등록되었습니다.'); location.href='main.jsp';</script>");
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//3.마이 페이지
	@GetMapping("/myPage.do")
	public String myPage(Model model, HttpSession session, VacationVO vo) {
		if(session.getAttribute("id") == null) {
			return "myPage";
		}
		else {
			List<VacationVO> vacationList = vacationService.getVacationListFromName(session, vo);
			model.addAttribute("vacationList", vacationList);
			model.addAttribute("paging",vacationService.paging(vo));
			return "myPage";
		}
	}
	
	//4.작성한 휴가서 삭제
	//미완성
	
	
	/*
	 *	관리자가 컨트롤 하는 vacation 내용 관련
	 *	1. 휴가서 리스트
	 * 	2. 휴가서 상세보기
	 * 	3. 휴가서 승인
	 *  4. 휴가서 거부
	 *  5. 휴가서 거부 사유 입력 페이지
	 **/
	
	//1. 휴가서 리스트
	@GetMapping("/vacationManager.do")
	public String vacationManager(Model model, VacationVO vo) {
		List<VacationVO> vacationList = vacationService.getVacationList(vo);
		model.addAttribute("vacationList", vacationList);
		model.addAttribute("paging",vacationService.paging(vo));
		return "vacationManager";
	}
	
	//2. 휴가서 상세보기
	@GetMapping("/getVacation.do")
	public String getVacation(Model model, @RequestParam("seq") int seq) {
		VacationVO vacation = vacationService.getVacation(seq);
		model.addAttribute("vacation", vacation);
		return "getVacation";
	}
	
	//3. 휴가서 승인
	@GetMapping("/confirmVacation.do")
	public String confirmVacation(Model model, @RequestParam("seq") int seq, @RequestParam("accept") String accept) {
		vacationService.confirmVacation(seq, accept);
		return "redirect:vacationManager.do";
	}
	
	//4. 휴가서 거부
	@PostMapping("/refuseVacationPost.do")
	public String refuseVacation(int seq, String refuse, String reason) {
		vacationService.refuseVacation(seq, refuse, reason);
		System.out.println("거절사유:"+reason);
		return "redirect:vacationManager.do";
	}
	
	//5. 휴가서 거부 사유 입력 페이지
	@GetMapping("/refusePage.do")
	public String refusePage(Model model, int seq) {
		System.out.println("refusePage get타입 실행");
		model.addAttribute("seq", seq);
		return "refusePage";
	}
}
