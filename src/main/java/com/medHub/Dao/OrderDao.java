package com.medHub.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.interfaces.OrderInterface;
import com.medHub.connection.GetConnection;
import com.medHub.model.OrderModel;
import com.medHub.model.ProductModel;

public class OrderDao implements OrderInterface{
	

	public  void  orders(OrderModel order ,double totalPrice) {
		
		String orderQuery="insert into orders (user_id,price) values(?,?)";
		Connection con = GetConnection.getDBconnect();
		try {
			PreparedStatement pst = con.prepareStatement(orderQuery);
			pst.setInt(1,order.getUser().getUserId() );
			pst.setDouble(2, totalPrice);
			pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
			}

	}
	
	public int  getByOrderId()
	{
		String qwery="select max(order_id) from orders";
		Connection con = GetConnection.getDBconnect();
		OrderModel order= null;
		int orderId=0;
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(qwery);
			
			if(rs.next())
			{
			return orderId=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		return orderId;
		
	}
	


}
