package com.test.servlet; 

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.test.DTO.UserInfo;
import com.test.service.UserService;


public class UserServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException{		
		req.setCharacterEncoding("UTF-8");
		
		String userNum = req.getParameter("usernum");
		String userId = req.getParameter("userid");
		String userPwd = req.getParameter("userpwd");
		String userName = req.getParameter("username");
		String age = req.getParameter("age");
		String address = req.getParameter("address");
		String hp1 = req.getParameter("hp1");
		String hp2 = req.getParameter("hp2");
		String hp3 = req.getParameter("hp3");
		UserInfo ui = new UserInfo();
		if(userNum!=null){
			ui.setUserNum(Integer.parseInt(userNum));
		}
		ui.setUserId(userId);
		ui.setUserPwd(userPwd);
		ui.setUserName(userName);
		if(age!=null){
			ui.setAge(Integer.parseInt(age));
		}
		ui.setAddress(address);
		ui.setHp1(hp1);
		ui.setHp2(hp2);
		ui.setHp3(hp3);
		
		
		String command = req.getParameter("command");
		if(command==null){
			return;
		}
		UserService us = new UserService();
		//UserService에 있는 insertUser(HashMap hm)이라는 함수를 호출하기 위해
		//UserService로 us 레퍼런스 변수를 생성.
		//userservlet은 userservice에 대해서 의존성을 가지고 있는 상태이다.
		if(command.equals("SIGNIN")){
			if(us.insertUser(ui)){
				doProcess(resq,"회원가입에 성공하셨습니다.");
			}else{
				doProcess(resq,"회원가입에 실패하셨습니다.");
			}
		}else if(command.equals("DELETE")){
			System.out.println("삭제할 번호 : " + userNum);
			boolean isDelete = us.deleteUser(ui);
			String result = "";
			if(isDelete){
				result = "삭제에 성공하셨습니다.";
			}else{
				result = "삭제에 실패하셨습니다.";
			}
			doProcess(resq, result);
		}else if(command.equals("UPDATE")){
			System.out.println("수정할 번호 : " + userNum);
			boolean isUpdate = us.updateUser(ui);
			String result = "";
			if(isUpdate){
				result = "수정에 성공하셨습니다.";
			}else{
				result = "수정에 실패하셨습니다.";
			}
			doProcess(resq, result);
		}else if(command.equals("SELECT")){
			System.out.println("이름 : " + userName);
			if(userName != null && !userName.equals("")){
				ui.setUserName("%" + userName + "%");
			}
			List<UserInfo> userList = us.selectUser(ui);
			String result = "번호{/}이름{/}아이디{/}나이{+}";
			result += "dis{/}en{/}en{/}en{+}";
			for(UserInfo ui2 : userList){        //userList사이즈만큼 m에 넌다.
				result += ui2.getUserNum() + "{/}" + ui2.getUserName() + "{/}" + ui2.getUserId() + "{/}" + ui2.getAge() + "{+}";
			}
			result = result.substring(0, result.length()-3);
			doProcess(resq, result);
			
		}else if(command.equals("LOGIN")){
			System.out.println("아이디 : " + userId);
			String result = us.loginUser(ui);
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