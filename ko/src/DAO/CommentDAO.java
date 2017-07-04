package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Common.DBConn2;

public class CommentDAO {
	
	Connection con;
	Statement st;
	CommentDAO() throws ClassNotFoundException, SQLException{
		con = DBConn2.getCon();
	}
	public void setConnection() throws SQLException, ClassNotFoundException{
		con = DBConn2.getCon();
	}
	
	public boolean insertComment(){
		try{
			String sql = "insert into comment_info(content,ui_num,b_num,reg_datetime)";
			sql += " values('공지3',2,2,now())";
			st = con.createStatement();
			int result = st.executeUpdate(sql);
			if(result==1){
				con.commit();
				st.close(); //쿼리창을 꺼준다.
				st = null;
				return true;
			}
		}catch(Exception e){
			try{
				con.rollback();
				System.out.println("난 insertComment~ 에러나서 롤백함~");
			}catch(SQLException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean updateComment(){
		try{
			String sql = "update comment_info set content='악플이지롱' where num=6";
			st = con.createStatement();
			int result = st.executeUpdate(sql);
			if(result==1){
				con.commit();
				st.close();
				st = null;
				return true;
			}
		}catch(Exception e){
			try{
				con.rollback();
				System.out.println("난 updateComment~ 에러나서 롤백함~");
			}catch(SQLException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteComment(){
		try{
			String sql = "delete from comment_info where num=6";
			st = con.createStatement();
			int result = st.executeUpdate(sql);
			if(result==1){
				con.commit();
				st.close();
				st = null;
				return true;
			}
		}catch(Exception e){
			try{
				con.rollback();
				System.out.println("난 deleteComment~ 에러나서 롤백함~");
			}catch(SQLException e1){
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Map> selectComment(int boardNum)throws SQLException{
		
		String sql = "select content,ui_num,b_num,reg_Datetime,board_num from comment_info";
		sql += " where board_num=?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setInt(1, boardNum);
		
		ResultSet rs = ps.executeQuery();
		ArrayList commentlist = new ArrayList();
		while(rs.next()){
			HashMap hm = new HashMap();
			hm.put("content", rs.getString("content"));
			hm.put("ui_num", rs.getString("ui_num"));
			hm.put("b_num", rs.getString("b_num"));
			hm.put("reg_Datetime", rs.getString("reg_Datetime"));
			commentlist.add(hm);
		}
		rs.close();
		rs = null;
		ps.close();
		ps = null;
		return commentlist;
	}
	public void closeCon(){
		try{
			DBConn2.closeCon();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public static void main(String[] args){
		try {
			CommentDAO cdao = new CommentDAO();
			List<Map> commentList = cdao.selectComment(Integer.parseInt("3"));
			for(Map m2 : commentList){
				System.out.println(m2);
			}
			DBConn2.closeCon();
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		} 
		
	}	
}
