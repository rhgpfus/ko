package com.iot.sp.common.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {

	@RequestMapping(value="/", method=RequestMethod.GET)
	public String home(HttpSession hs){
		if(hs.getAttribute("user")==null){
			return "/user/login";
		}
		return "/user/main";
	}
	
}
