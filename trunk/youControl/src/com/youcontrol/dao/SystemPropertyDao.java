package com.youcontrol.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.youcontrol.model.SystemProperty;

public class SystemPropertyDao extends DefaultDao<SystemProperty>{

	
	
	public SystemPropertyDao(Session session) {
		super(session);
	}
	
	public SystemProperty getPropertyByName(String name) {
		Criteria criteria = this.session.createCriteria(SystemProperty.class).add(Restrictions.eq("name", name));
		List<SystemProperty> systemPropertyList = criteria.list();
		if(systemPropertyList.size()>0){
			return systemPropertyList.get(0);
		}
		return null;
	}

}
