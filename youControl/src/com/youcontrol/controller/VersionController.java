package com.youcontrol.controller;

import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.dao.VersionDao;
import com.youcontrol.images.ImageProject;
import com.youcontrol.model.Activity;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserWeb;
import com.youcontrol.model.Version;

@Resource
public class VersionController {

	private final Result result;
	private final ProjectDao projectDao;
	private final VersionDao versionDao;
	
	public VersionController(Result result, 
							 UserWeb userWeb, 
							 UserDao userDao,
							 ProjectDao projectDao, 
							 VersionDao versionDao,
							 UserProjectsDao userProjectsDao,
							 ImageProject imageProject) {
		this.result = result;
		this.projectDao = projectDao;
		this.versionDao = versionDao;
	}
	
	@Get @Path("/project/{project.id}/version/new")
	public void newVersion(Project project){
		project = projectDao.get(project);
		result.include("project", project);
	}
	
	
	@Post @Path("/project/{project.id}/version/new")
	public void newVersion(Project project, Version version){
		Project projectVersion = projectDao.get(project);
		version.setProject(projectVersion);
		versionDao.save(version);
		
		this.result.redirectTo(ProjectController.class).overview(project);
	}
	
	@Get @Path("/version/{version.id}")
	public void version(Version version) {
		version = versionDao.get(version);
		List<Activity> activities = version.getActivities();
		this.result.include("version", version);
		this.result.include("activities", activities);
	}
}
