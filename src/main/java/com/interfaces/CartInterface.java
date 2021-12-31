package com.interfaces;

import java.util.List;

import com.medHub.model.CartModel;
import com.medHub.model.UserModel;

public interface CartInterface {

	public void insertProduct(CartModel cart);
	public List<CartModel> viewCart(UserModel currentUser);
}
