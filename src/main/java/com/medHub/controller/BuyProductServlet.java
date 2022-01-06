package com.medHub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medHub.dao.OrderDaoImpl;
import com.medHub.dao.OrderItemsDaoImpl;
import com.medHub.dao.ProductDaoImpl;
import com.medHub.dao.UserDaoImpl;
import com.medHub.model.Order;
import com.medHub.model.OrderItems;
import com.medHub.model.Product;
import com.medHub.model.User;

@WebServlet("/prod1")
public class BuyProductServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession();
		UserDaoImpl user = new UserDaoImpl();
		ProductDaoImpl productDao = new ProductDaoImpl();
		Product product = new Product();
		OrderItems orderItems = new OrderItems();
		User currentUser = (User) session.getAttribute("user");
		Product currentproduct = (Product) session.getAttribute("currentproduct");
//		Product product = new Product(currentproduct.getProductId(),currentproduct.getProductCategory(),currentproduct.getProductName(),
//				currentproduct.getDescription(),currentproduct.getUnitPrice(),currentproduct.getQuantity(),currentproduct.getProductImg(),currentproduct.getPoints(),currentproduct.getStatus(),currentproduct.getOffer());

		int qty = Integer.parseInt(req.getParameter("quantity"));
		System.out.println("ordered qty " + qty);
		double price = Double.parseDouble(req.getParameter("totalPrice"));
		System.out.println("total price " + price);
		int offer = 0;
		Order order = new Order();
		OrderDaoImpl orderDao = new OrderDaoImpl();
		OrderItemsDaoImpl orderItemsDaoImpl = new OrderItemsDaoImpl();
		try {

			System.out.println("Current user" + currentUser.getWallet());
			if (currentUser.getWallet() >= price) {

				order.getProduct().setQuantity((order.getProduct().getQuantity() - qty));
				try {
					int updateQty = currentproduct.getQuantity() - qty;
					productDao.updateProductQuantity(currentproduct, updateQty);
					System.out.println("dfghjklkjhgfdfghj");
					System.out.println(currentproduct.getQuantity());
					System.out.println(qty);
					System.out.println(currentproduct.getQuantity() - qty);
					System.out.println("dfghjklkjhgfdfghj");

				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				order.setUser(currentUser);
				orderItems.setUser(currentUser);
				order.setPrice(price);
				order.getUser().setPoints(order.getUser().getPoints() + (currentproduct.getPoints() * qty));
				order.getUser().setWallet(order.getUser().getWallet() - price);
				user.updateUserPoints(order);
				user.updateWalletMoney(order);
				orderDao.orders(order, currentUser);
				int orderId = orderDao.getByOrderId();
				order.setOrderId(orderId);
				orderItems.setOrderModel(order);
				orderItems.setProduct(currentproduct);
				orderItems.setOrderId(orderId);
				orderItems.getProduct().setProductId(currentproduct.getProductId());
				orderItems.setQuantity(qty);
				orderItems.setUnitPrice(currentproduct.getUnitPrice());
				orderItems.setTotalPrice(price);
				orderItemsDaoImpl.insertOrders(orderItems);
				res.getWriter().println("order placed!!");
				if (currentUser.getPoints() > 500) {
					System.out.println(currentUser.getPoints());

					int points = currentUser.getPoints();

					System.out.println(points);
					// int finalPoints=currentUser.getPoints();

					int convert = (int) Math.round(points * .10);

					System.out.println("fghhgh" + convert);

					order.getUser().setWallet(order.getUser().getWallet() + convert);
					user.updateWalletMoney(order);
					order.getUser().setPoints(0);
					user.updateUserPoints(order);

				}
				res.sendRedirect("Payment.jsp");
			} else {
				System.out.println("Current this product is out of stock");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
		}

	}

}
