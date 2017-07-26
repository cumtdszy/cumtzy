package com.shop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shop.dao.AdminDao;
import com.shop.entity.Tadmin;


@Service("adminService")//注解
public class AdminService {

	@Resource
	private AdminDao adminlDao;////是自动注入一个id=adminlDao的bean
	

	public Tadmin adminLogin(Tadmin admin){
		return  adminlDao.adminLogin(admin);
	}

}
