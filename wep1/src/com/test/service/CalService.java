package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import service.DBConn;

public class CalService {
	
	public boolean insertBoard(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "insert into board(title,content,writer,reg_date)";
			sql += "values(?,?,?,now())";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("title"));
			ps.setString(2, hm.get("content"));
			ps.setString(3, hm.get("num"));  //여기 user_num은 BoardServlet에서 hm에 넣은 user_num의 값을 가져와서 넣는것!
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
	
	public boolean deleteBoard(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "delete from board";
			sql += " where num=?";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, hm.get("num"));
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
	
	public boolean updateBoard(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "update board set title=?,content=? where num=?;";
			
			ps = con.prepareStatement(sql);
			ps.setString(1,hm.get("title"));
			ps.setString(2,hm.get("content"));
			ps.setString(3,hm.get("num"));
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
	
	public List<Map> selectBoard(HashMap<String,String> hm){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select num,title,content,writer,reg_date from board";
			if(!hm.get("title").equals("")){
				sql += " where title like ?";
			}
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(!hm.get("title").equals("")){
				ps.setString(1,hm.get("title"));
			}
			rs = ps.executeQuery();
			ArrayList boardList = new ArrayList();
			while(rs.next()){
					HashMap hm2 = new HashMap();
					hm2.put("num", rs.getString("num"));
					hm2.put("title", rs.getString("title"));
					hm2.put("content", rs.getString("content"));
					hm2.put("writer", rs.getString("writer"));
					hm2.put("reg_date", rs.getString("reg_date"));
					boardList.add(hm2);
				}
				con.commit();
				return boardList;
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
