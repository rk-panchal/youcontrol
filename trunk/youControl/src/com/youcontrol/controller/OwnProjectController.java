package com.youcontrol.controller;

import java.util.Date;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.User;
import com.youcontrol.model.UserProjects;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Resource
public class OwnProjectController {
	
	private final Result result;
	private final UserWeb userWeb;
	private final ProjectDao projectDao;
	private final ActivityDao activityDao;
	private final UserDao userDao;
	private final UserProjectsDao userProjectsDao;
	
	public OwnProjectController(Result result, 
								UserWeb userWeb, 
								ProjectDao projectDao, 
								ActivityDao activityDao,
								UserDao userDao,
								UserProjectsDao userProjectsDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.projectDao = projectDao;
		this.activityDao = activityDao;
		this.userDao = userDao;
		this.userProjectsDao = userProjectsDao;
	}

	@Get @Path("/overview")
	public void overview() {
		result.include("usuarios", userDao.listarUsuarios());
	}
	
	@Post @Path("/project/addUser")
	public void addUserToProject(User user) {
		UserProjects userProject = new UserProjects();
		userProject.setUser(user);
		userProject.setProject(userWeb.getProject());
		userProject.setRole("desenv");
		
		userProjectsDao.criar(userProject);
		
		String retorno = "added";
		result.use(Results.json()).from(retorno).serialize();
	}
	
	@Get @Path("/activity")
	public void activity() {
		result.include("atividades", projectDao.listarAtividades(userWeb.getProject()));
	}
	@Get @Path("/activity/{activity.id}")
	public void getActivity(Activity activity) {
		result.include("atividade", activityDao.carregar(activity));
	}
	
	@Get @Path("/activity/new")
	public void newActivity() {
		result.include("usuarios", userProjectsDao.listarUsuariosDoProj(userWeb.getProject()));
	}
	@Post @Path("/activity/new")
	public void createActivity(Activity activity) {
		Date date = new Date();
		activity.setDataCriacao(date);
		
		activity.setCriador(userWeb.getUser());
		activity.setProjeto(userWeb.getProject());
		
		System.out.println("responsavel: " + activity.getResponsavel());
		System.out.println("resumo: " + activity.getResumo());
		//if (activity.getResponsavel().equals("nenhum")) activity.setResponsavel(null);
		
		activityDao.criarAtividade(activity);
				
		result.redirectTo(this).newActivity();
	}
}
