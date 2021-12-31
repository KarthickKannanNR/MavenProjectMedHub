package com.interfaces;

import com.medHub.model.Order;

public interface OrderDAO {

	public  void  orders(Order order ,double totalPrice);
	public int  getByOrderId();
}
