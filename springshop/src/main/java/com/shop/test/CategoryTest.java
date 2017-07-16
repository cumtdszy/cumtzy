package com.shop.test;




import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.FileSystemXmlApplicationContext;



import com.shop.entity.Tcategory;
import com.shop.service.impl.CategoryService;


public class CategoryTest {
	
	public static void setUpBeforeClass() throws Exception {
	}

	
	public static void tearDownAfterClass() throws Exception {
	}

	
	public void setUp() throws Exception {
	}

	
	public void tearDown() throws Exception {
	}

	
	public void test() {
		System.out.println("category test beign");
		ApplicationContext aCtx = new FileSystemXmlApplicationContext("classpath:applicationContext.xml");	
		CategoryService categoryService = (CategoryService) aCtx.getBean("categoryService");
		
	
		List categoryList=categoryService.categoryMana();
		
		
		
		for (int i=0;i<categoryList.size();i++){
			Tcategory category=(Tcategory)categoryList.get(i);
			System.out.print("当前为"+(i+1)+"个分类");
			System.out.print("分类ID为:"+category.getCategoryID()+",");
			System.out.print("分类名称为:"+category.getCategoryName()+",");
		
			
			System.out.println("\n");
		}
		
		System.out.println("category test end");
	}

}
