package com.example.biz.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface VacationService {

	public void insertVacation(VacationVO vo);
	public List<VacationVO> getVacationListFromName(HttpSession session, VacationVO vo);
	public List<VacationVO> getVacationList(VacationVO vo);
	public VacationVO getVacation(int seq);
	public void confirmVacation(int seq, String accept);
	public void refuseVacation(int seq, String refuse, String reason);
	public Map<String,Object> paging(VacationVO vo);
}