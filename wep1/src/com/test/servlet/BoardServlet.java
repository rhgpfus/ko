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

import com.test.service.BoardService;


public class BoardServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException{		
		req.setCharacterEncoding("UTF-8");
		
		String command = req.getParameter("command");
		if(command==null){
			return;
		}
		BoardService bs = new BoardService();
		
		if(command.equals("INSERT")){
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String userNum = req.getParameter("num");
			System.out.println("제목 : " + title + "내용 : " + content + "글쓴이 : " + userNum);
			
			HashMap hm = new HashMap();
			hm.put("title", title);
			hm.put("content", content);
			hm.put("num", userNum); //키값이 user_num 안에 userNum은 내가 브라우저에서 입력한 값을 넣은것!
			
			if(bs.insertBoard(hm)){
				doProcess(resq,"게시판 입력 완료!");
			}else{
				doProcess(resq,"게시판 입력 실패!");
			}
		}else if(command.equals("UPDATE")){
			String userNum = req.getParameter("num");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			System.out.println("수정할 유저 번호 : " + userNum + "수정할 제목 : " + title + "수정할 내용 : " + content);
			
			HashMap hm = new HashMap();
			hm.put("num", userNum);
			hm.put("title", title);
			hm.put("content", content);
			
			if(bs.updateBoard(hm)){
				doProcess(resq,"수정 완료!");
			}else{
				doProcess(resq,"수정 실패!");
			}
		}else if(command.equals("DELETE")){
			String userNum = req.getParameter("num");
			System.out.println("삭제할 유저 번호 : " + userNum);
			
			HashMap hm = new HashMap();
			hm.put("num", userNum);
			
			if(bs.deleteBoard(hm)){
				doProcess(resq,"삭제 완료!");
			}else{
				doProcess(resq,"삭제 실패!");
			}
		}else if(command.equals("SELECT")){
			String title = req.getParameter("title");
			System.out.println("검색할 제목 : " + title);
			
			HashMap hm = new HashMap();
			hm.put("title", title);
			if(title!=null && !title.equals("")){
				hm.put("title", "%"+title+"%"); 
			}else{
				hm.put("title", title);
			}
			List<Map> boardList = bs.selectBoard(hm);
			String result = "<script>";
			result += "function deleteBoard(num){";
			result += "location.href='*.board?command=DELETE&num=' + num;";
			result += "}";
			result += "</script>";
			result += "<form action='/wep1/*.board'>";
			result += "이름 : <input type='text' name='title' id='title'/> <input type='submit' value='검색'/>";
			result += "<input type='hidden' name='command' value='SELECT'/>";
			result += "</form>";
			result += "<table border='1'>";
			result += "<tr>";
			result += "<td>유저번호</td>";
			result += "<td>제목</td>";
			result += "<td>내용</td>";
			result += "<td>글쓴이</td>";
			result += "<td>글쓴 날짜와 시간</td>";
			result += "<td>삭제버튼</td>";
			result += "</tr>";
			for (Map m : boardList) {
				result += "<tr align='center'>";
				result += "<td>" + m.get("num") + "</td>";
				result += "<td>" + m.get("title") + "</td>";
				result += "<td>" + m.get("content") + "</td>";
				result += "<td>" + m.get("writer") + "</td>";
				result += "<td>" + m.get("reg_date") + "</td>";
				result += "<td><input type='button' value='삭제' onclick='deleteBoard(" + m.get("num") + ")'/></td>";
				result += "</tr>";
			}
			result += "</table>";
			doProcess(resq, result);
		}
	}
	public void doPost(HttpServletRequest req, HttpServletResponse reqs) throws IOException{
		
	}

	
	public void doProcess(HttpServletResponse resq, String writeStr) throws IOException {
		resq.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resq.getWriter();
		out.print(writeStr);
		
	}
}