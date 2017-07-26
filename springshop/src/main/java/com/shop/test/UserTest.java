package com.shop.test;

import java.util.List;

import com.shop.entity.Tuser;

import com.shop.service.impl.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })

public class UserTest {

	@Autowired
	private UserService userService;

	@Test
	public void test() {

		List userList = userService.userMana();

		for (int i = 0; i < userList.size(); i++) {
			Tuser user = (Tuser) userList.get(i);
			System.out.print("当前为:" + (i + 1) + "用户");
			System.out.print("用户名为:" + user.getUsername() + ",");
			System.out.print("密码为:" + user.getLoginpw() + ",");
			System.out.print("用户地址为:" + user.getAddress() + ",");
			System.out.print("用户电话为:" + user.getPhone() + ",");
			System.out.print("用户邮箱为:" + user.getEmail() + "");

			System.out.println("\n");
		}

		System.out.println("user test end");
	}

}
