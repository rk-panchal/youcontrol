package com.youcontrol.dao;

import org.hibernate.Session;

import com.youcontrol.model.Activity;

import br.com.caelum.vraptor.ioc.Component;

@Component
public class ActivityDao {

	private final Session session;
	
	public ActivityDao(Session session) {
		this.session = session;
	}
	
	public void criarAtividade(Activity activity) {
		session.save(activity);
	}
	
}
