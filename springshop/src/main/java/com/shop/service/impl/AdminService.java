package com.shop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shop.dao.AdminDao;
import com.shop.entity.Tadmin;


@Service("adminService")
public class AdminService {

	@Resource
	private AdminDao adminlDao;
	

	public Tadmin adminLogin(Tadmin admin){
		return  adminlDao.adminLogin(admin);
	}

}
