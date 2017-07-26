package com.shop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
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
		String name="";
		String password="";
		try{   
		    Cookie[] cookies=request.getCookies();//读出用户硬盘上的Cookie，并将所有的Cookie放到一个cookie对象数组里面   
		    if(cookies!=null){   
		    for(int i=0;i<cookies.length;i++){   //用一个循环语句遍历刚才建立的Cookie对象数组
		        if(cookies[i].getName().equals("cookie_user")){  //保存用户名到cookies 
		        String value =  cookies[i].getValue();  
		        if(value!=null&&!"".equals(value)){  
		            name=cookies[i].getValue().split("-")[0];   
		            if(cookies[i].getValue().split("-")[1]!=null && !cookies[i].getValue().split("-")[1].equals("null")){  
		                password=cookies[i].getValue().split("-")[1];//这个是获取cookie的值，是字符串类型，然后用split切割，分隔符为-,
		                //返回值是字符串数组["a","b"]，那么[0]就是"a"也就是username.[1]就是"b"也就是pwd
		            }            
		           }  
		           }   
		   }   
		   }   
		}catch(Exception e){   
		   e.printStackTrace();   //若出错则打印出错内容，增加稳定性
		}   
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");//写出跳转页面的路径
		request.setAttribute("name",name);
		request.setAttribute("password",password);//设置为request全局变量， 用于请求的参数传递，一般是action到jsp界面
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
	
	
	@RequestMapping("/toproductEdit")//商品修改
	public ModelAndView toproductEdit(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/product/productEdit");

		String goodName=request.getParameter("goodName");//从request中拿出名字叫goodName的值，赋给了你刚才定义的变量？
		String goodMiaoshu=request.getParameter("goodMiaoshu");
		String goodPic=request.getParameter("goodPic");
		String price=request.getParameter("price");
		String cunkun=request.getParameter("cunkun");
		String goodID=request.getParameter("goodID");
		String categoryID=request.getParameter("categoryID");
		
		request.setAttribute("goodName",goodName);////设置为request全局变量， 用于请求的参数传递，一般是action到jsp界面
		request.setAttribute("goodMiaoshu",goodMiaoshu);
		request.setAttribute("goodPic",goodPic);
		request.setAttribute("price",price);
		request.setAttribute("cunkun",cunkun);
		request.setAttribute("cunkun",cunkun);
		request.setAttribute("goodID",goodID);
		request.setAttribute("categoryID",categoryID);
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
	
	
	@RequestMapping("/tocartmod")//购物车修改
	public ModelAndView tocartmod(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		String goodID=request.getParameter("goodID");
		String goodName=request.getParameter("goodName");
		String  num=request.getParameter("num");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("cartmod");
		request.setAttribute("goodID",goodID);
		request.setAttribute("goodName",goodName);
		request.setAttribute("num",num);
		return mav;
	}
	
	
	@RequestMapping("/topingjia")
	public ModelAndView topingjia(HttpServletRequest request,
			HttpServletResponse response, HttpSession session)
			throws IOException {
		String goodID=request.getParameter("goodID");
		String orderID=request.getParameter("orderID");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("pingjia");
		
		request.setAttribute("goodID",goodID);
		request.setAttribute("orderID",orderID);
		
		
		return mav;
	}
}
