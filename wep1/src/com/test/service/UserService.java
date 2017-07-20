package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.common.DBConn;

public class UserService {
	
	public String checkPwd(String pwd1, String pwd2){
		if(pwd1.equals(pwd2)){
			return "로그인 성공";
		}
		return "비밀번호 틀렸어 임마!";
	}
	public String loginUser(HashMap<String, String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "select userpwd from user_info where userid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("userid"));
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				String userpwd = rs.getString("userpwd"); //db에 저장되어있는 pwd를 가져온다.
				return checkPwd(userpwd, hm.get("userpwd"));
			}
		}catch(Exception e){
			
		}
		return "그런 아이디 없다잖아!!";
	}
	
	public boolean insertUser(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "insert into user_info(userid,userpwd,username,age,address,hp1,hp2,hp3)";
			sql += "values(?,?,?,?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("id"));
			ps.setString(2, hm.get("pwd"));
			ps.setString(3, hm.get("name"));
			ps.setString(4, hm.get("age"));
			ps.setString(5, hm.get("address"));
			ps.setString(6, hm.get("hp1"));
			ps.setString(7, hm.get("hp2"));
			ps.setString(8, hm.get("hp3"));
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
	
	public boolean deleteUser(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "delete from user_info ";
			sql += "where num=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("user_num"));
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
	
	public boolean updateUser(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "update user_info set name=?,class_num=?,age=? where num=?;";
			
			ps = con.prepareStatement(sql);
			ps.setString(1,hm.get("name"));
			ps.setString(2,hm.get("class_num"));
			ps.setString(3,hm.get("age"));
			ps.setString(4,hm.get("user_num"));
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
	
	public List<Map> selectUser(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select usernum,userid,userpwd,username,age,address,hp1,hp2,hp3 from user_info";
			if(hm.get("name")!=null){
				sql += " where usename like ?";
			}
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(hm.get("name")!=null){
				ps.setString(1,hm.get("name"));
			}
			rs = ps.executeQuery();
			ArrayList userList = new ArrayList();
			while(rs.next()){
					HashMap hm2 = new HashMap();
					hm2.put("num", rs.getString("usernum"));
					hm2.put("id", rs.getString("userid"));
					hm2.put("pwd", rs.getString("userpwd"));
					hm2.put("name", rs.getString("username"));
					hm2.put("age", rs.getString("age"));
					hm2.put("address", rs.getString("address"));
					hm2.put("hp1", rs.getString("hp1"));
					hm2.put("hp2", rs.getString("hp2"));
					hm2.put("hp3", rs.getString("hp3"));
					userList.add(hm2);
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
