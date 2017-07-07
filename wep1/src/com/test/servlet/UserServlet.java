package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.service.UserService;

public class UserServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException{		
		req.setCharacterEncoding("UTF-8");
		
		String id1 = req.getParameter("id");
		String pass1 = req.getParameter("pass");
		String color1 = req.getParameter("s_color");
		System.out.println("아이디 : " + id1 + "비밀번호 : " + pass1 + "좋아하는색 : " + color1);
//		String op = req.getParameter("op");
//		System.out.println("op에서 내가 던진 연산자 : " + op);
//		String id1 = req.getParameter("id");
//		String pwd1 = req.getParameter("pwd");
//		System.out.println("내가 입력한 아이디 : " + id1 + "내가 입력한 패스워드 : " + pwd1);
		
		String command = req.getParameter("command");
		//html화면에서 던진 값을 각각 String변수로 받기시작.
		
		if(command==null){
			return;
		}
		
		UserService us = new UserService();
		//UserService에 있는 insertUser(HashMap hm)이라는 함수를 호출하기 위해
		//UserService로 us 레퍼런스 변수를 생성.
		
		if(command.equals("SIGNIN")){
			String id = req.getParameter("id");
			String pwd = req.getParameter("pwd");
			String name = req.getParameter("name");
			String class_num = req.getParameter("class_num");
			String age = req.getParameter("age");
			
			System.out.println(id + "," + pwd + "," + name + "," + class_num + ", " + age);
			//위에서 받은 String 변수를 출력해줌(Tomcat콘솔창에)
			
			HashMap hm = new HashMap(); //해쉬맵 생성.
			
			hm.put("id", id);  //html화면에서 던진 id값을 "id"라는 키로 해쉬맵에 저장.나머지도 똑같다.
			hm.put("pwd", pwd);
			hm.put("name", name);
			hm.put("class_num", class_num);
			hm.put("age", age);
			
			if(us.insertUser(hm)){
				doProcess(resq,"저장잘됫군멍ㅁ낭");
			}else{
				doProcess(resq,"똑바로입력행ㄹ!!!");
			}
		}else if(command.equals("DELETE")){
			String user_num = req.getParameter("user_num");
			System.out.println("삭제할 번호 : " + user_num);
			
			HashMap hm = new HashMap();
			hm.put("user_num", user_num);
			if(us.deleteUser(hm)){
				doProcess(resq,"딜리트꺼~잘지워졋군");
			}else{
				doProcess(resq,"딜리트꺼~똑바로입력행!!!");
			}
		}else if(command.equals("UPDATE")){
			String user_num = req.getParameter("user_num");
			String name = req.getParameter("name");
			String class_num = req.getParameter("class_num");
			String age = req.getParameter("age");
			System.out.println("수정할 유저번호 : " + user_num);
			
			HashMap hm = new HashMap();
			hm.put("user_num", user_num);
			hm.put("name", name);
			hm.put("class_num", class_num);
			hm.put("age", age);
			if(us.updateUser(hm)){
				doProcess(resq,"업뎃이 잘됫구만");
			}else{
				doProcess(resq,"안된거같은디;;");
			}
		}else if(command.equals("SELECT")){
			String name = req.getParameter("name");
			System.out.println("검색 : " + name);
			
			HashMap hm = new HashMap();
			hm.put("name", name);
			if(name!=null && !name.equals("")){
				hm.put("name", "%"+name+"%");
			}
			List<Map> userList = us.selectUser(hm);
			String result = "";
			for(Map m : userList){
				result += m.toString();
			}
			doProcess(resq, result);
		}		
	}
		
	
	public void dePost(HttpServletRequest req, HttpServletResponse reqs) throws IOException{
		
	}

	
	public void doProcess(HttpServletResponse resq, String writeStr) throws IOException {
		resq.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resq.getWriter();
		out.print(writeStr);
		
	}
}