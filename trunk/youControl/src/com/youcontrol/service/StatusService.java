package com.youcontrol.service;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.dao.StatusDao;
import com.youcontrol.model.Project;
import com.youcontrol.model.Status;

@Component
public class StatusService {

	StatusDao statusDao;
	
	public StatusService(StatusDao statusDao) {
		this.statusDao = statusDao;
	}
	
	public void save(Status status){
		this.save(status, null);
	}
	
	public void save(Status status, Project project){
		if(status.getMarkAsfinished()){
			Status finishedStatus = statusDao.getFinishedStatus(project);
			if(finishedStatus!=null){
				finishedStatus.setMarkAsfinished(false);
				statusDao.save(finishedStatus);
			}
		}
		statusDao.save(status);
	}

	public List<Status> getStatusByProject(Project project) {
		List<Status> statusList = new ArrayList<Status>();
		statusList.addAll(statusDao.getDefaultStatus());
		statusList.addAll(statusDao.getStatusByProject(project));
		return statusList;
	}
	
}
