package com.youcontrol.controller;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserDao;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class AdminController {

	private final Result result;
	private final UserDao userDao;
	private final ProjectDao projectDao;
	
	public AdminController(Result result, UserDao userDao, ProjectDao projectDao) {
		this.result = result;
		this.userDao = userDao;
		this.projectDao = projectDao;
	}
	
	@Get @Path("/admin")
	public void admin() {
		result.include("users", userDao.listarUsuarios());
		result.include("projects", projectDao.listarProjetos());
	}
	
}
