package com.iot.sp.test;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
//자바에서 기본적으로 제공하는 
@RequestMapping("/test")
//부모 url!!
public class TestController {

	@RequestMapping("/1")
	//자식 url!!
	public String test(HttpServletRequest request, Model mm){
		String test = request.getParameter("test");
		mm.addAttribute("test", test);
		//test.jsp로 보 값을 맞출수있다.
		//localhost/sp/test/1?test=dqewe 이렇게 치면 getParameter("test")에 dqewe값이 들어온다.
		
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("test", "유후");
		mm.addAttribute("hm", hm);
		
		return "test";
	}

	@RequestMapping("/list")
	public String list(HttpServletRequest request, Model mm){
		return "test/list";
	}
	@RequestMapping("/writer")
	public String writer(HttpServletRequest request, Model mm){
		return "test/writer";
	}
	@RequestMapping("/modify")
	public String modify(HttpServletRequest request, Model mm){
		return "test/modify";
	}
	@RequestMapping("/delete")
	public String delete(HttpServletRequest request, Model mm){
		return "test/delete";
	}

	@RequestMapping("/3")
	public String test2(HttpServletRequest request, @RequestParam(value="test4",required=false) String test4){
		//@RequestParam(value="test4",required=false) String test4) 레스트 방식.
		//required=false 이게 없으면 400에러가 떨어진다. 있으면 test4=? 이걸 안적어도 에러가 나지 않는다.
		String test = request.getParameter("test");
		System.out.println(test);
		String test1 = request.getParameter("test1");
		System.out.println(test1);
		String test3 = request.getParameter("test3");
		System.out.println(test3);
		System.out.println(test4);
		return "test";
	}
	
}
