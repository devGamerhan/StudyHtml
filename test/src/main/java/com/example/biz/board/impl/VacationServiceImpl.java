package com.example.biz.board.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.biz.board.VacationService;
import com.example.biz.board.VacationVO;

@Service("vacationService")
public class VacationServiceImpl implements VacationService {

	@Autowired
	private VacationDAO vacationDAO;
	
	@Override
	public void insertVacation(VacationVO vo) {
		vacationDAO.insertVacation(vo);
	}

	@Override
	public List<VacationVO> getVacationListFromName(HttpSession session, VacationVO vo) {
		return vacationDAO.getVacationListFromName(session, vo);
	}

	@Override
	public List<VacationVO> getVacationList(VacationVO vo) {
		return vacationDAO.getVacationList(vo);
	}

	@Override
	public VacationVO getVacation(int seq) {
		return vacationDAO.getVacation(seq);
	}

	@Override
	public void confirmVacation(int seq, String accept) {
		// TODO Auto-generated method stub
		vacationDAO.confirmVacation(seq, accept);
	}

	@Override
	public void refuseVacation(int seq, String accept, String reason) {
		// TODO Auto-generated method stub
		vacationDAO.refuseVacation(seq, accept, reason);
	}

	@Override
	public Map<String, Object> paging(VacationVO vo) {
		return vacationDAO.paging(vo);
	}
}
