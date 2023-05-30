package com.example.biz.user;

import javax.servlet.http.HttpServletResponse;

public interface UserService {

	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
	public void idCheck(HttpServletResponse response, String id);
}