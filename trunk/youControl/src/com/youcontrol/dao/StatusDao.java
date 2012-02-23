package com.youcontrol.dao;

import java.util.Collection;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Project;
import com.youcontrol.model.Status;

@Component
public class StatusDao extends DefaultDao<Status>{

	public StatusDao(Session session) {
		super(session);
	}

	public Status getFinishedStatus(Project project) {
		Criteria criteria = session.createCriteria(Status.class)
				.add(Restrictions.eq("markAsfinished", true))
				.add(Restrictions.eq("project", project));
		
		List<Status> result  = criteria.list();
		if(result.size()>0){
			return result.get(0);
		}
		return null;
	}

	public Collection<Status> getDefaultStatus() {
		Criteria criteria = session.createCriteria(Status.class).add(Restrictions.isNull("project"));
		return criteria.list();
	}

	public Collection<Status> getStatusByProject(Project project) {
		Criteria criteria = session.createCriteria(Status.class).add(Restrictions.eq("project", project));
		return criteria.list();
	}

}
