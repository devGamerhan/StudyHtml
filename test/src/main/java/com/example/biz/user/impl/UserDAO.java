package com.example.biz.user.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.example.biz.user.UserVO;


@Repository("UserDAO")
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
	
	public void idCheck(HttpServletResponse response, String id) {
		PrintWriter out;
		response.setContentType("text/html; charset=utf-8");
		try {
			out = response.getWriter();
			List<Object> check = mybatis.selectList("UserDAOMapper.idCheck", id);
			
			
			if(check.isEmpty()) {
				out.print("사용 가능한 아이디 입니다.");
			}
			else {
				out.print("존재하는 아이디 입니다.");
			}
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}