package com.example.biz.board.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.biz.board.ScheduleService;
import com.example.biz.board.ScheduleVO;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDAO scheduleDAO;
	
	@Override
	public void insertSchedule(ScheduleVO vo) {
		scheduleDAO.insertSchedule(vo);
	}

	@Override
	public void updateSchedule(ScheduleVO vo) {
		scheduleDAO.updateSchedule(vo);
	}

	@Override
	public void deleteSchedule(ScheduleVO vo) {
		scheduleDAO.deleteSchedule(vo);
	}

	@Override
	public List<ScheduleVO> getScheduleList() {
		return scheduleDAO.getScheduleList();
	}

	@Override
	public ScheduleVO getSchedule(ScheduleVO vo) {
		return scheduleDAO.getSchedule(vo);
	}

}
