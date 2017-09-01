package com.iot.sp.test;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.sp.user.service.UserService;
import com.iot.sp.user.service.UserServiceImpl;

@Controller
//자바에서 기본적으로 제공하는 
@RequestMapping("/test")
//부모 url!!
public class TestController {

	private static UserService us = new UserServiceImpl();
	
	@RequestMapping("/1") //자식 url!!
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
	
	@RequestMapping(value="/test1" , method=RequestMethod.POST)
	public @ResponseBody ModelMap postTest(ModelMap map, @RequestBody Map hm){
		map.put("test", "test");
		return map;
	}
	
	@RequestMapping(value="/test1" , method=RequestMethod.GET)
	public @ResponseBody ModelMap getTest(ModelMap map, @RequestParam(value="exam") String exam){
		System.out.println(exam);
		map.put("test", exam);
		return map;
	}

	@RequestMapping("/t")
	public String list(HttpServletRequest request, Model mm){
		return "test";
	}
	
	@RequestMapping("/test")
	public @ResponseBody ModelMap test(ModelMap map, @RequestBody Map hm){
		map.put("test", "test");
		return map;
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
