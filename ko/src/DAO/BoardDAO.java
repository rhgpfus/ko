package DAO;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
				System.out.println("난 deleteBoard~ 에러나서 롤백함!");
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		}
		return false;
	}
	
	public List<HashMap> selectBoard(){
		try{
			List<HashMap> list = new ArrayList<HashMap>();
			String sql = "select * from board";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();
			while(rs.next()){
				HashMap hm = new HashMap();
				int colCount = rsmd.getColumnCount();
				for(int i=1;i<=colCount;i++){
					String colName = rsmd.getColumnName(i);
					hm.put(colName, rs.getString(colName));
				}
				list.add(hm);
			}
			DBConn2.closeCon();
			for(int i=1;i<list.size();i++){
				System.out.println(list.get(i));
			}
			return list;
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
		 
	}
	
	public static void main(String[] args){
		BoardDAO bdao = new BoardDAO();
		
		try {
			bdao.setConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
		bdao.insertBoard();
		bdao.updateBoard();
		bdao.deleteBoard();
		bdao.selectBoard();
		
		}
	
}
