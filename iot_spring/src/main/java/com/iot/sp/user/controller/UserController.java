package com.iot.sp.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.iot.sp.user.dto.UserInfo;
import com.iot.sp.user.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService us;
	
	@RequestMapping("/main")
	public String init(HttpServletRequest request, ModelMap model, HttpSession session){
		String id = (String)session.getAttribute("ID");
		if(id!=null){
			model.addAttribute("userid", id);
			return "/user/main";
		}else{
			return "/user/login";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody ModelMap login(HttpServletRequest request, @RequestBody UserInfo reUser, ModelMap model, HttpSession session){
		UserInfo ui = us.getUser(reUser);
		if(ui==null){
			model.put("data", "False");
			model.put("url", "/user/login");
			model.put("msg", "로그인 실패");
		}else{
			session.setAttribute("ID", ui.getUserId());
			model.put("data", "True");
			model.put("url", "/user/main");
			model.put("msg", "로그인 성공");
		}
		return model;
	}
	
	
}