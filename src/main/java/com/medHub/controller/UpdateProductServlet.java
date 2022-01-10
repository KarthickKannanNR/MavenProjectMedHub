package com.medHub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medHub.dao.ProductDaoImpl;
import com.medHub.model.Product;

@WebServlet("/UpdateProductController")

public class UpdateProductServlet extends HttpServlet{
	
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		int prodId= Integer.parseInt(req.getParameter("currentProdId"));
		System.out.println(prodId);
		String category= req.getParameter("category");
		System.out.println("category"+category);
		String productname= req.getParameter("productName");
		System.out.println(productname);
		double price = Double.parseDouble(req.getParameter("price"));
		System.out.println("price"+price);
		int quantity= Integer.parseInt(req.getParameter("quantity"));
		System.out.println("quantity"+quantity);
		String imageurl= req.getParameter("imageUrl");
		System.out.println("imageUrl"+imageurl);
		int points = Integer.parseInt(req.getParameter("points"));
		System.out.println("points"+points);
		int offer=Integer.parseInt(req.getParameter("offer"));
		System.out.println("offer"+offer);
		String description= req.getParameter("description");
				
		Product product= new Product(category,productname,price,quantity,imageurl,points,offer,description,prodId);
		ProductDaoImpl products = new ProductDaoImpl();
		
		try {
			products.updateProducts(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

}
}
