package com.youcontrol.controller;

import java.io.File;
import java.util.Date;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.images.ImageProject;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserProjects;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class ProjectController {

	private final Result result;
	private final UserWeb userWeb;
	private final ProjectDao dao;
	private final UserProjectsDao userProjectsDao;
	private final ImageProject imageProject;
	
	public ProjectController(Result result, 
							 UserWeb userWeb, 
							 ProjectDao dao, 
							 UserProjectsDao userProjectsDao,
							 ImageProject imageProject) {
		this.result = result;
		this.userWeb = userWeb;
		this.dao = dao;
		this.userProjectsDao = userProjectsDao;
		this.imageProject = imageProject;
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
	
	@Post @Path("/image/project/{project.id}")
	public void uploadImg(Project project, final UploadedFile arquivo) {
		System.out.println("usuario id:" + project.getId() + " arq:"+arquivo);
		imageProject.upload(arquivo, project);
		result.redirectTo(this).choose(project);
	}
	@Get @Path("/image/project/{project.id}")
	public File showImageProject(Project project) {
		return imageProject.showImage(project);
	}
	
}
