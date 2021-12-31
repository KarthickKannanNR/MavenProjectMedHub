package com.medHub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.interfaces.OrderDAO;
import com.medHub.model.Order;
import com.medHub.model.Product;
import com.medHub.util.ConnectionUtil;

public class OrderDaoImpl implements OrderDAO{
	

	public  void  orders(Order order ,double totalPrice) {
		
		String orderQuery="insert into orders (user_id,price) values(?,?)";
		Connection con = ConnectionUtil.getDBconnect();
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
		Connection con = ConnectionUtil.getDBconnect();
		Order order= null;
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
