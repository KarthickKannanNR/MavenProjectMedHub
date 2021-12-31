package com.medHub.controller;

import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.medHub.dao.UserDaoImpl;
import com.medHub.model.*;

import jakarta.servlet.http.HttpSession;




@WebServlet("/RegisterController")
public class RegisterServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {

		String fullName= req.getParameter("regfullName");
		String mail=req.getParameter("regMail");
		long mobile=Long.parseLong(req.getParameter("regMobile"));
		String password=req.getParameter("regPassword");
		//int age= Integer.parseInt(req.getParameter("regAge"));
//		UserModel user = new UserModel(fullName,age,mobile,mail,password);
//		UserDao userDao= new UserDao();
		User user = new User(fullName,mobile,mail,password);
		UserDaoImpl userDao = new UserDaoImpl();
		userDao.insert(user);
		//userDao.insert(user);
		System.out.println(fullName+""+mobile+""+mail+""+password);
		res.getWriter().print("Registered");
		
		try {
			//HttpSession session = (HttpSession) req.getSession(); 
			
			res.sendRedirect("RegisterWelcomeMessage.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
