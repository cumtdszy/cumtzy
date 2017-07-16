package com.shop.test;
import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;


import com.shop.entity.Tproduct;

import com.shop.service.impl.ProductService;


public class ProductTest {
	
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
		ProductService productService = (ProductService) aCtx.getBean("productService");
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
