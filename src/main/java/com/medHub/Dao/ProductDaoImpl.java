package com.medHub.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.interfaces.ProductDAO;
import com.medHub.model.Order;
import com.medHub.model.Product;
import com.medHub.util.ConnectionUtil;

public class ProductDaoImpl implements ProductDAO{
	
	
//																		Show All Products
	public List<Product> viewProduts()
	{
		String viewQuery="select * from products where status='available'";
		Connection con=ConnectionUtil.getDBconnect();
		List<Product> productList=new ArrayList<Product>();
		try {
			Statement smt = con.createStatement();
			ResultSet rs= smt.executeQuery(viewQuery);
			
			while(rs.next()) {
				Product product=new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),
						rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),rs.getInt(10));
				productList.add(product);	
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		
		return productList;
	}
	
																		//Insert Product By Admin
	public Boolean insertProduct(Product productModel) throws SQLException
	{
		boolean flag=false;
		String query="insert into products (product_category,product_name,description,price,available_quantity,product_img,points_per_unit,offer) values (?,?,?,?,?,?,?,?)";
		Connection con=ConnectionUtil.getDBconnect();
		PreparedStatement pst = con.prepareStatement(query);
		pst.setString(1, productModel.getProductCategory());
		pst.setString(2, productModel.getProductName());
		pst.setString(3, productModel.getDescription());
		pst.setDouble(4, productModel.getUnitPrice());
		pst.setInt(5, productModel.getQuantity());
		pst.setString(6, productModel.getProductImg());
		pst.setInt(7,productModel.getPoints());
		pst.setInt(8, productModel.getOffer());
		int result=pst.executeUpdate();
		if(result>0)
		{
			flag=false;
			return flag;
		}
		return flag;
		
	}


//																				Update Products By ADmin
	public void updateProducts(Product product) throws SQLException {
		// TODO Auto-generated method stub
		String updateQwery="update products set product_category=?,product_name=?,unit_price=?,Quantity=?,product_img=?,points_per_unit=?,offer=?,description=?, where product_id=?";
		Connection con = ConnectionUtil.getDBconnect();
		PreparedStatement pst=null;
		try {
		 pst = con.prepareStatement(updateQwery);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pst.setString(1, product.getProductCategory());
		pst.setString(2, product.getProductName());
		pst.setDouble(3, product.getUnitPrice());
		pst.setDouble(4, product.getQuantity());
		pst.setString(5, product.getProductImg());
		pst.setInt(6, product.getPoints());
		pst.setInt(7,product.getOffer());
		pst.setString(8,product.getDescription());
		pst.setInt(9, product.getProductId());
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
			String qwery="update products set status='unavailable' where product_id=?";
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
				ResultSet rs = pst.executeQuery();
				if(rs.next())
				{
				 product= new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),rs.getInt(10));
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return product;
			}
		
		public void updateProductQuantity(Product currentProduct, int qty) throws SQLException
		{
			String updateQtyQuery = "update products set available_quantity ="+qty+" where product_id = "+currentProduct.getProductId()+"";
			
			Connection con = ConnectionUtil.getDBconnect();
			
				PreparedStatement pst=con.prepareStatement(updateQtyQuery);
				int res=pst.executeUpdate();
				pst=con.prepareStatement("commit");
				int res2=pst.executeUpdate();
				if(res>0)
				{
				System.out.println("Order Placed Sucessfully");	
				}
			
		}
		
		
		public List<Product> searchProduct(String Productname)
		{
			String query ="select * from products where product_name like '"+Productname+"%'";
			List<Product> findedProducts = new ArrayList<Product>();

			try {
						Connection con = ConnectionUtil.getDBconnect();
			Statement smt = con.createStatement();
			ResultSet rs= smt.executeQuery(query);
			while(rs.next()) {
				Product product=new Product(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),
						rs.getInt(6),rs.getString(7),rs.getInt(8),rs.getString(9),rs.getInt(10));
				findedProducts.add(product);	
				}
		
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}
			return findedProducts;
			}

		@Override
		public void updateProducts(int updateProductId, String updateproductcategory, String updateProductName,
				String updateProductDescription, int updateUnitPrice, int updateQuantity) throws SQLException {
			// TODO Auto-generated method stub
			}

		@Override
		public void updateProductQuantity(Product buyProducts) throws SQLException {
			// TODO Auto-generated method stub
			
		}

		
	
		

		
		

		
}
