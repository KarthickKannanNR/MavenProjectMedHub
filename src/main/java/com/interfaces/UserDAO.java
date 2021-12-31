package com.interfaces;

import java.util.List;

import com.medHub.model.Order;
import com.medHub.model.User;

public interface UserDAO {

	public void insert(User user);
	public User login(String email,String password);
	public List<User> ViewAllUser();
	public int update (User currentUser);
	public User getUserById(int userId);
	public boolean deleteUser(int userId);
	public void addMoneyInWallet(double walletAmount,User currentUser);
	public void updateUserPoints(Order order);
}
