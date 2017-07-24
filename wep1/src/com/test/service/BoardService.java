package com.test.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.test.DTO.BoardInfo;
import com.test.common.DBConn;

public class BoardService {
	
	public boolean insertBoard(BoardInfo bi){
		Connection con = null;
		PreparedStatement ps = null;
		try{
			con = DBConn.getCon();
			String sql = "insert into board_info(boardtitle,boardcontent,boardpwd,boardwriter,boarddate)";
			sql += "values(?,?,?,?,now())";
			
			ps = con.prepareStatement(sql);
			ps.setString(1, bi.getBoardTitlem());
			ps.setString(2, bi.getBoardContent());
			ps.setString(3, bi.getBoardPwd());
			ps.setString(4, bi.getBoardWriter());
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
	
	public boolean deleteBoard(BoardInfo bi){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			con = DBConn.getCon();
			String sql = "delete from board_info";
			sql += " where boardnum=?";
			ps = con.prepareStatement(sql);
			if(bi.getBoardPwd().equals("")){
				return false;
			}
			ps.setInt(1,bi.getBoardNum());
			rs = ps.executeQuery();
			List boardList = new ArrayList();
			while(rs.next()) {
				String boardpwd = rs.getString("boardpwd");
				if(!boardpwd.equals(bi.getBoardPwd())){
					return false;
				}
			}
			System.out.println(boardList.get(0));
			System.out.println(bi.getBoardPwd());
//			int result = ps.executeUpdate();
//			if(result==1){
//				con.commit();
//				return true;
//			}
			return true;
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
	
	public List<BoardInfo> selectBoard(BoardInfo bi){
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			String sql = "select boardnum,boardtitle,boardcontent,boardpwd,boardwriter,boarddate from board_info";
			if(bi.getBoardTitlem()!=null && !bi.getBoardTitlem().equals("")){
				sql += " where boardtitle like ?";
			}
			con = DBConn.getCon();
			ps = con.prepareStatement(sql);
			if(bi.getBoardTitlem()!=null && !bi.getBoardTitlem().equals("")){
				ps.setString(1,bi.getBoardTitlem());
			}
			rs = ps.executeQuery();
			List boardList = new ArrayList();
			while(rs.next()){
				BoardInfo bi2 = new BoardInfo();
				bi2.setBoardNum(rs.getInt("boardnum"));
				bi2.setBoardTitle(rs.getString("boardtitle"));
				bi2.setBoardContent(rs.getString("boardcontent"));
				bi2.setBoardPwd(rs.getString("boardpwd"));
				bi2.setBoardWriter(rs.getString("boardwriter"));
				bi2.setBoardDate(rs.getString("boarddate"));
				boardList.add(bi2);
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
