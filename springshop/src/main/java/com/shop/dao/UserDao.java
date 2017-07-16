package com.shop.dao;

import java.util.List;
import java.util.Map;

import com.shop.entity.Tuser;

public interface UserDao {

	public Tuser userLogin(Map<String,Object> map);
	public List<Tuser> userMana();

	public void userDelete(String id);

	public void userAdd(Tuser user);
	
	public void usermod(Tuser user);
	
	public String userfindpassword(Tuser user);
}
