package com.iot.sp.user.dao;

import java.util.List;
import java.util.Map;

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
		//파라메터로 받은 ui는 클래스가 UserInfo 임으로 user_sql.xml에서 parameterType="user" 받는타입을 user로 쓰는것이다.
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

	@Override
	public List<UserInfo> selectUserList(Map hm) {
		return this.getSqlSession().selectList("userinfo.SELECT_USER_LIST", hm);
	}
	
}
