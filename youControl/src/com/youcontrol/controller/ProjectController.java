package com.youcontrol.controller;

import java.io.File;
import java.util.Date;


import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.images.ImageProject;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

import com.youcontrol.dao.VersionDao;
import com.youcontrol.model.Version;

@Resource
public class ProjectController {

	private final Result result;
	private final UserWeb userWeb;
	private final ProjectDao projectDao;
	private final VersionDao versionDao;
	private final UserProjectsDao userProjectsDao;
	private final ImageProject imageProject;
	
	public ProjectController(Result result, 
							 UserWeb userWeb, 
							 ProjectDao projectDao, 
							 VersionDao versionDao,
							 UserProjectsDao userProjectsDao,
							 ImageProject imageProject) {
		this.result = result;
		this.userWeb = userWeb;
		this.projectDao = projectDao;
		this.versionDao = versionDao;
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
		Long id = projectDao.criarProjeto(project);
		project.setId(id);
		
		userProjectsDao.criar(project, userWeb.getUser(), "admin");
		
		result.redirectTo(OwnProjectController.class).overview(project);
	}
	
	@Get @Path("/projects/{project.id}/version/new")
	public void newVersion(Project project){
		project = projectDao.get(project);
		result.include("project", project);
	}
	
	@Post @Path("/projects/{project.id}/version/new")
	public void newVersion(Project project, Version version){
		System.out.println("neeew");
		Project projectVersion = projectDao.get(project);
		
		version.setProject(projectVersion);
		System.out.println("save..");
		
		versionDao.save(version);
		System.out.println("redirecting..");
		
		this.result.redirectTo(OwnProjectController.class).overview(project);
	}
	
	@Post @Path("/image/project/{project.id}")
	public void uploadImg(Project project, final UploadedFile arquivo) {
		System.out.println("usuario id:" + project.getId() + " arq:"+arquivo);
		imageProject.upload(arquivo, project);
		result.redirectTo(OwnProjectController.class).overview(project);
	}
	@Get @Path("/image/project/{project.id}")
	public File showImageProject(Project project) {
		return imageProject.showImage(project);
	}
	
}
