package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import Common.DBConn2;

public class BoardDAO {
	
	Connection con;
	public void setConnection() throws SQLException, ClassNotFoundException{
		con = DBConn2.getCon();
	}
	
	
	public boolean insertBoard(){
		try{
			String sql = "insert into board(title,content,writer,reg_Date)values('게시판제목3','게시판내용3',3,now())";
			Statement st = con.createStatement();
			int result = st.executeUpdate(sql);
			if(result==1){
				con.commit();
				st.close();
				st = null;
				return true;
			}
		}catch(Exception e){
			try {
				con.rollback();
				System.out.println("난 insertBoard~ 에러나서 롤백함!");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}

	public boolean updateBoard(){
		try{
			String sql = "update board set title='으하하하하' where num='2'";
			Statement st = con.createStatement();
			int result = st.executeUpdate(sql);
			if(result==1){
				con.commit();
				st.close();
				st = null;
				return true;
			}
		}catch(Exception e){
			try {
				con.rollback();
				System.out.println("난 updateBoard~ 에러나서 롤백함!");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteBoard(){
		try{
			String sql = "delete from board where writer='3'";
			Statement st = con.createStatement();//createStatement 아무것도없는창 써주자마자 실행됨.
			int result = st.executeUpdate(sql);
			if(result==1){
				con.commit();
				st.close();     //쿼리 창을 꺼준다.
				st = null;
				return true;
			}
		}catch(Exception e){
			try {
				con.rollback();
				System.out.println("난 deleteBoard~ 에러나서 롤백함!");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public List<Map> selectBoard()throws SQLException{
		String sql = "select b_num, title, content, ui_num from board";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		ArrayList boardList = new ArrayList();
		while(rs.next()){
			HashMap hm = new HashMap();
			hm.put("b_num", rs.getString("b_num"));
			hm.put("title", rs.getString("title"));
			hm.put("content", rs.getString("content"));
			hm.put("ui_num", rs.getString("ui_num"));
			boardList.add(hm);
		}
		rs.close();
		rs = null;
		ps.close();
		ps = null;
		return boardList;
	}
	
	public static void main(String[] args){
		BoardDAO bdao = new BoardDAO();
		try {
			bdao.setConnection();
			List<Map> boardList = bdao.selectBoard();
			CommentDAO dao = new CommentDAO();
			for(Map m : boardList){
				System.out.println(m);
				List<Map> commentList = dao.selectComment(Integer.parseInt((String)m.get("board_num")));
				for(Map m2 : commentList){
					System.out.println(m2);
				}
			}
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	
}
