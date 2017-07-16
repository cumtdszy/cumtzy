package com.shop.test;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.shop.util.DB;
import com.shop.entity.Tuser;
import com.shop.service.impl.ProductService;
import com.shop.service.impl.UserService;

public class UserTest {

	public static void setUpBeforeClass() throws Exception {
	}

	
	public static void tearDownAfterClass() throws Exception {
	}


	public void setUp() throws Exception {
	}


	public void tearDown() throws Exception {
	}

	
	public void test() {
		System.out.println("user test begin");
		ApplicationContext aCtx = new FileSystemXmlApplicationContext("classpath:applicationContext.xml");	
		UserService userService = (UserService) aCtx.getBean("UserService");
		List userList=userService.userMana();
		
		for (int i=0;i<userList.size();i++){
			Tuser user=(Tuser)userList.get(i);
			System.out.print("当前为"+(i+1)+"用户");
			System.out.print("用户名为:"+user.getUsername()+",");
			System.out.print("密码为:"+user.getLoginpw()+",");
			System.out.print("用户地址为:"+user.getAddress()+",");
			System.out.print("用户电话为:"+user.getPhone()+",");
			System.out.print("用户邮箱为:"+user.getEmail()+"");
			
			System.out.println("\n");
		}
		
		System.out.println("user test end");
	}

}
