package com.test.servlet_test;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.test.DTO.VenderInfo;

public class FormServlet extends CommonServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{		
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		
		String result = "아이디:" + id + "비밀번호:" + pwd;
		System.out.println("아이디:" + id + "비밀번호:" + pwd);
		
		doProcess(response, result);
		
	}
		
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		Gson g = new Gson();
		HashMap hm = g.fromJson(request.getReader(), HashMap.class);
		
		hm.put("msg1","아이디: ");
		hm.put("msg2","비밀번호: ");
		hm.put("id",hm.get("id"));
		hm.put("pwd",hm.get("pwd"));
		
		String resultStr = g.toJson(hm);
		doProcess(response, resultStr);
		
	}
}
