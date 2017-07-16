package com.shop.test;



import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.shop.util.DB;
import com.shop.entity.Torder;
import com.shop.service.impl.CategoryService;
import com.shop.service.impl.OrderService;


public class OrderTest {

	public static void setUpBeforeClass() throws Exception {
	}

	
	public static void tearDownAfterClass() throws Exception {
	}

	
	public void setUp() throws Exception {
	}

	
	public void tearDown() throws Exception {
	}


	public void test() {
		System.out.println("order test begin");
		ApplicationContext aCtx = new FileSystemXmlApplicationContext("classpath:applicationContext.xml");	
		OrderService orderService = (OrderService) aCtx.getBean("orderService");
		
		
		List orderList=orderService.orderMana();
		
		for (int i=0;i<orderList.size();i++){
			Torder order=(Torder)orderList.get(i);
			System.out.print("当前为"+(i+1)+"订单");
			System.out.print("客户名称为:"+order.getUserName()+",");
			System.out.print("订单编号:"+order.getOrderbianhao()+",");
			System.out.print("订单日期为:"+order.getOrderDate()+",");
			System.out.print("订单金额为:"+order.getOrdermoney()+",");
			System.out.print("送货地址为:"+order.getOrderAddress()+"");
			System.out.println("\n");
		}
		
		System.out.println("order test end");
	}

}
