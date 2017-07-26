package com.shop.service.impl;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shop.dao.CategoryDao;
import com.shop.entity.Tcategory;
@Service("categoryService")//@Service 这样, 是把这个类实例化为id=categoryService(默认bean名, 具体啥忘了反正不是userService)的bean
public class CategoryService {

	@Resource
	private CategoryDao categoryDao;

	public List<Tcategory> categoryMana() {

		return categoryDao.categoryMana();
	}

	public void categoryDelete(String id) {

		categoryDao.categoryDel(id);
	}

	public void categoryAdd(Tcategory category) {

		categoryDao.categoryAdd(category);
	}

}
