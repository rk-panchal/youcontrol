package com.youcontrol.app;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;

public class HibernateUtil {

	private static SessionFactory sessionFactory;
	
	public static SessionFactory getSessionFactory(){
		if(sessionFactory==null){			
			sessionFactory = new AnnotationConfiguration().configure().buildSessionFactory();
		}
		return sessionFactory;
	}
	
}
