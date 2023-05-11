package com.example.biz.service;

import com.example.biz.user.UserVO;

public interface UserService {

	UserVO getUser(UserVO vo);
	void insertUser(UserVO vo);
}