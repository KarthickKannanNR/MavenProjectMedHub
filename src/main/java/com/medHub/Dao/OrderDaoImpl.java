package com.medHub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.interfaces.OrderDAO;
import com.medHub.model.Order;
import com.medHub.model.Product;
import com.medHub.model.User;
import com.medHub.util.ConnectionUtil;

public class OrderDaoImpl implements OrderDAO{
	

	public  void  orders(Order order,User currentUser) {
		
		String orderQuery="insert into orders (user_id,price) values(?,?)";
		Connection con = ConnectionUtil.getDBconnect();
		try {
			PreparedStatement pst = con.prepareStatement(orderQuery);
			pst.setInt(1,currentUser.getUserId() );
			pst.setDouble(2, order.getPrice());
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
			orderId=rs.getInt(1);
			System.out.println(orderId);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		return orderId;
		
	}

	@Override
	public void orders(Order order, double totalPrice) {
		// TODO Auto-generated method stub
		
	}



	
	


}
