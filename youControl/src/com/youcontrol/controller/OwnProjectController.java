package com.youcontrol.controller;

import java.util.ArrayList;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.model.Project;
import com.youcontrol.model.User;
import com.youcontrol.model.UserProjects;
import com.youcontrol.model.UserWeb;
import com.youcontrol.model.Version;

@Resource
public class OwnProjectController {
	
	private final Result result;
	private final UserWeb userWeb;
	private final UserDao userDao;
	private final UserProjectsDao userProjectsDao;
	
	public OwnProjectController(Result result, 
								UserWeb userWeb, 
								UserDao userDao,
								UserProjectsDao userProjectsDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.userDao = userDao;
		this.userProjectsDao = userProjectsDao;
	}

	@Get @Path("/projects/{project.id}")
	public void overview(Project project) {
		/* LOAD ONLY USERS THAT AREN'T IN THE PROJECT */
		List<User> usersInSystem = userDao.listarUsuarios();
		List<UserProjects> usersProject =  userProjectsDao.listarUsuariosDoProj(project);
		
		List<Version> versions = userProjectsDao.getVersionsFromProject(project.getId());
		
		List<User> usersNotInProject = new ArrayList<User>();
		
		List<User> usersInProject = new ArrayList<User>();
		for (UserProjects userProject : usersProject) {
			usersInProject.add(userProject.getUser());
		}
		
		for (User user : usersInSystem) {
			if (!usersInProject.contains(user)) {
				usersNotInProject.add(user);
			}
		}
		result.include("versions", versions);
		result.include("usuarios", usersNotInProject);
	}
	
	@Post @Path("/projects/{project.id}/addUser")
	public void addUserToProject(User user, Project project) {
		userProjectsDao.criar(userWeb.getProject(), user, "desenv");
		
		String retorno = "added";
		result.use(Results.json()).from(retorno).serialize();
	}
	
}
