package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.Tcategory;

/**
 * Controller层
 * 
 * @author
 * 
 */
@Controller
public class HelloController {
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("login");

		return mav;
	}

	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("index");

		return mav;
	}

	@RequestMapping("/register")
	public ModelAndView register(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("register");

		return mav;
	}
	
	

	@RequestMapping("/about")
	public ModelAndView about(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("about");

		return mav;
	}
	
	
	@RequestMapping("/toadminlogin")
	public ModelAndView toadminlogin(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/login");

		return mav;
	}
	
	
	@RequestMapping("/m1")
	public ModelAndView m1(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/m1");

		return mav;
	}
	
	
	@RequestMapping("/m2")
	public ModelAndView m12(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/m2");

		return mav;
	}
	
	@RequestMapping("/m3")
	public ModelAndView m3(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/m3");

		return mav;
	}
	
	@RequestMapping("/toueradd")
	public ModelAndView toueradd(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/user/userAdd");

		return mav;
	}
	
	
	@RequestMapping("/tocategoryadd")
	public ModelAndView tocategoryadd(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/category/categoryAdd");

		return mav;
	}
	
	
	@RequestMapping("/totree")
	public ModelAndView totree(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/category/tree");

		return mav;
	}
	
	
	@RequestMapping("/toproductadd")
	public ModelAndView toproductadd(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/productAdd");

		return mav;
	}
	
	@RequestMapping("/myinfo")
	public ModelAndView myinfo(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("myinfo");

		return mav;
	}
	
	
	
	@RequestMapping("/lookforpassword")
	public ModelAndView lookforpassword(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("lookforpassword");
		return mav;
	}
	
	
	@RequestMapping("/toproductEdit")
	public ModelAndView toproductEdit(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/productEdit");

		return mav;
	}
	
	
	@RequestMapping("/tofenxi")
	public ModelAndView tofenxi(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("fenxi");

		return mav;
	}
	
	
	@RequestMapping("/cart")
	public ModelAndView cart(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cart");
		return mav;
	}
	
	
	@RequestMapping("/tocartmod")
	public ModelAndView tocartmod(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cartmod");
		return mav;
	}
	
	
	@RequestMapping("/topingjia")
	public ModelAndView topingjia(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pingjia");
		return mav;
	}
}
