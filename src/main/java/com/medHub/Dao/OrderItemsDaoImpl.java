package com.medHub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.interfaces.OrderItemDAO;
import com.medHub.model.OrderItems;
import com.medHub.model.Order;
import com.medHub.model.Product;
import com.medHub.model.User;
import com.medHub.util.ConnectionUtil;

public class OrderItemsDaoImpl implements OrderItemDAO{
//	currentUser,buyProducts,buyProductQuantity, totalPrice
	public  void  insertOrders(OrderItems oi) {
		// TODO Auto-generated method stub
		String orderQuery="insert into order_items(user_id,order_id,product_id,quantity,unit_price,total_price) values(?,?,?,?,?,?)";
		Connection con = ConnectionUtil.getDBconnect();

		try {
			PreparedStatement pst = con.prepareStatement(orderQuery);
			pst.setInt(1, oi.getUser().getUserId());
			pst.setInt(2, oi.getOrderModel().getOrderId());
			pst.setInt(3, oi.getProduct().getProductId());
			pst.setInt(4, oi.getQuantity());
			pst.setDouble(5, oi.getUnitPrice());
			pst.setDouble(6, oi.getTotalPrice());
			pst.executeUpdate("commit");

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
	

	}

	public void ViewMyOrders(User currentUser) {
		// TODO Auto-generated method stub
		
		String qwery="select p.product_name ,oi.quantity,oi.unit_price,oi.total_price,oi.order_id\r\n"
				+ "from order_items oi \r\n"
				+ "inner join orders o on oi.order_id=o.order_id\r\n"
				+ "inner join products p on oi.product_id=p.product_id where oi.user_id = "+currentUser.getUserId()+"";
		Connection con = ConnectionUtil.getDBconnect();
		try {
			PreparedStatement ps = con.prepareStatement(qwery);
			ResultSet rs = ps.executeQuery();
			System.out.format("%-15s%-10s%-15s%-15s%-10s\n\n","Product Name","Qty","Unit Price","Total Price","Order Id");
			while(rs.next())
			{
			System.out.format("%-15s%-10s%-15s%-15s%-10s\n",rs.getString(1),rs.getInt(2),rs.getDouble(3),rs.getDouble(4),rs.getInt(5));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}


