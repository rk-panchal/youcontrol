package com.youcontrol.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.VersionDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.Project;
import com.youcontrol.model.User;
import com.youcontrol.model.Version;

@Component
public class ActivityService {

	private ActivityDao activityDao;
	private VersionDao versionDao;
	
	public ActivityService(ActivityDao activityDao, VersionDao versionDao) {
		this.activityDao = activityDao;
		this.versionDao = versionDao;
	}
	
	public void save(Activity activity, Project project, User user, Long[] versions){
		if(activity.getId()==null){
			create(activity, project, user, versions);
		}else{
			update(activity, project, user, versions);
		}
	}

	private void update(Activity activity, Project project, User user, Long[] versions){
		Activity activityToUpdate = activityDao.get(activity);
		
		activityToUpdate.setSummary(activity.getSummary());
		activityToUpdate.setDescription(activity.getDescription());
		activityToUpdate.setAssignedTo(activity.getAssignedTo());
		activityToUpdate.setVersions(getVersionList(versions));
		
		activityDao.save(activityToUpdate);
	}
	
	private void create(Activity activity, Project project, User user, Long[] versions) {
		if (activity.getAssignedTo().getId() == null) activity.setAssignedTo(null);
		
		Date date = new Date();
		activity.setCreatedAt(date);
		activity.setCreatedBy(user);
		activity.setProject(project);		
		activity.setVersions(getVersionList(versions));
		
		activityDao.save(activity);
	}

	private List<Version> getVersionList(Long[] versions) {
		List<Version> versionList = new ArrayList<Version>();
		if(versions!=null){
			for(Long versionId : versions){
				Version version = versionDao.get(Version.class, versionId);
				versionList.add(version);
			}
		}
		return versionList;
	}
	
	
}
