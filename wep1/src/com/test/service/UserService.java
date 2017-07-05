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
	
	public boolean insertUser(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "insert into user_info(id,pwd,name,class_num,age)";
			sql += "values(?,?,?,?,?)";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("id"));
			ps.setString(2, hm.get("pwd"));
			ps.setString(3, hm.get("name"));
			ps.setString(4, hm.get("class_num"));
			ps.setString(5, hm.get("age"));
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
			String sql = "select num,id,pwd,name,age,class_num from user_info";
			if(hm.get("name")!=null){
				sql += "where name like ?";
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
					hm2.put("num", rs.getString("num"));
					hm2.put("id", rs.getString("id"));
					hm2.put("pwd", rs.getString("pwd"));
					hm2.put("name", rs.getString("name"));
					hm2.put("age", rs.getString("age"));
					hm2.put("class_num", rs.getString("class_num"));
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