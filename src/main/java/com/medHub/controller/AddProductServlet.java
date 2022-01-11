package com.medHub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.exceptions.ProductExists;
import com.medHub.dao.ProductDaoImpl;
import com.medHub.model.Product;



@WebServlet("/AddProductController")
public class AddProductServlet extends HttpServlet {
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		HttpSession session = req.getSession(); 
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
			boolean flag=products.insertProduct(product);
			if(flag)
			{
				System.out.println("product Inserted ");
			}
			else {
				System.out.println("product exists");
				throw new ProductExists();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ProductExists e) {
			// TODO Auto-generated catch block
			e.getMessage();
			session.setAttribute("productExists", e.getMessage());
			res.sendRedirect("AddProduct.jsp");
		}
	}

}
