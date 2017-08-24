package com.iot.sp.test;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//자바에서 기본적으로 제공하는 
@RequestMapping("/test")
public class TestController {

	@RequestMapping("/1")
	public String test(HttpServletRequest request){
		String test = request.getParameter("test");
		System.out.println(test);
		return "test";
	}
	
}
