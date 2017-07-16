package com.shop.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.shop.dao.UserDao;
import com.shop.entity.Tuser;

@Service("userService")
public class UserService {

	@Resource
	private UserDao userDao;

	public List<Tuser> userMana() {

		return userDao.userMana();
	}

	public void userDelete(String id) {

		userDao.userDelete(id);
	}

	public void userAdd(Tuser user) {

		userDao.userAdd(user);
	}

	public Tuser userLogin(Map<String,Object> map){
		return userDao.userLogin(map)	;
	}
	
	public void usermod(Tuser user){
		
		userDao.usermod(user);
	}
	
	public String userfindpassword(Tuser user){
	   return userDao.userfindpassword(user);
	}
	
}
