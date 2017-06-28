package Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Exam2 {
	public List<String> getUserIDList(String name){
		List<String> userlist = new ArrayList<String>();
		try{
			Connection con = DBConn2.getCon();
			String sql = "select id,pwd,name,age from user"; //db에게 할말을 적는다.
			if(!name.equals("")){
			sql += " where name ='"+name+"'";
			}
			PreparedStatement prestmt = con.prepareStatement(sql); //내 할말을 판에다 적는다.
			ResultSet rs = prestmt.executeQuery();
			while (rs.next()){  //로우 개수만큼 실행.
				userlist.add(rs.getString("id") + "," + rs.getString(2) + "," + rs.getString(3)+ "," + rs.getString(4));
			}
			DBConn2.closeCon();
			return userlist;
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return null;
	}
	
	public boolean insertUser(){
		try{	
			Connection con = DBConn2.getCon(); //전화를 한다.
			String sql = "insert into user(id,pwd,name,age) values('red','red','청길동','40');";
			PreparedStatement prestmt = con.prepareStatement(sql); //판을 만들어서 넣어줌.
			int result = prestmt.executeUpdate(); //실행.
			DBConn2.closeCon(); //전화를 끊음.
			if(result==1){
				return true;
			}
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return false;
	}
	
	public boolean deletUser(int num){
		try{	
			Connection con = DBConn2.getCon(); //전화를 한다.
			String sql = "delete from user where num=" + num;
			PreparedStatement prestmt = con.prepareStatement(sql); //판을 만들어서 넣어줌.
			int result = prestmt.executeUpdate(); //실행.
			DBConn2.closeCon(); //전화를 끊음.
			if(result>=0){
				return true;
			}
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return false;
	}

	public boolean insertUser2(String[] str){
		try{	
			Connection con = DBConn2.getCon(); //전화를 한다.
			String sql = "insert into user(id,pwd,name,age) values('"+str[0]+"','"+str[1]+"','"+str[2]+"','"+str[3]+"')";
			PreparedStatement prestmt = con.prepareStatement(sql); //판을 만들어서 넣어줌.
			int result = prestmt.executeUpdate(); //실행.
			DBConn2.closeCon(); //전화를 끊음.
			if(result==1){
				return true;
			}
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return false;
	}
	
	public static void main(String[] args){
		Exam2 e = new Exam2();
//		if(e.insertUser()){
//			System.out.println("잘들어갓네요 유저테이블에!");
//		}
//		boolean isDel = e.deletUser(1);
//		if(isDel){
//			System.out.println("유저테이블에 잘 삭제가 됬네요!!");
//		}
		
//		String[] str = new String[4];
//		Scanner scan = new Scanner(System.in);
//		for(int i=0;i<4;i++){
//			str[i] = scan.nextLine();
//		}
//		e.insertUser2(str);
		
		List<String> userList = e.getUserIDList("");
		for(int i=0;i<userList.size();i++){
			System.out.println(userList.get(i));
		}
	}
}
