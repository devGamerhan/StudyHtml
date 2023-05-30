package com.example.biz.board.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.biz.board.VacationVO;
import com.example.biz.util.ConfirmParameter;
import com.example.biz.util.ListFromNameParameter;
import com.example.biz.util.RefuseParameter;


@Repository("VacationDAO")
public class VacationDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public void insertVacation(VacationVO vo) {
		mybatis.insert("VacationDAOMapper.insertVacation",vo);
	}
	
	public List<VacationVO> getVacationListFromName(HttpSession session, VacationVO vvo){
		if(vvo.getPage() == 0) {
			vvo.setPage(1);
		}
		vvo.setTotalCount(mybatis.selectOne("VacationDAOMapper.vacationCount",vvo));
		ListFromNameParameter vo = new ListFromNameParameter((String)session.getAttribute("name"), vvo.getPage());
		return mybatis.selectList("VacationDAOMapper.getVacationListFromName", vo);
	}

	public List<VacationVO> getVacationList(VacationVO vo) {
		if(vo.getPage() == 0) {
			vo.setPage(1);
		}
		return mybatis.selectList("VacationDAOMapper.getVacationList",vo);
	}
	
	public VacationVO getVacation(int seq) {
		return mybatis.selectOne("VacationDAOMapper.getVacation", seq);
	}

	public void confirmVacation(int seq, String accept) {
		ConfirmParameter vo = new ConfirmParameter(seq, accept);
		mybatis.update("VacationDAOMapper.confirmVacation",vo);
	}
	
	public void refuseVacation(int seq, String refuse, String reason) {
		RefuseParameter vo = new RefuseParameter(seq, refuse, reason);
		mybatis.update("VacationDAOMapper.refuseVacation",vo);
	}
	
	//페이징 처리
	public Map<String,Object> paging(VacationVO vo){
		if(vo.getPage() == 0) {
			vo.setPage(1);
		}
		vo.setTotalCount(mybatis.selectOne("VacationDAOMapper.vacationCount",vo));
		
		Map<String,Object> pageInfo = new HashMap<String, Object>();
		pageInfo.put("page", vo.getPage());
		pageInfo.put("totalCount", vo.getTotalCount());
		
		return pageInfo;
	}
}
