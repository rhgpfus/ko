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
		
		String commend = req.getParameter("commend");
		if(commend==null){
			return;
		}
		BoardService bs = new BoardService();
		
		if(commend.equals("INSERT")){
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			String userNum = req.getParameter("user_num");
			System.out.println("제목 : " + title + "내용 : " + content + "글쓴이 : " + userNum);
			
			HashMap hm = new HashMap();
			hm.put("title", title);
			hm.put("content", content);
			hm.put("user_num", userNum); //키값이 user_num 안에 userNum은 내가 브라우저에서 입력한 값을 넣은것!
			
			if(bs.insertBoard(hm)){
				doProcess(resq,"게시판 입력 완료!");
			}else{
				doProcess(resq,"게시판 입력 실패!");
			}
		}else if(commend.equals("UPDATE")){
			String userNum = req.getParameter("user_num");
			String title = req.getParameter("title");
			String content = req.getParameter("content");
			System.out.println("수정할 유저 번호 : " + userNum + "수정할 제목 : " + title + "수정할 내용 : " + content);
			
			HashMap hm = new HashMap();
			hm.put("user_num", userNum);
			hm.put("title", title);
			hm.put("content", content);
			
			if(bs.updateBoard(hm)){
				doProcess(resq,"수정 완료!");
			}else{
				doProcess(resq,"수정 실패!");
			}
		}else if(commend.equals("DELETE")){
			String userNum = req.getParameter("user_num");
			System.out.println("삭제할 유저 번호 : " + userNum);
			
			HashMap hm = new HashMap();
			hm.put("user_num", userNum);
			
			if(bs.deleteBoard(hm)){
				doProcess(resq,"삭제 완료!");
			}else{
				doProcess(resq,"삭제 실패!");
			}
		}else if(commend.equals("SELECT")){
			String title = req.getParameter("title");
			System.out.println("검색할 제목 : " + title);
			
			HashMap hm = new HashMap();
			hm.put("title", title);
			if(title!=null && !title.equals("")){
				hm.put("title", "%"+title+"%"); 
			}
			List<Map> boardList = bs.selectBoard(hm);
			String result = "";
			for(Map m : boardList){
				result += m.toString();
			}
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