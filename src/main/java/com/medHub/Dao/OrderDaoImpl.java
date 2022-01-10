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
		System.out.println("1");
		String qwery="select max(order_id) from orders";
		System.out.println(2);
		Connection con = ConnectionUtil.getDBconnect();
		Order order= null;
		int orderId=0;
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(qwery);
			
			if(rs.next())
			{
			orderId=rs.getInt(1);
			System.out.println("getbyorderId"+orderId);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		return orderId;
		
	}

	public void deleteProduct(int orderId) throws SQLException
	{
		System.out.println("cancel metghod called");
		String qwery="update orders set order_status='canceled' where order_id =?";
		Connection con = ConnectionUtil.getDBconnect();
		PreparedStatement pst=con.prepareStatement(qwery);
		pst.setInt(1, orderId);
		int res=pst.executeUpdate();
		if(res>0)
		{
			System.out.println(res+"Product deleted");
			System.out.println("order cancelled");
			
		}
		else {
			System.out.println("product not deleted");
		}
		
		con.close();
		pst.close();
		
	}

	public boolean checkStatus(int orderId)
	{	
		try {
			String status;
		String qwery="select order_status from orders where order_id='"+orderId+"'";
		Connection con = ConnectionUtil.getDBconnect();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(qwery);
		if(rs.next())
		{
			
		status=rs.getString(1).toLowerCase();
		System.out.println(status);
		if(!status.equals("canceled"))
		{
			return true;

		}

		}
		}
		catch(Exception e)
		{
			System.out.println(e.getStackTrace());
		}
		return false;
	}

	


	
	


}
