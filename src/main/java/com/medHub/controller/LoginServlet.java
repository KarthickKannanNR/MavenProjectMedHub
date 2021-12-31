package com.medHub.controller;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.medHub.dao.AdminDaoImpl;
import com.medHub.dao.UserDaoImpl;
import com.medHub.model.*;

import jakarta.servlet.http.HttpSession;


@WebServlet("/LoginController")
public class LoginServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		String email = req.getParameter("loginMail").toLowerCase();
		String password = req.getParameter("loginPassword");
		User user;
		UserDaoImpl userDao = new UserDaoImpl();
		Admin admin;
		AdminDaoImpl admindao= new AdminDaoImpl();
		boolean currentuser = false;
		System.out.println("successs");
		System.out.println(email+""+password);
	
		try {
			//HttpSession session = (HttpSession) req.getSession(); 
			
		if(email.endsWith("gmail.com"))
		{
			user=new User(email,password);
			currentuser= userDao.login(user);
			if(currentuser)
			{
				
				res.sendRedirect("UserHome.jsp");
			}
			else
			{
				try {
					admin=new Admin(email,password);
					Admin adminModule= admindao.login(admin);
					if(adminModule!=null)
					{
						res.sendRedirect("AdminHome.jsp");

					}
					else
					{
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		
		else {
			
		}
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
	}

}
