package com.medHub.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medHub.dao.CartDaoImpl;
import com.medHub.dao.OrderDaoImpl;
import com.medHub.dao.OrderItemsDaoImpl;
import com.medHub.dao.ProductDaoImpl;
import com.medHub.dao.UserDaoImpl;
import com.medHub.model.Cart;
import com.medHub.model.Order;
import com.medHub.model.OrderItems;
import com.medHub.model.Product;
import com.medHub.model.User;

@WebServlet("/cartOrder")
public class CartOrderServlet extends HttpServlet {

	public void service(HttpServletRequest req, HttpServletResponse res) throws IOException {
		HttpSession session = req.getSession();
		System.out.println("cart servlet called");
		UserDaoImpl user = new UserDaoImpl();
		System.out.println("1");
		ProductDaoImpl productDao = new ProductDaoImpl();
		Product product = new Product();
		OrderItems orderItems = new OrderItems();
		Cart cart = new Cart();
		CartDaoImpl cartdao = new CartDaoImpl();
		System.out.println("2");
		Order order = new Order();
		OrderDaoImpl orderDao = new OrderDaoImpl();
		OrderItemsDaoImpl orderItemsDaoImpl = new OrderItemsDaoImpl();
		System.out.println("2");

		User currentUser = (User) session.getAttribute("user");

		int CartproductId = Integer.parseInt(req.getParameter("CartproductId"));
		System.out.println(req.getParameter("cartQuantity"));
		System.out.println("4");
		int cartQuantity = Integer.parseInt(req.getParameter("cartQuantity"));
		double unitPrice = Double.parseDouble(req.getParameter("unitPrice"));
		double totalPrice = Double.parseDouble(req.getParameter("totalPrice"));
		int cartpoints = Integer.parseInt(req.getParameter("cartpoints"));
		int CartprodId = Integer.parseInt(req.getParameter("CartproductId"));
		int removeStatus;
		System.out.println("5");

		Product currentProduct = productDao.findProductByProductId(CartproductId);
		cart.setProduct(currentProduct);
		cart.setUser(currentUser);
		
		if (currentProduct.getQuantity() != 0 && (currentProduct.getQuantity() - cartQuantity) > 0) {

			if ((currentUser.getWallet() - totalPrice) >= 0) {
				System.out.println();
				order.setProduct(currentProduct);
				int updateQty = currentProduct.getQuantity() - cartQuantity;
				System.out.println(currentProduct.getQuantity());
				System.out.println(cartQuantity);

				try {
					productDao.updateProductQuantity(currentProduct, updateQty);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				order.setPrice(totalPrice);
				order.setUser(currentUser);
				order.getUser().setPoints(currentProduct.getPoints() + currentUser.getPoints());
				order.getUser().setWallet(currentUser.getWallet() - totalPrice);
				System.out.println("Order called");
				orderDao.orders(order, currentUser);
				user.updateUserPoints(order);
				user.updateWalletMoney(order);
				int orderId=orderDao.getByOrderId();
				System.out.println("order id found"+orderId);
				orderItems.setProduct(currentProduct);
				orderItems.setUser(currentUser);
				orderItems.setOrderId(orderId);
				orderItems.setQuantity(cartQuantity);
				orderItems.setUnitPrice(unitPrice);
				orderItems.setTotalPrice(totalPrice);
				int result=	orderItemsDaoImpl.insertOrders(orderItems);
				try {
					removeStatus=cartdao.removecartItems(cart);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}


			}
			else {
				System.out.println("Not Enough Money");
			}
		} else {
			res.sendRedirect("UserProfile.jsp");

		}
//		if (currentUser.getPoints() > 500) {
//		System.out.println(currentUser.getPoints());
//		int points = currentUser.getPoints();
//		System.out.println(points);
//		int finalPoints=currentUser.getPoints();
//		int convert = (int) Math.round(points * .10);
//		System.out.println("fghhgh" + convert);
//		order.getUser().setWallet(order.getUser().getWallet() + convert);
//		user.updateWalletMoney(order);
//		order.getUser().setPoints(0);
//		user.updateUserPoints(order);
//
//	}

	}
}
