package com.shop.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.shop.dao.CategoryDao;
import com.shop.dao.ProductDao;
import com.shop.entity.Tcategory;
import com.shop.entity.Tfavoriate;
import com.shop.entity.Tfenxi;
import com.shop.entity.Tpingjia;
import com.shop.entity.Tproduct;
@Service("productService")
public class ProductService {

	@Resource
	private ProductDao productDao;

	public List<Tproduct> productMana() {

		return productDao.productMana();
	}

	public void productDelete(String id) {

		productDao.productDel(id);
	}

	public void productAdd(Tproduct product) {

		productDao.productAdd(product);
	}

	
	public List<Tproduct> productAll(Map<String,Object> map){
		
		return productDao.productAll(map);
	}
	
	
	
	
	public Tproduct productDetail(String goodID){
		
		return productDao.productDetail(goodID);
	}
	
	
	public void productEdit(Tproduct product) {

		productDao.productEdit(product);
	}
	
	
	public List<Tfenxi> fenxi() {
		return productDao.fenxi();
	}
	
	
	public void delFavoriate(Map<String,Object> map){
		productDao.delFavoriate(map);
	}
	public void addFavoriate(Tfavoriate favoriate){
		productDao.addFavoriate(favoriate);
		
	}
	
	public List<Tfavoriate> myFavoriate(String userID){
		return productDao.myFavoriate(userID);
	}
	
	//---------------------------------------------------
	public List<Tpingjia> productpingjia(String goodID){
		
		return productDao.productpingjia(goodID);
	}
	
	public void addpingjia(Tpingjia pingjia){
		
		productDao.addpingjia(pingjia);
		
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("goodID",pingjia.getGoodID());
		map.put("orderID",pingjia.getOrderID());
		productDao.orderitemEdit(map);
	}
	

}
