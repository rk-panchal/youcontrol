package com.youcontrol.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.view.Results;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.images.ImageProject;
import com.youcontrol.model.Project;
import com.youcontrol.model.User;
import com.youcontrol.model.UserAssignment;
import com.youcontrol.model.UserWeb;
import com.youcontrol.model.Version;

@Resource
public class ProjectController {

	private final Result result;
	private final UserWeb userWeb;
	private final UserDao userDao;
	private final ProjectDao projectDao;
	private final UserProjectsDao userProjectsDao;
	private final ImageProject imageProject;
	
	public ProjectController(Result result, 
							 UserWeb userWeb, 
							 UserDao userDao,
							 ProjectDao projectDao, 
							 UserProjectsDao userProjectsDao,
							 ImageProject imageProject) {
		this.result = result;
		this.userWeb = userWeb;
		this.userDao = userDao;
		this.projectDao = projectDao;
		this.userProjectsDao = userProjectsDao;
		this.imageProject = imageProject;
	}
	
	@Get @Path("/projects")
	public void projects() {
		result.include("projetos", userProjectsDao.listProjectsByUser(userWeb.getUser()));
	}
	
	@Get @Path("/project/new")
	public void newProject() {
	}
	@Post @Path("/project/new")
	public void salvar(Project project) {
		Date date = new Date();
		project.setDataDeCriacao(date);
		Long id = projectDao.criarProjeto(project);
		project.setId(id);
		
		userProjectsDao.criar(project, userWeb.getUser(), "admin");
		
		result.redirectTo(this.getClass()).overview(project);
	}
	
	
	@Post @Path("/image/project/{project.id}")
	public void uploadImg(Project project, final UploadedFile arquivo) {
		System.out.println("usuario id:" + project.getId() + " arq:"+arquivo);
		imageProject.upload(arquivo, project);
		result.redirectTo(this.getClass()).overview(project);
	}
	@Get @Path("/image/project/{project.id}")
	public File showImageProject(Project project) {
		return imageProject.showImage(project);
	}
	

	@Get @Path("/project/{project.id}")
	public void overview(Project project) {
		/* LOAD ONLY USERS THAT AREN'T IN THE PROJECT */
		List<User> usersInSystem = userDao.listarUsuarios();
		List<UserAssignment> usersProject =  userProjectsDao.listUserAssignmentsByProject(project);
		
		List<Version> versions = userProjectsDao.getVersionsFromProject(project.getId());
		
		List<User> usersNotInProject = new ArrayList<User>();
		
		List<User> usersInProject = new ArrayList<User>();
		for (UserAssignment userProject : usersProject) {
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
	
	@Post @Path("/project/{project.id}/addUser")
	public void addUserToProject(User user, Project project) {
		userProjectsDao.criar(userWeb.getProject(), user, "desenv");
		
		String retorno = "added";
		result.use(Results.json()).from(retorno).serialize();
	}

	
}
