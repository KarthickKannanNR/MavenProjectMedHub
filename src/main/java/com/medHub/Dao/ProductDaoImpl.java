package com.medHub.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.interfaces.ProductDAO;
import com.medHub.model.Product;
import com.medHub.util.ConnectionUtil;

public class ProductDaoImpl implements ProductDAO{
	
	
//																		Show All Products
	public List<Product> viewProduts()
	{
		String viewQuery="select * from products";
		Connection con=ConnectionUtil.getDBconnect();
		List<Product> productList=new ArrayList<Product>();
		try {
			Statement smt = con.createStatement();
			ResultSet rs= smt.executeQuery(viewQuery);
			
			while(rs.next()) {
				Product product=new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),
						rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9));
				productList.add(product);				
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		return productList;
	}
	
																		//Insert Product By Admin
	public void insertProduct(Product productModel) throws SQLException
	{
	
		String query="insert into products (product_category,product_name,description,unit_price,quantity,product_id) values (?,?,?,?,?,?)";
		Connection con=ConnectionUtil.getDBconnect();
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, productModel.getProductCategory());
		pst.setString(2, productModel.getProductName());
		pst.setString(3, productModel.getDescription());
		pst.setDouble(4, productModel.getUnitPrice());
		pst.setInt(5, productModel.getQuantity());
		pst.setInt(6, productModel.getProductId());
		int result=pst.executeUpdate();
		System.out.println(result + " product inserted");
	}


//																				Update Products By ADmin
	public void updateProducts(int updateProductId, String updateproductcategory, String updateProductName, String updateProductDescription, int updateUnitPrice, int updateQuantity) throws SQLException {
		// TODO Auto-generated method stub
		String updateQwery="update products set product_category=?,product_name=?,description=?,unit_price=?,Quantity=? where product_id=?";
		Connection con = ConnectionUtil.getDBconnect();
		PreparedStatement pst=null;
		try {
		 pst = con.prepareStatement(updateQwery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pst.setString(1, updateproductcategory);
		pst.setString(2, updateProductName);
		pst.setString(3, updateProductDescription);
		pst.setDouble(4, updateUnitPrice);
		pst.setInt(5, updateQuantity);
		pst.setInt(6, updateProductId);
		int result=pst.executeUpdate();
		if(result>0)
		{
			System.out.println(result+" product is updated");
		}
		else
		{
			System.out.println("product not update something went wrong");
		}
		con.close();
		pst.close();
		}
	
//																				Delete Product by admin
		public void deleteProduct(int productId) throws SQLException
		{
			String qwery="delete from products where product_id=?";
			Connection con = ConnectionUtil.getDBconnect();
			PreparedStatement pst=con.prepareStatement(qwery);
			pst.setInt(1, productId);
			int res=pst.executeUpdate();
			if(res>0)
			{
				System.out.println(res+"Product deleted");
				
			}
			else {
				System.out.println("product not deleted");
			}
			con.close();
			pst.close();
			
		}
		
		
//		public int findProductId()
//		{
//			int productId=0;
//			String query="select id from products where product_name=?";
//			Connection con = GetConnection.getDBconnect();
//			try {
//				PreparedStatement pst= con.prepareStatement(query);
//				pst.setString(1,query);
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//			
//			
//			return 0;
//			}
	
		
		
		
																//find Product By Name
		public Product findProductByName(String productName)
		{
			int productId=0;
			String query="select * from products where product_name='"+productName+"'";
			Connection con = ConnectionUtil.getDBconnect();
			Product product=null;
			try {
				PreparedStatement pst= con.prepareStatement(query);
//				pst.setString(1,productName);
				ResultSet rs = pst.executeQuery();
				if(rs.next())
				{
				 product= new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getInt(6),rs.getString(7),rs.getInt(8));
					}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return product;
			}
		
		public Product findProductByProductId(int id)
		{
			int productId=0;
			String query="select * from products where product_id='"+id+"'";
			Connection con = ConnectionUtil.getDBconnect();
			Product product=null;
			try {
				PreparedStatement pst= con.prepareStatement(query);
				System.out.println(6);
//				pst.setString(1,productName);
				ResultSet rs = pst.executeQuery();
				if(rs.next())
				{
				 product= new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9));
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return product;
			}
		
		public void updateProductQuantity(Product buyProducts) throws SQLException
		{
		
			String updateQtyQuery = "update products set available_quantity ="+buyProducts.getQuantity()+" where product_id = "+buyProducts.getProductId()+"";
			
			Connection con = ConnectionUtil.getDBconnect();
			
				PreparedStatement pst=con.prepareStatement(updateQtyQuery);
				int res=pst.executeUpdate();
				pst=con.prepareStatement("commit");
				int res2=pst.executeUpdate();
				if(res>0)
				{
				System.out.println("Order Placed Sucessfully");	
				}
			
				// TODO Auto-generated catch block
			
			
			
			
		}
	
}
