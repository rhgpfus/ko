package com.iot.sp.user.dao;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;

import com.iot.sp.user.dto.UserInfo;

@Service
public class UserDaoImpl extends SqlSessionDaoSupport implements UserDao {
	//SqlSessionDaoSupport -> resources에서 db-content.xml에서 
	//bean id="sqlSessionFactory" 가르킨다.
	@Override
	public UserInfo selectUser(UserInfo ui){
		return this.getSqlSession().selectOne("userinfo.SELECT_USER", ui);
	}

	@Override
	public UserInfo insertUser(UserInfo ui) {
		
		return null;
	}

	@Override
	public UserInfo updateUser(UserInfo ui) {
		
		return null;
	}

	@Override
	public UserInfo deleteUser(UserInfo ui) {
		
		return null;
	}
	
}
