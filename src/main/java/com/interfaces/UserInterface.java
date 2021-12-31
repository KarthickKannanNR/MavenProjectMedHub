package com.interfaces;

import java.util.List;

import com.medHub.model.OrderModel;
import com.medHub.model.UserModel;

public interface UserInterface {

	public void insert(UserModel user);
	public UserModel login(String email,String password);
	public List<UserModel> ViewAllUser();
	public int update (UserModel currentUser);
	public UserModel getUserById(int userId);
	public boolean deleteUser(int userId);
	public void addMoneyInWallet(double walletAmount,UserModel currentUser);
	public void updateUserPoints(OrderModel order);
}
