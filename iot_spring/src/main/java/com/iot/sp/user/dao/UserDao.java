package com.iot.sp.user.dao;

import com.iot.sp.user.dto.UserInfo;

public interface UserDao {

	UserInfo selectUser(UserInfo ui);
	
	UserInfo insertUser(UserInfo ui);
	
	UserInfo updateUser(UserInfo ui);
	
	UserInfo deleteUser(UserInfo ui);
	
}
