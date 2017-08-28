package com.iot.sp.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.iot.sp.user.dao.UserDao;
import com.iot.sp.user.dto.UserInfo;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDao userDao;

	@Override
	public UserInfo getUser(UserInfo reUser) {
		UserInfo ui = (UserInfo) userDao.selectUser(reUser);
		//UserInfo reUser 화면에서 넘긴 유저.
		//UserInfo ui 데이터베이스에 있는 유저.
		if(ui!=null && ui.getUserPwd().equals(reUser.getUserPwd())){
			return ui;
		}
		return null;
	}
}
