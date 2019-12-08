package com.briup.Hospital.Web.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.Hospital.Service.RoleService;
import com.briup.Hospital.Service.UserService;
import com.briup.Hospital.bean.Role;
import com.briup.Hospital.bean.User;
import com.briup.Hospital.util.ServiceException;

@Controller
public class UserController {

	@Autowired
	public UserService userService;
	@Autowired
	public RoleService roleService;
	
	@RequestMapping("/")
	public String hello() {
		return "index";
	}
	
	@RequestMapping(value="/login_before")
	public String login_before(){
		
		return "login";
	}
	
	@RequestMapping(value="/login_behind")
	public String login_behind(String name,String password ,HttpSession session,HttpServletRequest request,HttpServletResponse response) throws ServiceException{
		User login= (User) session.getAttribute("user");
		if(login==null) {
			login = userService.login(name, password);
		}
		System.out.println(request.getServletPath());
		System.out.println("SessionId=="+request.getSession().getId());
		Role role = roleService.findRoleByName(login.getUsername());
		request.getSession().setAttribute("name",request.getRemoteAddr()+name);
		
		//登录成功后，保存名称为JSESSIONID的id的cookie，值为session的id
		Cookie c = new Cookie("JSESSIONID",request.getSession().getId());
			c.setMaxAge(60*100000);
			c.setPath("/");
			response.addCookie(c);
			System.out.println(c.getName()+":"+c.getValue());
		session.setAttribute("user", login);
		session.setAttribute("role", role);
		if(login==null) {
			return "login";
		}
		return "index";
	}
	
	@RequestMapping("/user/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:/login_before";
	}
}
