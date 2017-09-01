package com.iot.sp.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
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
	public String init(HttpServletRequest request, ModelMap model, 
			HttpSession session, @CookieValue(value="id", required=false)Cookie ck){
		UserInfo user = (UserInfo)session.getAttribute("user");
		if(user!=null){
			model.addAttribute("userid", user.getUserId());
			return "/user/main";
		}else{
			String userId = "";
			if(ck!=null){
				userId = ck.getValue();
			}
			model.addAttribute("userId", userId);
			return "/user/login";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public @ResponseBody ModelMap login(HttpServletRequest request, 
			@RequestBody UserInfo user, ModelMap model, HttpSession session,
			HttpServletResponse response,
			@CookieValue(value="id", required=false)Cookie ck){
		UserInfo ui = us.getUser(user);
		if(ui==null){
			model.put("data", "False");
			model.put("url", "/user/login");
			model.put("msg", "로그인 실패");
		}else{
			if(user.isSaveId()){
				if(ck==null){
					ck = new Cookie("id", user.getUserId());
					ck.setMaxAge(60*60*24*30);
				}else{
					System.out.println(ck.getMaxAge());
					ck.setMaxAge(60*60*24*30);
				}
				response.addCookie(ck);
				System.out.println(ck);
			}
			session.setAttribute("user", ui);
			model.put("data", "True");
			model.put("url", "/user/main");
			model.put("msg", "로그인 성공");
		}
		return model;
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String goList(HttpServletRequest request){
		return "/user/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.POST)
	public @ResponseBody ModelMap getUserList(HttpServletRequest request, @RequestBody Map hm, ModelMap model, HttpSession session){
		List<UserInfo> userList = us.getUserList(hm);
		model.put("userList", userList);
		return model;
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session){
		session.invalidate();
		return "redirect:/user/main";
	}
}
