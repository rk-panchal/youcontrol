package com.youcontrol.dao;

import org.apache.log4j.Logger;
import org.hibernate.Session;

import com.youcontrol.model.EntityObject;

import br.com.caelum.vraptor.ioc.Component;

@Component
public class DefaultDao<E extends EntityObject> {
	
	Logger log = Logger.getLogger(this.getClass());
	
	protected final Session session;
	
	public DefaultDao(Session session) {
		this.session = session;
	}
	
	public void save(E entity){
		this.session.save(entity);
	}
	
	public E load(E entityObject){
		log.info(entityObject);
		return (E) this.session.get(entityObject.getClass(), entityObject.getId());
	}

}
