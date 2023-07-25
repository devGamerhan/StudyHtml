package com.example.biz.user.impl;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.biz.user.UserService;
import com.example.biz.user.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO userDAO;
	
	@Override
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}

	@Override
	public void insertUser(UserVO vo) {
		userDAO.insertUser(vo);
	}

	@Override
	public void idCheck(HttpServletResponse response, String id) {
		userDAO.idCheck(response, id);
		
	}

	@Override
	public UserVO getMain(String id) {
		return userDAO.getMain(id);
	}
}
