package com.iot.sp.user.service;

import java.util.List;
import java.util.Map;

import com.iot.sp.user.dto.UserInfo;

public interface UserService {

	public UserInfo getUser(UserInfo reUser);
	
	public List<UserInfo> getUserList(Map hm);
}
