package Common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class UserDAO2 {
	public List<HashMap> doselect(){
		List<HashMap> userlist = new ArrayList<HashMap>();
		try{
			HashMap<String,String> hm = new HashMap<String,String>();
			Scanner scan = new Scanner(System.in);
			Connection con = DBConn2.getCon();
			
			System.out.println("id를 입력해주세요.");
			hm.put("id", scan.nextLine());
			System.out.println("pwd를 입력해주세요.");
			hm.put("pwd", scan.nextLine());
			System.out.println("name를 입력해주세요.");
			hm.put("name", scan.nextLine());
			System.out.println("age를 입력해주세요.");
			hm.put("age", scan.nextLine());
			System.out.println("class_num를 입력해주세요.");
			hm.put("class_num", scan.nextLine());
			
			String sql = "insert into user_info(id,pwd,name,age,class_num)"
					+ "values(?,?,?,?,?);";
			
			PreparedStatement prestmt = con.prepareStatement(sql);//칼럼정보를 판에다 적는다.
			
			prestmt.setString(1, hm.get("id"));
			prestmt.setString(2, hm.get("pwd"));
			prestmt.setString(3, hm.get("name"));
			prestmt.setString(4, hm.get("age"));
			prestmt.setString(5, hm.get("class_num"));
			
			ResultSet rs = prestmt.executeQuery(); //ResultSet 컬럼정보를 읽는다. 실행.
			ResultSetMetaData rsmd = rs.getMetaData();//getMetaData컬럼정보를 주는아이.
			while (rs.next()){
				int colCount = rsmd.getColumnCount(); //5 = 컬럼개수(num,id,pwd,name,age)
				for(int i=1;i<=colCount;i++){
					String colName = rsmd.getColumnName(i);
					hm.put(colName, rs.getString(colName));
				}
				userlist.add(hm);
			}
			DBConn2.closeCon();
			return userlist;
		}catch(SQLException | ClassNotFoundException e){
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args){
		UserDAO2 ud2 = new UserDAO2();
		List<HashMap> userList = ud2.doselect();
		System.out.println(userList);
	}
}
	
