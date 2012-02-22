package com.youcontrol.service;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.dao.SystemPropertyDao;
import com.youcontrol.model.SystemProperty;

@Component
public class SystemPropertyService {

	SystemPropertyDao systemPropertyDao;
	
	public SystemPropertyService(SystemPropertyDao systemPropertyDao) {
		this.systemPropertyDao = systemPropertyDao;
	}
	
	public void save(SystemProperty systemProperty){
		SystemProperty existentSystemProperty = systemPropertyDao.getPropertyByName(systemProperty.getName());
		if(existentSystemProperty!=null){
			existentSystemProperty.setValue(systemProperty.getValue());
			systemPropertyDao.save(existentSystemProperty);
		}else{
			systemPropertyDao.save(systemProperty);
		}
	}

	public SystemProperty getSystemPropertyByName(String name) {
		return this.systemPropertyDao.getPropertyByName(name);
	}
	
}
