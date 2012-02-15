package com.youcontrol.dao;

import org.hibernate.Session;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Activity;

@Component
public class ActivityDao extends DefaultDao<Activity>{
	
	public ActivityDao(Session session) {
		super(session);
	}
}
