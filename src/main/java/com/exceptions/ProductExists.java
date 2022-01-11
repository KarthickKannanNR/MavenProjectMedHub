package com.exceptions;

public class ProductExists extends Exception{
	
	String message="Product Already exists";
	
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
