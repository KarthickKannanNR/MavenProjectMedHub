package com.medHub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.medHub.dao.ProductDaoImpl;
import com.medHub.model.Product;

import jakarta.servlet.http.HttpSession;

@WebServlet("/AddProductController")
public class AddProductServlet extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		String category= req.getParameter("category");
		System.out.println(category);
		String productname= req.getParameter("productName");
		System.out.println(productname);
		double price = Double.parseDouble(req.getParameter("price"));
		System.out.println(price);
		int quantity= Integer.parseInt(req.getParameter("quantity"));
		System.out.println(quantity);
		String imageurl= req.getParameter("imageUrl");
		int points = Integer.parseInt(req.getParameter("points"));
		System.out.println(points);
		int offer=Integer.parseInt(req.getParameter("offer"));
		System.out.println(offer);
		String description= req.getParameter("description");
				
		Product product= new Product(category,productname,price,quantity,imageurl,points,offer,description);
		ProductDaoImpl products = new ProductDaoImpl();
		
		try {
			products.insertProduct(product);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
