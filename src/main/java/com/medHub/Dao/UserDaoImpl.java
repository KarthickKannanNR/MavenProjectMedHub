package com.medHub.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.interfaces.UserDAO;
import com.medHub.model.Order;
import com.medHub.model.Product;
import com.medHub.model.User;
import com.medHub.util.ConnectionUtil;
public class UserDaoImpl implements UserDAO{
	
	
public void insert(User user) {
		System.out.println(user.getName()+""+user.getUserPassword()+""+user.getUserMail()+user.getUserMobile());
	try {
		String ins="insert into users (full_name,user_mobile,user_password,user_email) values(?,?,?,?)";
		String commit="commit";
		Connection con=ConnectionUtil.getDBconnect();
		PreparedStatement pst=con.prepareStatement(ins);
		pst.setString(1, user.getName());
		pst.setLong(2,user.getUserMobile());
		pst.setString(3,user.getUserPassword());
		pst.setString(4, user.getUserMail());
		int res=pst.executeUpdate();	
		PreparedStatement smt= con.prepareStatement(commit);
		smt.execute();
		pst.close();
		con.close();
		System.out.println( "SUCESSFULLY REGISTERED");}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
		
	}
		
	}
	

public User login(User user)
{
	System.out.println(user.getUserMail());
	System.out.println(user.getUserPassword());
	User loginUser=null;
	try {
	
	String check="select * from users where user_email='"+user.getUserMail()+"' and user_password='"+user.getUserPassword()+"'";
	Connection con= ConnectionUtil.getDBconnect();
	Statement stm=con.createStatement();
	int i=stm.executeUpdate(check);
	ResultSet rs = stm.executeQuery(check);
//	if(i>0) {
//		return loginUser;
//	}

	
	if(rs.next())
	{	
		user=new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),
		rs.getLong(7),rs.getString(8),rs.getInt(9));
		System.out.println(rs.getString(4));
		System.out.println(rs.getDouble(5));
		System.out.println("login sucessfulls");
		return user;
	}
	
		}
	catch(Exception e)
	{
		System.out.println(e.getMessage());
//		e.printStackTrace();
	}
	return loginUser;

	}

	
public List<User> ViewAllUser()
{
	List<User> userList = new ArrayList<User>();
	try {
	String viewUsers= "select * from users";
	Connection conn=ConnectionUtil.getDBconnect();
	Statement stm = conn.createStatement();
	ResultSet rs= stm.executeQuery(viewUsers);
	
	
		rs= stm.executeQuery(viewUsers);
		while(rs.next())
		{
			User allUsers= new User(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getDouble(5),rs.getString(6),rs.getLong(7),rs.getString(8),rs.getInt(9));
			userList.add(allUsers);
			
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 
	return userList;
	
}
	
	


	public int update (User currentUser) {
		System.out.println(currentUser);
		String update = null;
		try {
			update = "update users set full_name=?,user_password=?,user_mobile=? where user_email='"+currentUser.getUserMail()+"'";
			Connection con=ConnectionUtil.getDBconnect();
			PreparedStatement pst=con.prepareStatement(update);
			pst.setString(1, currentUser.getName());
			pst.setString(2, currentUser.getUserPassword());
			pst.setLong(3,currentUser.getUserMobile());
			int res=pst.executeUpdate();
			pst=con.prepareStatement("commit");
			res=pst.executeUpdate();
			if(res>0)
			{
			System.out.println("Profile Updated Sucessfully");
			}
			else
			{
				
			}
			pst.close();
			con.close();
			return res;
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(update);
				
	 return 0;
	}
	
	public User getUserById(int userId)
	{
		String getuserId="select * from users where user_id=?";
		Connection con=null;
		PreparedStatement pstatement = null;
		User userModule = null;
		
		 con = ConnectionUtil.getDBconnect();
		 try {
			pstatement = con.prepareStatement(getuserId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());
		}
		 try {
			pstatement.setInt(1, userModule.getUserId());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());

		}
		 try {
			ResultSet rs = pstatement.executeQuery(getuserId);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage());

		}
		
		return userModule;
		
	}
	
	
	public boolean deleteUser(int userId) 
	{
		
		Connection con = null;
		PreparedStatement pst =null;
		int deleteStatus=0;
		int result=0;
		try {
		con= ConnectionUtil.getDBconnect();
		String delete="update users set account_status ='inactive' where user_id=?";
		 	pst=con.prepareStatement(delete);
			pst.setInt(1, userId);
			result=pst.executeUpdate();
			 
		}catch(Exception e)
		{
			System.out.println(e.getMessage());
		}
			if(result>0)
			{
				return true;
			}
			else 
				return false;
		
		}


//														ADD MONEY TO WALLET
	
		public void addMoneyInWallet(double walletAmount,User currentUser) {
			
			System.out.println("old amount"+currentUser.getWallet());
			double addAmount=currentUser.getWallet()+walletAmount;
			currentUser.setWallet(addAmount);
			System.out.println("new amount"+addAmount);
			String walletQuery="update users set user_wallet ="+addAmount+" where user_email ='"+currentUser.getUserMail()+"'";
			Connection con = ConnectionUtil.getDBconnect();
			try {
				PreparedStatement ps = con.prepareStatement(walletQuery);
				ps.executeUpdate();
				con.prepareStatement("commit");
				ps.executeUpdate();
				System.out.println("Money added to wallet");
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println(e.getMessage());
			}
			
		
			}
		
		public void updateUserPoints(Order order)
		{
			try {
			String pointsQuery="update users set points='"+order.getUser().getPoints()+"' where user_id = '"+order.getUser().getUserId()+"'";
			Connection con = ConnectionUtil.getDBconnect();
			PreparedStatement ps = con.prepareStatement(pointsQuery);
			ps.executeUpdate();
			ps=con.prepareStatement("commit");
			ps.executeUpdate();
			}
			catch(Exception e)
			{
			System.out.println(e.getMessage());	
			}
			
		}
	
		public void updateWalletMoney(Order order)
		{
			
			String query="update users set user_wallet='"+order.getUser().getWallet()+"' where user_id = '"+order.getUser().getUserId()+"'";
			Connection con = ConnectionUtil.getDBconnect();
			try {
				PreparedStatement ps  = con.prepareStatement(query);
				ps.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		public int forgetPassword(int userId)
		{
			String query="select * from users where user_id='"+userId+"'";
			try {
				Connection con = ConnectionUtil.getDBconnect();
				PreparedStatement ps = con.prepareStatement(query);
				ResultSet rs = ps.executeQuery(query);
				
				if(rs.next())
				{
					return 1;
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;
		}


		public int updatePassword(String confirmPassword,int userId) {
			try {
			String updatePassword="update users set user_password='"+confirmPassword+"' where user_id='"+userId+"'";
			Connection con = ConnectionUtil.getDBconnect();
			PreparedStatement ps = con.prepareStatement(updatePassword);
			int result=ps.executeUpdate();
			con.prepareStatement("commit");
			ps.executeUpdate();
			if(result>0)
			{
				return 1;
			}
			}catch(Exception e)
			{
				System.out.println(e.getMessage());
			}
			
			return 0;			
		}


		@Override
		public User login(String email, String password) {
			// TODO Auto-generated method stub
			return null;
		}
	
	
}
	



