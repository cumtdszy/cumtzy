package com.shop.test;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.shop.entity.Tadmin;
import com.shop.service.impl.AdminService;
@RunWith(SpringJUnit4ClassRunner.class)//让测试运行于Spring测试环境 Spring框架在org.springframework.test.annotation 包中提供
@ContextConfiguration(locations = {"classpath:/applicationContext.xml"})//Spring整合JUnit4测试时，使用注解引入多个配置文件
public class AdminTest {
	   @Autowired//这个注解就是spring可以自动帮你把bean里面引用的对象的setter/getter方法省略，它会自动帮你set/get
	    private AdminService adminService;
	   @Test
	   public void testAdminLogin() {
		Tadmin admin=new Tadmin();
		admin.setUserName("admin");
		admin.setUserPw("admin");
		Tadmin resultadmin=adminService.adminLogin(admin);
		if(resultadmin!=null){
			System.out.println("-----------------登录成功---------------");
		}else{
			System.out.println("----------------登录失败-----------------");
		}
		
	}

}
