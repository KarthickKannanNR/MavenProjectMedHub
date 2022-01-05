package com.medHub.model;

import java.util.Date;
import java.util.Objects;



public class OrderItems extends Order {

	private int itemId;
	private User user;
	private Product product;
	private Order orderModel;
	private int quantity;
	private double unitPrice;
	private double totalPrice;
	public int getItemId() {
		return itemId;
	}
	public OrderItems() {
		super();
		// TODO Auto-generated constructor stub
	}
	public void setItemId(int itemId) {
		this.itemId = itemId;
	}
	public OrderItems( User user, Order orderModel,Product product,int quantity, double unitPrice,
			double totalPrice) {
		super();
		this.user = user;
		this.product = product;
		this.orderModel=orderModel;	
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.totalPrice = totalPrice;
	}
	

	
	public OrderItems(String productName, int points, int quantity, double unitPrice, double totalPrice, int orderId) {
		// TODO Auto-generated constructor stub
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Order getOrderModel() {
		return orderModel;
	}
	public void setOrderModel(Order orderModel) {
		this.orderModel = orderModel;
	}
	@Override
	public String toString() {
		return "order id " + getOrderId() + "\nuser " + user + "\nproduct " + product + "\nquantity " + quantity + "\nunitPrice " + unitPrice + "\ntotalPrice " + totalPrice+"\n";
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public double getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
	
}
