package com.example.biz.board;

import java.util.List;

public interface ScheduleService {
	public void insertSchedule(ScheduleVO vo);
	public List<ScheduleVO> getScheduleList();
	public ScheduleVO getSchedule(ScheduleVO vo);
	public void updateSchedule(ScheduleVO vo);
	public void deleteSchedule(ScheduleVO vo);
}
