package com.shop.test;
import com.shop.entity.Tcategory;
import com.shop.service.impl.CategoryService;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:/applicationContext.xml" })
public class CategoryTest {
	@Autowired
	private CategoryService categoryService;

	@Test
	public void testCategory() {
		System.out.println("category test beign");

		List categoryList = categoryService.categoryMana();

		for (int i = 0; i < categoryList.size(); i++) {
			Tcategory category = (Tcategory) categoryList.get(i);
			System.out.print("当前为" + (i + 1) + "个分类");
			System.out.print("分类ID为:" + category.getCategoryID() + ",");
			System.out.print("分类名称为:" + category.getCategoryName() + ",");

			System.out.println("\n");
		}

		System.out.println("category test end");
	}

}
