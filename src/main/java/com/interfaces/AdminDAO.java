package com.interfaces;

import java.sql.SQLException;

import com.medHub.model.Admin;

public interface AdminDAO {
	
	public Admin login(String email, String password) throws SQLException;

}
