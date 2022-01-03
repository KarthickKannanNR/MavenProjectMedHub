package com.medHub.controller;

import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.medHub.dao.AdminDaoImpl;
import com.medHub.dao.UserDaoImpl;
import com.medHub.model.*;




@WebServlet("/LoginController")
public class LoginServlet extends HttpServlet {
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException, ServletException {
		HttpSession session = req.getSession();
		String email = req.getParameter("loginMail").toLowerCase();
		String password = req.getParameter("loginPassword");
		User user;
		UserDaoImpl userDao = new UserDaoImpl();
		Admin admin;
		AdminDaoImpl admindao= new AdminDaoImpl();
		User currentuser;	
		try {
			
		if(email.endsWith("gmail.com"))
		{
			user=new User(email,password);
			currentuser= userDao.login(user);
			
			
			if(currentuser!=null)
			{
				session.setAttribute("user", currentuser);
				res.sendRedirect("UserHome.jsp");
			}
			else
			{
//				session1.setAttribute("error", "invalid username or password");
				req.getRequestDispatcher("Index.jsp").forward(req, res);
				System.out.println("invalid username or password");
			}
		}else
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
					System.out.println("invalid username or password");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			
		}
		
		
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
		
	}

}
