package com.youcontrol.app;
import org.junit.Assert;
import org.junit.Test;

import com.youcontrol.app.DefaulProperties;


public class TestDefaultProperties {

	@Test
	public void testDefaultProperties(){
		
		Assert.assertEquals("DEFAULT_VALUES", DefaulProperties.DEFAULT_VALUES.name());
		
	}
	
}
