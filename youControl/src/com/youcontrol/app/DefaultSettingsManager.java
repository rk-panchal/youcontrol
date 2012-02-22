package com.youcontrol.app;


import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.youcontrol.dao.StatusDao;
import com.youcontrol.dao.SystemPropertyDao;
import com.youcontrol.model.Status;
import com.youcontrol.model.SystemProperty;
import com.youcontrol.service.StatusService;
import com.youcontrol.service.SystemPropertyService;

public class DefaultSettingsManager {
	
	Logger log = Logger.getLogger(this.getClass());
	
	public DefaultSettingsManager() {
		log.info("Creating default settings manager");
	}

	public void populateDefaultValues(){
		log.info("Check if is configured");
		Boolean isSetDefaultValues = isSetDefaultValues();
		log.info("Is set default values: " + isSetDefaultValues);
		if(!isSetDefaultValues){
			log.info("Not set yet, configuring default values");
			
			Session session = HibernateUtil.getSessionFactory().openSession();
			Transaction tx = session.beginTransaction();
			
			setStatus(session);
			markAsPopulated(session);
			
			tx.commit();
			session.close();
		}
	}

	private void markAsPopulated(Session session) {
		log.info("Setting system as configured with default values");
		SystemProperty alreadyPopulated = new SystemProperty(DefaulProperties.DEFAULT_VALUES.name(), Boolean.TRUE.toString());
		SystemPropertyService systemPropertyService = new SystemPropertyService(new SystemPropertyDao(session));
		systemPropertyService.save(alreadyPopulated);
	}

	private boolean isSetDefaultValues() {
		Session session = HibernateUtil.getSessionFactory().openSession();
		SystemPropertyService systemPropertyService = new SystemPropertyService(new SystemPropertyDao(session));
		SystemProperty alreadyPopulated = systemPropertyService.getSystemPropertyByName(DefaulProperties.DEFAULT_VALUES.name());
		return alreadyPopulated !=null && alreadyPopulated.getValue().equals(true);
	}

	private void setStatus(Session session) {
		log.info("Setting default status");
		StatusService statusService = new StatusService(new StatusDao(session));
		List<Status> statusList = getStatusList();
		for(Status status : statusList){
			statusService.save(status, null);
		}
	}

	private List<Status> getStatusList() {
		List<Status> statusList = new ArrayList<Status>();
		
		statusList.add(new Status("N", "Novo"));
		statusList.add(new Status("A", "Aberto"));
		statusList.add(new Status("R", "Aguardando retorno"));
		statusList.add(new Status("E", "Em execução"));
		statusList.add(new Status("F", "Finalizado", true));
		
		return statusList;
	}
	
}
