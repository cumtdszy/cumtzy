package com.shop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.shop.entity.Tadmin;
import com.shop.entity.Tuser;
import com.shop.service.impl.AdminService;
import com.shop.service.impl.UserService;
import com.shop.util.JsonUtil;

import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.SimpleEmail;
/**
 * Controller层
 * 
 * @author 
 * 
 */
@Controller

public class UserController {

	@Resource
	private UserService userService;
	
	@Resource
	private AdminService adminService;
	
	@RequestMapping("/userLogin")
	public ModelAndView userLogin(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "loginpw", required = false) String loginpw,
			@RequestParam(value = "flag", required = false) String flag,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("username", username);
		map.put("loginpw", loginpw);
		Tuser user= userService.userLogin(map);
	
		request.getSession().getServletContext().setAttribute("key","value");
		ModelAndView mv = new ModelAndView();
		if(user!=null){
			request.setAttribute("user",user);
			mv.setViewName("index");
			mv.addObject("user", user);
			request.getSession().setAttribute("user", user);
			 if(flag!=null && flag.equals("Y")){  
	                Cookie cookie = new Cookie("cookie_user",username+"-"+loginpw);                  
	                cookie.setMaxAge(60*60*24*30); //cookie 保存30天  
	                response.addCookie(cookie);     
	        }
			 
		}else{
			mv.setViewName("login");
			mv.addObject("error","用户名或者密码错");
			request.setAttribute("error", "失败");
			
		}
		return mv;
	}
	

	@RequestMapping("/adminlogin")
	public ModelAndView adminlogin(
			@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "userPw", required = false) String userPw,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tadmin admin2=new Tadmin();
		admin2.setUserName(userName);
		admin2.setUserPw(userPw);
		Tadmin admin=adminService.adminLogin(admin2);
		ModelAndView mv = new ModelAndView();
	  
		if(admin!=null){
			request.setAttribute("admin",admin);
			mv.setViewName("admin/index");
			mv.addObject("admin", admin);
			request.getSession().setAttribute("admin", admin);
		}else{
			mv.setViewName("admin/login");
			mv.addObject("error","用户名或者密码错");
			request.setAttribute("error", "失败");
		}
		return mv;
	}
	
	
	
	@RequestMapping("/userMana")
	public ModelAndView userMana(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws IOException {	
		List<Tuser> userList=userService.userMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("userList",userList);
		mav.setViewName("admin/user/userMana");
		mav.addObject("userList", userList);
		return mav;
	}
	
	
	@RequestMapping("/userDelete")
	public ModelAndView userDelete(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		userService.userDelete(id);
		List<Tuser> userList=userService.userMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("userList",userList);
		mav.setViewName("admin/user/userMana");
		mav.addObject("userList", userList);
		return mav;
	}
	
	
	@RequestMapping("/userReg")
	public ModelAndView userReg(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "loginpw", required = false) String loginpw,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=new Tuser();
	    user.setAddress(address);
	    user.setPhone(phone);
	     user.setEmail(email);
	     user.setPhone(phone);
	     user.setUsername(username);
	    user.setLoginpw(loginpw);
	
	    userService.userAdd(user);
		ModelAndView mav = new ModelAndView();  
		mav.setViewName("login");
		return mav;
	}
	
	@RequestMapping("/userAdd")
	public ModelAndView userAdd(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "loginpw", required = false) String loginpw,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=new Tuser();
	    user.setAddress(address);
	    user.setPhone(phone);
	     user.setEmail(email);
	     user.setPhone(phone);
	     user.setUsername(username);
	    user.setLoginpw(loginpw);
	
	    userService.userAdd(user);
	    List<Tuser> userList=userService.userMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("userList",userList);
		mav.setViewName("admin/user/userMana");
		mav.addObject("userList", userList);
		return mav;
	}
	
	
	
	@RequestMapping("/userLogout")
	public ModelAndView userLogout(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		request.getSession().setAttribute("user", null);
	  
		ModelAndView mav = new ModelAndView();
	
		mav.setViewName("login");
		return mav;
	}
	

	@RequestMapping("/usermod")
	public ModelAndView usermod(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "email", required = false) String email,
			@RequestParam(value = "phone", required = false) String phone,
			@RequestParam(value = "address", required = false) String address,
			@RequestParam(value = "loginpw", required = false) String loginpw,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");
	
		 user.setAddress(address);
	    user.setPhone(phone);
	     user.setEmail(email);
	     user.setPhone(phone);
	     user.setUsername(username);
	    user.setLoginpw(loginpw);
		userService.usermod(user);
	    request.getSession().setAttribute("user",user);
	   
		ModelAndView mav = new ModelAndView();  
		mav.setViewName("myinfo");
		return mav;
	}
	
	
	
	@RequestMapping("/findpassoword")
	public ModelAndView findpassoword(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "email", required = false) String email,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) throws Exception {	
		response.setContentType("text/plain"); 
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Tuser user=new Tuser();
	    user.setUsername(username);
	    user.setEmail(email);
	    String result=userService.userfindpassword(user);
		if(result!=null&&!result.equalsIgnoreCase("")&&!result.equalsIgnoreCase("null")){
			
			StringBuffer url = new StringBuffer();
			StringBuilder builder = new StringBuilder();
			// 正文
			builder.append(
					"<html><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\" /></head><body>");
			url.append("<font color='red'>" + result + "</font>");
			builder.append("<br/><br/>");
			builder.append("<div>" + url + "</div>");
			builder.append("</body></html>");
			SimpleEmail sendemail = new SimpleEmail();
			sendemail.setHostName("smtp.163.com");// 指定要使用的邮件服务器
			sendemail.setAuthentication("cumtdszy@163.com", "dszy03");// 使用163的邮件服务器需提供在163已注册的用户名、密码
			sendemail.setCharset("UTF-8");
			try {
				sendemail.setCharset("UTF-8");
				sendemail.addTo(email);
				sendemail.setFrom("cumtdszy@163.com");
				sendemail.setSubject("找回密码");
				sendemail.setMsg(builder.toString());
				sendemail.send();
				System.out.println(builder.toString());
			} catch (EmailException e) {
				e.printStackTrace();
			}
			response.getWriter().println("你的密码为已结成功发送到邮箱");	
			
		}else{
			
			response.getWriter().println("获取密码失败");
		}
	    return null;
	}
	
	
	
	
}
