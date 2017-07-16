package com.shop.entity;

public class Torder {

	public String getOrderID() {
		return orderID;
	}
	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}
	public String getOrderbianhao() {
		return orderbianhao;
	}
	public void setOrderbianhao(String orderbianhao) {
		this.orderbianhao = orderbianhao;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	
	public String getOrderAddress() {
		return orderAddress;
	}
	public void setOrderAddress(String orderAddress) {
		this.orderAddress = orderAddress;
	}
	public String getOrdermoney() {
		return ordermoney;
	}
	public void setOrdermoney(String ordermoney) {
		this.ordermoney = ordermoney;
	}

	public String orderID;
	public String orderbianhao;
	public String orderDate;
	public String orderAddress;
	public String ordermoney;

	public String orderStatus;
	
	public String userID;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}

	public String userName;
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
}
