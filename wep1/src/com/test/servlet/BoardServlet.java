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

import com.test.DTO.BoardInfo;
import com.test.service.BoardService;


public class BoardServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException{		
		req.setCharacterEncoding("UTF-8");
		
		String boardNum = req.getParameter("boardnum");
		String boardTitle = req.getParameter("boardtitle");
		String boardContent = req.getParameter("boardcontent");
		String boardPwd = req.getParameter("boardpwd");
		String boardWriter = req.getParameter("boardwriter");
		String boardDate = req.getParameter("boarddate");
		BoardInfo bi = new BoardInfo();
		if(boardNum!=null) {
			bi.setBoardNum(Integer.parseInt(boardNum));
		}
		bi.setBoardTitle(boardTitle);
		bi.setBoardContent(boardContent);
		bi.setBoardPwd(boardPwd);
		bi.setBoardWriter(boardWriter);
		bi.setBoardDate(boardDate);
		
		
		String command = req.getParameter("command");
		if(command==null){
			return;
		}
		BoardService bs = new BoardService();
		
		if(command.equals("INSERT")){
			System.out.println("제목 : " + boardTitle);
			if(bs.insertBoard(bi)){
				doProcess(resq,"게시판 입력에 성공하셨습니다.");
			}else{
				doProcess(resq,"게시판 입력에 실패하셨습니다.");
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
			System.out.println("삭제할 유저 번호 : " + boardNum);
			int boardInt = bs.deleteBoard(bi);
			if(boardInt==3){
				doProcess(resq,"게시판 삭제에 성공하셨습니다.");
			}else if(boardInt==1){
				doProcess(resq,"비밀번호를 입력하세요.");
			}else if(boardInt==2){
				doProcess(resq,"비밀번호가 틀립니다. 다시 입력하세요.");
			}else {
				doProcess(resq,"시스템 에러.");
			}
		}else if(command.equals("SELECT")){
			System.out.println("검색할 제목 : " + boardTitle);
			if(boardTitle!=null && !boardTitle.equals("")){
				bi.setBoardTitle("%" + boardTitle + "%");
			}
			List<BoardInfo> boardList = bs.selectBoard(bi);
			String result = "번호{/}제목{/}내용{/}글쓴이{/}날짜{+}";
			result += "dis{/}en{/}en{/}en{/}en{+}";
			for (BoardInfo bi2 : boardList) {
				result += bi2.getBoardNum() + "{/}" + bi2.getBoardTitlem() + "{/}" + bi2.getBoardContent() + "{/}" + bi2.getBoardWriter() + "{/}" + bi2.getBoardDate() + "{+}";
			}
			result = result.substring(0, result.length()-4);
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