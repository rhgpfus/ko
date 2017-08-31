package com.iot.sp.user.dao;

import java.util.List;
import java.util.Map;

import com.iot.sp.user.dto.UserInfo;

public interface UserDao {

	UserInfo selectUser(UserInfo ui);
	
	UserInfo insertUser(UserInfo ui);
	
	UserInfo updateUser(UserInfo ui);
	
	UserInfo deleteUser(UserInfo ui);
	
	List<UserInfo> selectUserList(Map hm);
}
