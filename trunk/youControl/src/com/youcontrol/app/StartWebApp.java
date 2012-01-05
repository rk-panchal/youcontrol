package com.youcontrol.app;

import org.eclipse.jetty.server.Server;
import org.eclipse.jetty.server.SessionManager;
import org.eclipse.jetty.server.session.HashSessionManager;
import org.eclipse.jetty.server.session.SessionHandler;
import org.eclipse.jetty.webapp.WebAppContext;



public class StartWebApp {
	
	
	public static void main(String[] args) {
		Server server = new Server(8180);
		
        WebAppContext context = new WebAppContext();
        context.setDescriptor("./WebContent/WEB-INF/web.xml");
        context.setResourceBase("./WebContent/");
        context.setContextPath("/");
        context.setParentLoaderPriority(true);
        
        
        SessionManager hashSessionManager = new HashSessionManager();

        SessionHandler sessionHandler = new SessionHandler(hashSessionManager);
        
        
        try {
			context.setSessionHandler(sessionHandler);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
        
        
        server.setHandler(context);
 
        try {
			server.start();
			server.join();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	

}
