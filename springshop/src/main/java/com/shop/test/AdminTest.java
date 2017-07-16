package com.shop.test;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.FileSystemXmlApplicationContext;

import com.shop.util.DB;
import com.shop.entity.Tadmin;
import com.shop.service.impl.AdminService;


public class AdminTest {
	
	public static void setUpBeforeClass() throws Exception {
	}

	
	public static void tearDownAfterClass() throws Exception {
	}

	
	public void setUp() throws Exception {
	}


	public void tearDown() throws Exception {
	}

	
	public void test() {
		ApplicationContext aCtx = new FileSystemXmlApplicationContext("classpath:applicationContext.xml");	
		AdminService adminService = (AdminService) aCtx.getBean("adminService");
		
		Tadmin admin=new Tadmin();
		admin.setUserName("admin");
		admin.setUserPw("zhangsan");
		Tadmin resultadmin=adminService.adminLogin(admin);
		System.out.println(resultadmin);
		
	}

}
