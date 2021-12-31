package com.medHub.Controller;

import javax.servlet.http.HttpServlet;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.medHub.Dao.UserDao;
import com.medHub.model.*;

import jakarta.servlet.http.HttpSession;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	@Override
	public void service(HttpServletRequest req,HttpServletResponse res) throws IOException {
		
		String email = req.getParameter("loginMail");
		String password = req.getParameter("loginPassword");
		UserModel user = new UserModel(email,password);
		UserDao userDao = new UserDao();
		UserModel currentuser = userDao.login(user);
		System.out.println("successs");
		System.out.println(email+""+password);
		if(currentuser!=null)
		{
			try {
				//HttpSession session = (HttpSession) req.getSession(); 
				
				res.sendRedirect("UserHome.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}

}
