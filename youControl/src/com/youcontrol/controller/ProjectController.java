package com.youcontrol.controller;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.model.Project;
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
	
	public ProjectController(Result result, UserWeb userWeb, ProjectDao dao) {
		this.result = result;
		this.userWeb = userWeb;
		this.dao = dao;
	}
	
	@Get @Path("/projects")
	public void projects() {
		result.include("projetos", dao.listarProjetos());
	}
	
	@Get @Path("/projects/new")
	public void newProject() {
	}
	@Post @Path("/projects/new")
	public void salvar(Project project) {
		Long id = dao.criarProjeto(project);
		System.out.println("Criado: " + id);
		result.redirectTo(this).newProject();
	}
	
	@Get @Path("/choose/{project.id}")
	public void choose(Project project) {
		Project projeto = dao.carregar(project.getId());
		userWeb.setProject(projeto);
		
		result.redirectTo(OwnProjectController.class).overview();
	}
	
}
