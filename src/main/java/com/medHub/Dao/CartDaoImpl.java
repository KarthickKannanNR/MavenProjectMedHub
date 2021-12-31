package com.medHub.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.medHub.model.Cart;
import com.medHub.model.Product;
import com.medHub.model.User;
import com.medHub.util.ConnectionUtil;

public class CartDaoImpl {



	public void insertProduct(Cart cart) {
		// TODO Auto-generated method stub
		
		Connection con = ConnectionUtil.getDBconnect();
		try {
		String insertProduct ="insert into cart (product_id,user_id,unit_price,qty,total_price) values (?,?,?,?,?)"; 
		PreparedStatement pst;
		try {
			pst = con.prepareStatement(insertProduct);
			pst.setInt(1,cart.getProduct().getProductId());
			pst.setInt(2, cart.getUser().getUserId());
			pst.setDouble(3, cart.getUnitPrice());
			pst.setInt(4, cart.getQty());
			pst.setDouble(5, cart.getTotalPrice());
			int result=pst.executeUpdate();
			System.out.println(result + " products added to cart");
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		}
		catch(Exception e)
		{
			e.getMessage();
			System.out.println("Something Went Wrong");
		}
		
		
		
	}
//	public List<ProductModel> viewProduts()
//	{
//		String viewQuery="select * from products";
//		Connection con=GetConnection.getDBconnect();
//		List<ProductModel> productList=new ArrayList<ProductModel>();
//		try {
//			Statement smt = con.createStatement();
//			ResultSet rs= smt.executeQuery(viewQuery);
//			
//			while(rs.next()) {
//				ProductModel product=new ProductModel(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),
//						rs.getInt(6),rs.getString(7));
//				productList.add(product);				
//				}
//			
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			System.out.println(e.getMessage());
//		}
//		
//		return productList;
//	}

	public List<Cart> viewCart(User currentUser) {
		currentUser.getUserId();
		String query= "select * from cart where user_id='"+currentUser.getUserId()+"'";
		Connection con=ConnectionUtil.getDBconnect();
		List<Cart> allCartItems=new ArrayList<Cart>();
		Statement smt = null;
		ResultSet rs= null;
		try {
			smt = con.createStatement();
			rs=smt.executeQuery(query);
			ProductDaoImpl proDao=new ProductDaoImpl();
			while(rs.next()) {
				
				Product product=proDao.findProductByProductId(rs.getInt(2));
				Cart cart=new Cart(product,currentUser,rs.getInt(4),rs.getDouble(5),rs.getDouble(6));
				allCartItems.add(cart);				
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.getMessage();
		}
		
		return allCartItems;
	}
	
}
