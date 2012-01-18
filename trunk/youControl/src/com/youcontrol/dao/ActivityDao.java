package com.youcontrol.dao;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.youcontrol.model.Activity;

import br.com.caelum.vraptor.ioc.Component;

@Component
public class ActivityDao extends DefaultDao<Activity>{

	private Session session;
	
	public ActivityDao(Session session) {
		super(session);
	}
	
	public void criarAtividade(Activity activity) {
		session.merge(activity);
	}
	
	public Activity carregar(Activity activity) {
		return (Activity) session.createCriteria(Activity.class).add(Restrictions.eq("id", activity.getId())).uniqueResult();
	}
}
