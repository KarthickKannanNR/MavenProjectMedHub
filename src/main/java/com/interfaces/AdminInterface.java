package com.interfaces;

import java.sql.SQLException;

import com.medHub.model.AdminModel;

public interface AdminInterface {
	
	public AdminModel login(String email, String password) throws SQLException;

}
