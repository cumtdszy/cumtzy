package com.shop.dao;

import java.util.List;

import com.shop.entity.Tcategory;


public interface CategoryDao {
	public List<Tcategory> categoryMana();

	public void categoryDel(String id);
	public void categoryAdd(Tcategory category);
}
