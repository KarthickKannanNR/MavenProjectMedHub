package com.exceptions;

public class InsuffientMoney extends Exception{
	
	String message="Not enough Money In Wallet";
	
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
