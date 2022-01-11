package com.interfaces;

import java.sql.SQLException;

import com.medHub.model.Order;
import com.medHub.model.User;

public interface OrderDAO {

	public int  getByOrderId();
	public  void  orders(Order order,User currentUser);
	public boolean deleteProduct(int orderId) throws SQLException;
}
