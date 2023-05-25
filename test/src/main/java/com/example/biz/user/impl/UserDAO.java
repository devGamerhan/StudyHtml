package com.example.biz.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.biz.user.UserVO;


@Repository("userDAO")
public class UserDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;

	public void insertUser(UserVO vo) {
		vo.setPhone(vo.getPhone1(),vo.getPhone2(),vo.getPhone3());
		mybatis.insert("UserDAOMapper.insertUser", vo);
	}

	public UserVO getUser(UserVO vo) {
		System.out.println("userDAO 의 getUser 실행");
		System.out.println("입력 id : "+vo.getId());
		System.out.println("입력 pw : "+vo.getPassword());

		return mybatis.selectOne("UserDAOMapper.getUser", vo);		
	}
}