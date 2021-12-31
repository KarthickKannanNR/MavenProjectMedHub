package com.interfaces;

import com.medHub.model.OrderItemsModel;
import com.medHub.model.UserModel;

public interface OrderItemInterface {

	public  void  insertOrders(OrderItemsModel oi);
	public void ViewMyOrders(UserModel currentUser);
	
}
