package com.shop.dao;

import java.util.List;
import java.util.Map;

import com.shop.entity.Tfavoriate;
import com.shop.entity.Tfenxi;
import com.shop.entity.Tpingjia;
import com.shop.entity.Tproduct;
public interface ProductDao {
	public List<Tproduct> productMana();

	public List<Tproduct> productAll(Map<String,Object> map);
	
	public void productDel(String id);
	public void productAdd(Tproduct product);
	
	
	public Tproduct productDetail(String goodID);
	public void productEdit(Tproduct product);
	

	
	
	public List<Tfenxi> fenxi();
	
	
	//------------------------------
	public void delFavoriate(Map<String,Object> map);
	public void addFavoriate(Tfavoriate favoriate);
	public List<Tfavoriate> myFavoriate(String userID);
	//---------------
	
	
	public List<Tpingjia> productpingjia(String goodID);
	public void addpingjia(Tpingjia pingjia);
	//-----------------------------------
	
	
	public void orderitemEdit(Map<String,Object> map);
	
}
