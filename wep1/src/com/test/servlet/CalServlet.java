package com.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	

public class CalServlet extends HttpServlet{
	
	
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest req, HttpServletResponse resq) throws IOException, ServletException{		
		req.setCharacterEncoding("UTF-8");
		int result = 0;
		String resultStr = "";
		try{
			int num1 = Integer.parseInt(req.getParameter("num1"));
			String op = req.getParameter("op");
			int num2 = Integer.parseInt(req.getParameter("num2"));
			if(op.equals("+")){
				result = num1 + num2;
			}else if(op.equals("-")){
				result = num1 - num2;
			}else if(op.equals("*")){
				result = num1 * num2;
			}else if(op.equals("/")){
				result = num1 / num2;
			}
			resultStr = "결과갑 : " + result;
		}catch(Exception e){
			e.printStackTrace();
			resultStr = "망햇어!";
		}
		doProcess(resq,"결과갑 : " + resultStr);
	}
	public void doPost(HttpServletRequest req, HttpServletResponse reqs) throws IOException{
		
	}

	
	public void doProcess(HttpServletResponse resq, String writeStr) throws IOException {
		resq.setContentType("text/html; charset = UTF-8");
		PrintWriter out = resq.getWriter();
		out.print(writeStr);
		
	}
}