package com.youcontrol.app;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.apache.log4j.Logger;
import org.eclipse.jetty.util.log.Log;

public class StartupListener implements ServletContextListener {
	
	Logger log = Logger.getLogger(this.getClass());

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		log.info("Starting up yc");		
		DefaultSettingsManager defaultSettingsManager = new DefaultSettingsManager();
		defaultSettingsManager.populateDefaultValues();
	}

}
