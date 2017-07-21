package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.DTO.UserInfo;
import com.test.common.DBConn;

public class UserService {
	
	public String checkPwd(String pwd1, String pwd2){
		if(pwd1.equals(pwd2)){
			return "로그인 성공";
		}
		return "비밀번호 틀렸어 임마!";
	}
	public String loginUser(UserInfo ui){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "select userpwd from user_info where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1,ui.getUserId());
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String userpwd = rs.getString("userpwd"); //db에 저장되어있는 pwd를 가져온다.
				return checkPwd(userpwd,ui.getUserPwd());
			}
		}catch(Exception e){
			
		}
		return "그런 아이디 없다잖아!!";
	}
	
	public boolean insertUser(UserInfo ui){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "insert into user_info(userid,userpwd,username,age,address,hp1,hp2,hp3)";
			sql += "values(?,?,?,?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, ui.getUserId());
			ps.setString(2, ui.getUserPwd());
			ps.setString(3, ui.getUserName());
			ps.setInt(4, ui.getAge());
			ps.setString(5, ui.getAddress());
			ps.setString(6, ui.getHp1());
			ps.setString(7, ui.getHp2());
			ps.setString(8, ui.getHp3());
			int result = ps.executeUpdate();
			if(result==1){
				con.commit();
				return true;
			}
		}catch(SQLException | ClassNotFoundException e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try{
				ps.close();
				DBConn.closeCon();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean deleteUser(UserInfo ui){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "delete from user_info ";
			sql += "where usernum=?";
			
			ps = con.prepareStatement(sql);
			ps.setInt(1,ui.getUserNum());
			int result = ps.executeUpdate();
			if(result==1){
				con.commit();
				return true;
			}
		}catch(SQLException | ClassNotFoundException e){
			try{
				con.rollback();
			}catch(SQLException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try{
				ps.close();
				DBConn.closeCon();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public boolean updateUser(UserInfo ui){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "update user_info set username=?,userid=?,age=? where usernum=?;";
			
			ps = con.prepareStatement(sql);
			ps.setString(1,ui.getUserName());
			ps.setString(2,ui.getUserId());
			ps.setInt(3,ui.getAge());
			ps.setInt(4,ui.getUserNum());
			int result = ps.executeUpdate();
			if(result==1){
				con.commit();
				return true;
			}
		}catch(SQLException | ClassNotFoundException e){
			try{
				con.rollback();
			}catch(SQLException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}finally{
			try{
				ps.close();
				DBConn.closeCon();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return false;
	}
	
	public List<UserInfo> selectUser(UserInfo ui){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select usernum,userid,userpwd,username,age,address,hp1,hp2,hp3 from user_info";
			if(ui.getUserName()!=null && !ui.getUserName().equals("")){
				sql += " where username like ?";
			}
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(ui.getUserName()!=null && !ui.getUserName().equals("")){
				ps.setString(1,ui.getUserName());
			}
			rs = ps.executeQuery();
			List userList = new ArrayList();
			while(rs.next()){  //DB꺼
				UserInfo ui2 = new UserInfo();
				ui2.setUserNum(rs.getInt("usernum"));
				ui2.setUserId(rs.getString("userid"));
				ui2.setUserPwd(rs.getString("userpwd"));
				ui2.setUserName(rs.getString("username"));
				ui2.setAge(rs.getInt("age"));
				ui2.setAddress(rs.getString("address"));
				ui2.setHp1(rs.getString("hp1"));
				ui2.setHp2(rs.getString("hp2"));
				ui2.setHp3(rs.getString("hp3"));
				userList.add(ui2);
			}
			con.commit();
			return userList;
		}catch(SQLException | ClassNotFoundException e){
			try{
				con.rollback();
			}catch(SQLException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		finally{
			try{
				rs.close();
				ps.close();
				DBConn.closeCon();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return null;
	}

}
