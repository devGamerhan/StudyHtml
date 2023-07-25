package com.example.biz.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.biz.board.ScheduleVO;

@Repository("ScheduleDAO")
public class ScheduleDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertSchedule(ScheduleVO vo) {
		mybatis.insert("ScheduleDAOMapper.insertSchedule",vo);
	}

	public ScheduleVO getSchedule(ScheduleVO vo) {
		return mybatis.selectOne("");
	}
	public List<ScheduleVO> getScheduleList() {
		return mybatis.selectList("ScheduleDAOMapper.getScheduleList");
	}

	public void updateSchedule(ScheduleVO vo) {
		
	}

	public void deleteSchedule(ScheduleVO vo) {
		
	}
}
