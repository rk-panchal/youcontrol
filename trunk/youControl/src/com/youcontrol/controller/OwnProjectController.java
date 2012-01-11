package com.youcontrol.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.CommentActivityDao;
import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.CommentActivity;
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

	@Get @Path("/overview")
	public void overview() {
		/* LOAD ONLY USERS THAT AREN'T IN THE PROJECT */
		List<User> usersInSystem = userDao.listarUsuarios();
		List<UserProjects> usersProject =  userProjectsDao.listarUsuariosDoProj(userWeb.getProject());
		
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
		result.include("usuarios", usersNotInProject);
	}
	
	@Post @Path("/project/addUser")
	public void addUserToProject(User user) {
		userProjectsDao.criar(userWeb.getProject(), user, "desenv");
		
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
		List<CommentActivity> comentarios = commentActivityDao.listar(activity);
		result.include("comentarios", comentarios);
		result.include("qtdComentarios", comentarios.size());
	}
	
	@Get @Path("/activity/new")
	public void newActivity() {
		result.include("usuarios", userProjectsDao.listarUsuariosDoProj(userWeb.getProject()));
	}
	@Post @Path("/activity/new")
	public void createActivity(Activity activity) {
		if (activity.getResponsavel().getId() == null) activity.setResponsavel(null);
		
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
	
	@Post @Path("/activity/{activity.id}/comment")
	public void comment(CommentActivity comment, Activity activity) {
		comment.setUsuario(userWeb.getUser());
		comment.setAtividade(activity);
		comment.setDataCriacao(new Date());
		
		commentActivityDao.salvar(comment);
		
		result.redirectTo(this).getActivity(activity);
	}
}
