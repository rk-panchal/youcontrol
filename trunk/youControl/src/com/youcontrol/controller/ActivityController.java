package com.youcontrol.controller;

import java.util.Date;
import java.util.List;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.CommentActivityDao;
import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.CommentActivity;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class ActivityController {

	private final Result result;
	private final UserWeb userWeb;
	
	private final UserProjectsDao userProjectsDao;
	private final ProjectDao projectDao;
	private final ActivityDao activityDao;
	private final CommentActivityDao commentActivityDao;
	
	public ActivityController(Result result,
							  UserWeb userWeb,
							  UserProjectsDao userProjectsDao,
							  ProjectDao projectDao,
							  ActivityDao activityDao,
							  CommentActivityDao commentActivityDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.userProjectsDao = userProjectsDao;
		this.projectDao = projectDao;
		this.activityDao = activityDao;
		this.commentActivityDao = commentActivityDao;
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
