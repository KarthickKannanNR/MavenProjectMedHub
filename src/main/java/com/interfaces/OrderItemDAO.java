package com.interfaces;

import com.medHub.model.OrderItems;
import com.medHub.model.User;

public interface OrderItemDAO {

	public  void  insertOrders(OrderItems oi);
	public void ViewMyOrders(User currentUser);
	
}
