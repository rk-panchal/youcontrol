package com.youcontrol.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.CommentActivityDao;
import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.CommentActivity;
import com.youcontrol.model.Project;
import com.youcontrol.model.User;
import com.youcontrol.model.UserProjects;
import com.youcontrol.model.UserWeb;
import com.youcontrol.model.Version;

@Resource
public class OwnProjectController {
	
	private final Result result;
	private final UserWeb userWeb;
	private final ProjectDao projectDao;
	private final ActivityDao activityDao;
	private final UserDao userDao;
	private final UserProjectsDao userProjectsDao;
	private final CommentActivityDao commentActivityDao;
	
	public OwnProjectController(Result result, 
								UserWeb userWeb, 
								ProjectDao projectDao, 
								ActivityDao activityDao,
								UserDao userDao,
								UserProjectsDao userProjectsDao,
								CommentActivityDao commentActivityDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.projectDao = projectDao;
		this.activityDao = activityDao;
		this.userDao = userDao;
		this.userProjectsDao = userProjectsDao;
		this.commentActivityDao = commentActivityDao;
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
	
	@Get @Path("/projects/{project.id}/activity")
	public void activity(Project project) {
		result.include("atividades", projectDao.listarAtividades(project));
	}
	@Get @Path("/activity/{activity.id}")
	public void getActivity(Activity activity) {
		result.include("atividade", activityDao.carregar(activity));
		List<CommentActivity> comentarios = commentActivityDao.listar(activity);
		result.include("comentarios", comentarios);
		result.include("qtdComentarios", comentarios.size());
	}
	
	@Get @Path("/projects/{project.id}/activity/new")
	public void newActivity(Project project) {
		Project projectVersion = this.projectDao.get(userWeb.getProject());
		result.include("versions", projectVersion.getVersions());
		
		result.include("usuarios", userProjectsDao.listarUsuariosDoProj(project));
	}
	@Post @Path("/projects/{project.id}/activity/new")
	public void createActivity(Activity activity, Project project, Long[] versions) {
		if (activity.getResponsavel().getId() == null) activity.setResponsavel(null);
		
		Date date = new Date();
		activity.setDataCriacao(date);
		
		activity.setCriador(userWeb.getUser());
		activity.setProjeto(project);
		
		System.out.println("responsavel: " + activity.getResponsavel());
		System.out.println("resumo: " + activity.getResumo());
		
		activityDao.criarAtividade(activity);
		
		result.redirectTo(this).activity(project);
	}
	
	@Post @Path("/activity/{activity.id}/comment")
	public void comment(CommentActivity comment, Activity activity) {
		comment.setUsuario(userWeb.getUser());
		comment.setAtividade(activity);
		comment.setDataCriacao(new Date());
		
		commentActivityDao.salvar(comment);
		
		result.redirectTo(this).getActivity(activity);
	}
}
