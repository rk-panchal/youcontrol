package com.youcontrol.controller;

import java.util.Date;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserProjects;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ProjectController {

	private final Result result;
	private final UserWeb userWeb;
	private final ProjectDao dao;
	private final UserProjectsDao userProjectsDao;
	
	public ProjectController(Result result, UserWeb userWeb, ProjectDao dao, UserProjectsDao userProjectsDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.dao = dao;
		this.userProjectsDao = userProjectsDao;
	}
	
	@Get @Path("/projects")
	public void projects() {
		result.include("projetos", userProjectsDao.listarProjDoUsuario(userWeb.getUser()));
	}
	
	@Get @Path("/projects/new")
	public void newProject() {
	}
	@Post @Path("/projects/new")
	public void salvar(Project project) {
		Date date = new Date();
		project.setDataDeCriacao(date);
		Long id = dao.criarProjeto(project);
		project.setId(id);
		
		UserProjects userP = new UserProjects();
		userP.setProject(project);
		userP.setUser(userWeb.getUser());
		userP.setRole("admin");
		
		userProjectsDao.criar(userP);
		
		result.redirectTo(this).choose(project);
	}
	
	@Get @Path("/choose/{project.id}")
	public void choose(Project project) {
		Project projeto = dao.carregar(project.getId());
		userWeb.setProject(projeto);
		
		result.redirectTo(OwnProjectController.class).overview();
	}
	
}
