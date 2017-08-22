package com.test.common;

import java.sql.Connection;
import java.util.Properties;

public class Exam01 {

	public static void main(String[] aegs){
		Connection con;
		try{
			Properties pro = DBConn.getPro();
			Class.forName(pro.getProperty("db.driver"));
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
