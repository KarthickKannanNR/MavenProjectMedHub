package com.exceptions;

public class UserExists extends Exception{
	
String message="This User Already Registered";
	
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
