package DAO;

import java.sql.Connection;
import java.sql.SQLException;

import Common.DBConn2;

public class CommentDAO {
	
	Connection con;

	public void setConnection() throws SQLException, ClassNotFoundException{
		con = DBConn2.getCon();
	}
	
	public boolean insertComment(){
		String sql = "insert into comment_info(content,ui_num,b_num,reg_datetime)";
		sql += " values('공지3',3,3,now())";
		
	}
	
	public boolean updateComment(){
		
	}
	
	public boolean deleteComment(){
		
	}
	
	public List<HashMap> selectComment(){
		
	}
}
