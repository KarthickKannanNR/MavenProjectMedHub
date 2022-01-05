package com.medHub.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.medHub.dao.OrderDaoImpl;
import com.medHub.dao.OrderItemsDaoImpl;
import com.medHub.dao.UserDaoImpl;
import com.medHub.model.Order;
import com.medHub.model.OrderItems;
import com.medHub.model.Product;
import com.medHub.model.User;

@WebServlet("/prod1")
public class BuyProductServlet extends HttpServlet{	

	public void doGet(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession(); 
		UserDaoImpl user= new UserDaoImpl();
		Product product = new Product();
		OrderItems orderItems = new OrderItems();
		User currentUser = (User)session.getAttribute("user");
		Product currentproduct = (Product)session.getAttribute("currentproduct");
//		Product product = new Product(currentproduct.getProductId(),currentproduct.getProductCategory(),currentproduct.getProductName(),
//				currentproduct.getDescription(),currentproduct.getUnitPrice(),currentproduct.getQuantity(),currentproduct.getProductImg(),currentproduct.getPoints(),currentproduct.getStatus(),currentproduct.getOffer());

		int qty = Integer.parseInt(req.getParameter("quantity"));
		double 	price= Double.parseDouble(req.getParameter("totalPrice"));
		int offer = 0;
		Order order = new Order();
		OrderDaoImpl orderDao = new OrderDaoImpl();
		OrderItemsDaoImpl orderItemsDaoImpl = new OrderItemsDaoImpl();
		try {
			if(currentUser.getWallet()>=price) {

			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}
		if(currentUser.getWallet()>=price)
		{
			order.setUser(currentUser);
			orderItems.setUser(currentUser);
			order.setPrice(price);
			order.getUser().setPoints(order.getUser().getPoints()+(currentproduct.getPoints()*qty));
			order.getUser().setWallet(order.getUser().getWallet()-price);
			user.updateUserPoints(order);
			user.updateWalletMoney(order);
			int orderId=orderDao.getByOrderId();
			order.setOrderId(orderId);
			orderDao.orders(order,currentUser);
			orderItems.setOrderModel(order);
			orderItems.setProduct(currentproduct);
			orderItems.setOrderId(orderId);
			orderItems.getProduct().setProductId(currentproduct.getProductId());
			orderItems.setQuantity(qty);
			orderItems.setUnitPrice(currentproduct.getUnitPrice());
			orderItems.setTotalPrice(price);
			orderItemsDaoImpl.insertOrders(orderItems);
			res.getWriter().println("order placed!!");
			res.sendRedirect("Payment.jsp");
		}
		else {
			System.out.println("Insuffuciend amt In Wallet");
		}
		
		
		
	}

}
