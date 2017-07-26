package com.shop.test;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.shop.entity.Tproduct;
import com.shop.service.impl.ProductService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class ProductTest {
	
	@Autowired
	private ProductService productService;
	@Test
	public void test() {
	
		
		List productList=productService.productMana();
	
		for (int i=0;i<productList.size();i++){
			Tproduct product=(Tproduct)productList.get(i);
			System.out.print("当前为"+(i+1)+"产品");
			System.out.print("产品名称为:"+product.getGoodName()+",");
			System.out.print("分类:"+product.getCatergoryName()+",");
			System.out.print("产品描述为:"+product.getGoodMiaoshu()+",");
			System.out.print("产品图片为:"+product.getGoodPic()+",");
			System.out.print("产品价格为:"+product.getPrice()+"");
			System.out.print("产品库存为:"+product.getCunkun()+"");
			System.out.println("\n");
		}
		
		System.out.println("product test end");
	}

}
