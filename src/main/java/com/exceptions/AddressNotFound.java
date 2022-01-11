package com.exceptions;

public class AddressNotFound extends Exception{
	
	
	String message="Address Not Found,Please update your Address";
	
	@Override
	public String getMessage()
	{
		return message;
	}

	@Override
	public String toString() {
		return message;
	}
	
}
