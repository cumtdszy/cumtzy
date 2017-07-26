package com.shop.test;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.shop.entity.Torder;
import com.shop.service.impl.OrderService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class OrderTest {

	@Autowired
	private OrderService orderService;
	@Test
	public void test() {
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
