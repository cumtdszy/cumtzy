package com.shop.controller;

import java.util.List;
import java.util.Vector;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.TOrderItem;
import com.shop.entity.Torder;
import com.shop.entity.Tuser;
import com.shop.service.impl.OrderService;

/**
 * Controller层
 * 
 * @author 
 * 
 */
@Controller
public class OrderController {

	
	@Resource
	private OrderService orderService;
	@RequestMapping("/orderMana")
	public ModelAndView orderMana(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		List<Torder> orderList=orderService.orderMana();
		ModelAndView mav = new ModelAndView();
		request.setAttribute("orderList",orderList);
		mav.setViewName("admin/order/orderMana");
		mav.addObject("orderList", orderList);
		return mav;
	}
	
	
	@RequestMapping("/orderAll")
	public ModelAndView orderAll(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "loginpw", required = false) String loginpw,
			@RequestParam(value = "flag", required = false) String flag,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");//存放信息，通过session获取user
		List<Torder> orderList=orderService.orderAll(user.getUserID());//从service层获取表
	
		ModelAndView mav = new ModelAndView();
		request.setAttribute("orderList",orderList);
		mav.setViewName("myorder");
		mav.addObject("orderList", orderList);
		return mav;
	}
	
	
	@RequestMapping("/orderDel")
	public ModelAndView orderDel(
			@RequestParam(value = "id", required = false) String id,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		orderService.orderDel(id);
		ModelAndView mav = new ModelAndView();
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		List<Torder> orderList=orderService.orderMana();
		request.setAttribute("orderList",orderList);
		mav.setViewName("admin/order/orderMana");
		mav.addObject("orderList", orderList);
		return mav;
	}
	
	@RequestMapping("/orderAdd")
	public ModelAndView orderAdd(
			@RequestParam(value = "username", required = false) String username,
			@RequestParam(value = "loginpw", required = false) String loginpw,
			@RequestParam(value = "flag", required = false) String flag,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		Tuser user=(Tuser)request.getSession().getAttribute("user");
		Vector cart = (Vector) request.getSession().getAttribute("cart");
		orderService.orderAdd(cart,user);
		request.getSession().setAttribute("cart",null);
		List<Torder> orderList=orderService.orderAll(user.getUserID());
		ModelAndView mav = new ModelAndView();
		request.setAttribute("orderList",orderList);
		mav.setViewName("myorder");
		mav.addObject("orderList", orderList);
		return mav;
	}
	
	
	@RequestMapping("/orderDetail")
	public ModelAndView orderDetail(
			@RequestParam(value = "orderID", required = false) String orderID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		List<TOrderItem> orderItemList =orderService.orderDetail(orderID);
		ModelAndView mav = new ModelAndView();
		request.setAttribute("orderItemList",orderItemList);
		mav.setViewName("orderdetail");
		mav.addObject("orderItemList", orderItemList);
		return mav;
	}
	
	@RequestMapping("/cartAdd")
	public ModelAndView cartAdd(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		ModelAndView mv = new ModelAndView();
		if(request.getSession().getAttribute("user")!=null){
			int goodID = Integer.parseInt(request.getParameter("goodID"));//定义一个int类型变量，=：赋值操作，Interger：int的包装类，也就是整数
					//.parseInt(arg):将参数arg转换成int（整数）
					//request:是jsp内置对象，即客户端发来的请求对象
					//.getParameter("time"):获得客户端发来的请求参数即获得名（name）为times的请求值
			int goodPrice = Integer.parseInt(request.getParameter("goodPrice"));
			int goodnum = Integer.parseInt(request.getParameter("goodnum"));
			String goodName = request.getParameter("goodName");
			boolean flag = true;
			TOrderItem orderitem = new TOrderItem();
			orderitem.setGoodID(goodID);
			orderitem.setGoodName(goodName);
			orderitem.setGoodnum(goodnum);
			orderitem.setGoodPrice(goodPrice);
			Vector cart = (Vector) request.getSession().getAttribute("cart");
			if (cart == null) {//如果是第一次就创建购物车
				cart = new Vector();
			}

			else {//如果有该物品就
				for (int i = 0; i < cart.size(); i++) {
					TOrderItem form = (TOrderItem) cart.elementAt(i);
					if (form.goodID == orderitem.goodID) {
						form.goodnum = form.goodnum + orderitem.goodnum;
						cart.setElementAt(form, i);
						flag = false;

					}
				}
			}
			if (flag)////如果是新商品就加入购物车中
				cart.add(orderitem);
			request.getSession().setAttribute("cart", cart);//存放信息
			
			mv.setViewName("cart");
		}
		else{
			mv.setViewName("login");
		}
	  return mv;
	}
	
	
	@RequestMapping("/cartMod")
	public ModelAndView cartMod(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		ModelAndView mv = new ModelAndView();
		if(request.getSession().getAttribute("user")!=null){
			int goodID = Integer.parseInt(request.getParameter("goodID"));
			int goodnum = Integer.parseInt(request.getParameter("goodnum"));
			boolean flag = true;
			TOrderItem orderitem = new TOrderItem();
			orderitem.setGoodID(goodID);
			orderitem.setGoodnum(goodnum);
			
			Vector cart = (Vector) request.getSession().getAttribute("cart");
			if (cart == null) {
				cart = new Vector();
			}

			else {
				for (int i = 0; i < cart.size(); i++) {
					TOrderItem form = (TOrderItem) cart.elementAt(i);
					if (form.goodID == orderitem.goodID) {
						form.goodnum =  orderitem.goodnum;
						cart.setElementAt(form, i);
						flag = false;

					}
				}
			}
			if (flag)
				cart.add(orderitem);
			request.getSession().setAttribute("cart", cart);
			
			mv.setViewName("cart");
		}
		else{
			mv.setViewName("login");
		}
	  return mv;
	}
	
	@RequestMapping("/cartClear")
	public ModelAndView cartClear(
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		ModelAndView mv = new ModelAndView();
		request.getSession().setAttribute("cart",null);
		mv.setViewName("cart");
		return mv;
	}
	
	
	@RequestMapping("/cartDel")
	public ModelAndView cartDel(
			@RequestParam(value = "goodID", required = false) String goodID,
			HttpServletRequest request, HttpServletResponse response,
			HttpSession session) {	
		ModelAndView mv = new ModelAndView();
		TOrderItem orderitem = new TOrderItem();
		orderitem.setGoodID(Integer.parseInt(goodID));
		Vector cart = (Vector) request.getSession().getAttribute("cart");
		if (cart == null) {
			cart = new Vector();
		}

		else {
			for (int i = 0; i < cart.size(); i++) {
				TOrderItem form = (TOrderItem) cart.elementAt(i);
				if (form.goodID == orderitem.goodID) {
					form.goodnum = form.goodnum + orderitem.goodnum;
					cart.remove(form);
				}
			}
		}
		request.getSession().setAttribute("cart", cart);
	
		mv.setViewName("cart");
		return mv;
	}
	
}
