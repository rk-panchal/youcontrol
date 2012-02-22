package com.youcontrol.app;

import org.junit.Test;

public class TestStupidThings {

	@Test(expected=NullPointerException.class)
	public void testNullBoolean(){
		Boolean a = null;
		
		if(a){
			System.out.println("It is not so stupid");
		}
		
		
	}
	
}
