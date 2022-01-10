package com.interfaces;

import java.util.List;

import com.medHub.model.Order;
import com.medHub.model.User;

public interface UserDAO {

	public void insert(User user);
	public List<User> ViewAllUser();
	public int update (User currentUser);
	public User getUserById(int userId);
	public boolean deleteUser(int userId);
	public int addMoneyInWallet(double walletAmount,User currentUser);
	public void updateUserPoints(Order order);
	public User login(User user);
}
