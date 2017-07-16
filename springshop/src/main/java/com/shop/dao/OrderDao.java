package com.shop.dao;

import java.util.List;
import java.util.Map;

import com.shop.entity.TOrderItem;
import com.shop.entity.Torder;

public interface OrderDao {

	
	public List<Torder> orderMana();
	public List<Torder> orderAll(String userID);

	public void orderDel1(String id);
	public void orderDel2(String id);
	
	
	public List<TOrderItem> orderDetail(String orderID);
	
	public int nextOrderID();
	
	
	public void orderAdd(Torder order);
	
	public void orderitemAdd(TOrderItem orderitem);
	
	
	public void cunkunEdit(Map<String,Object> map);
}
