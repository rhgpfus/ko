package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Scanner;

import Common.DBConn2;

public class TestDAO{
	
	Connection con;
	PreparedStatement ps;
	Scanner scan = new Scanner(System.in);
	
	public boolean insertTest(){
		try {
			String writer = "2";
			con = DBConn2.getCon();
			String sql = "select * from user_info where num=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, writer);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				sql = "insert into test(title,content,writer,reg_date)";
				sql += " values(?,?,?,now())";
				ps = con.prepareStatement(sql);
				ps.setString(1, "게시물6");
				ps.setString(2, "내용6");
				ps.setString(3, writer);
				Date d = new Date();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				ps.setString(4, sdf.format(d));
				int result = ps.executeUpdate();
				if (result == 1) {
					return true;
				}
			}else{
				System.out.println("작성자와 넘버가" + writer + "으로 겹쳐지는 데이터는 없어.");
			}
			DBConn2.closeCon();
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}return false;
	}
	
	public List<Map> selectTest(){
		List<Map> testlist = new ArrayList<Map>();
		try{
			con = DBConn2.getCon();
			String sql = "select t.*,ui.id,ui.name from test as t,user_info as ui";
			sql += " where t.writer=ui.num";
			ps = con.prepareStatement(sql);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				Map hm = new HashMap();
				hm.put("num", rs.getString("num"));
				hm.put("title", rs.getString("title"));
				hm.put("content", rs.getString("content"));
				hm.put("writer", rs.getString("writer"));
				hm.put("reg_date", rs.getString("reg_date"));
				hm.put("id", rs.getString("id"));
				hm.put("name", rs.getString("name"));
				testlist.add(hm);
			}
			DBConn2.closeCon();
			return testlist;
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return null;
	}

	public boolean updateTest(){
		try{
			//이 게시물 이름은 중복되잖아!
			String num1 = "게시물1";
			String sql = "select * from test where title =?";
			ps = con.prepareStatement(sql);
			ps.setString(1, num1);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				con = DBConn2.getCon();
				sql = "update test set title=? where title=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, num1);
				ps.setString(2, "게시물2");
				int result = ps.executeUpdate();
				if(result==1){
					return true;
				}
			}else{
				System.out.println(num1 + "은 중복되잖아!");
			}
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deleteTest(){
		try{
			String ti = "게시물7";
			con = DBConn2.getCon();
			String sql = "select title from test where title=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, ti);
			ResultSet rs = ps.executeQuery();
			if(rs.next()){
				sql = "delete from test where ?=?";
				ps = con.prepareStatement(sql);
				ps.setString(1, "titie");
				ps.setString(2, "게시물7");
				int result = ps.executeUpdate();
				if(result==1){
					return true;
				}
			}else{
					System.out.println(ti + "은 없어!");
			}DBConn2.closeCon();
			
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return true;
	}
	
	public static void main(String[] args){
		TestDAO td = new TestDAO();
		
//		if(td.insertTest()){
//			System.out.println("오! 테스트테이블에 입력이 잘됫어!");
//		}
		
		if(td.updateTest()){
			System.out.println("오! 업데이트가 잘된거같아!");
		}
		
//		if(td.deleteTest()){
//			System.out.println("이건 지우는 기능이라네!");
//		}
		List<Map> list = td.selectTest();
		for(Map m : list){
			System.out.println(m);
		}
		
	}
}
