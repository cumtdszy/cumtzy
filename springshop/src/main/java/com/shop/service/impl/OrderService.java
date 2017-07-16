package com.shop.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shop.dao.OrderDao;
import com.shop.entity.TOrderItem;
import com.shop.entity.Torder;
import com.shop.entity.Tuser;
@Service("orderService")
public class OrderService {

	@Resource
	private OrderDao orderDao;

	public List<Torder> orderMana(){
		
		return orderDao.orderMana();
	}
	
	public List<Torder> orderAll(String userID){
		return orderDao.orderAll(userID);
	}

	public void orderDel(String id){
		orderDao.orderDel1(id);
		orderDao.orderDel2(id);
	}
	
	public void orderAdd(Vector cart,Tuser user){
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    	SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddHHmmss");
		Double sum=0.0;
		if(cart!=null){
	         int nextorderID=orderDao.nextOrderID();
	         
			 for (int i = 0; i < cart.size(); i++) {
				  TOrderItem item=(TOrderItem)cart.elementAt(i);
				  item.setOrderID(String.valueOf(nextorderID));
		          sum=sum+item.goodnum*item.getGoodPrice();
		          orderDao.orderitemAdd(item);
		          Map<String,Object> map=new HashMap<String,Object>();
		  		  map.put("cunkun", item.getGoodnum());
		  		  map.put("goodID", item.getGoodID());
		  		  orderDao.cunkunEdit(map);
			  }
			  Torder order=new Torder();
			  order.setOrderAddress(user.getAddress());
			  order.setOrderbianhao(df2.format(new Date()));
			  order.setOrderDate(df.format(new Date()));
			  order.setOrderID(String.valueOf(nextorderID));
			  order.setOrdermoney(String.valueOf(sum));
			  order.setOrderStatus("待发货");
			  order.setUserID(user.getUserID());
			  order.setUserName(user.getUsername());
			  orderDao.orderAdd(order);
		}
		
	}
	
	public  List<TOrderItem> orderDetail(String orderID){
		  return orderDao.orderDetail(orderID);
	}

}
