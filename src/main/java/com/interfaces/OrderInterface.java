package com.interfaces;

import com.medHub.model.OrderModel;

public interface OrderInterface {

	public  void  orders(OrderModel order ,double totalPrice);
	public int  getByOrderId();
}
