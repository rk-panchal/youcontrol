package com.youcontrol.controller;

import java.util.Date;
import java.util.List;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.CommentActivityDao;
import com.youcontrol.dao.ProjectDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.dao.VersionDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.CommentActivity;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserWeb;
import com.youcontrol.service.ActivityService;

@Resource
public class ActivityController {

	private final Result result;
	private final UserWeb userWeb;
	
	private final UserProjectsDao userProjectsDao;
	private final ProjectDao projectDao;	
	private final ActivityDao activityDao;
	private final CommentActivityDao commentActivityDao;
	private final ActivityService activityService;
	
	public ActivityController(Result result,
							  UserWeb userWeb,
							  UserProjectsDao userProjectsDao,
							  ProjectDao projectDao,
							  VersionDao versionDao,
							  ActivityDao activityDao,
							  CommentActivityDao commentActivityDao,
							  ActivityService activityService) {
		this.result = result;
		this.userWeb = userWeb;
		this.userProjectsDao = userProjectsDao;
		this.projectDao = projectDao;		
		this.activityDao = activityDao;
		this.commentActivityDao = commentActivityDao;
		this.activityService = activityService;
	}
	
	@Get @Path("/project/{project.id}/activities")
	public void activities(Project project) {
		List<Activity> activities = projectDao.getActivitiesByProject(project);
		result.include("atividades", activities);
	}
	
	@Get @Path("/activity/{activity.id}")
	public void getActivity(Activity activity) {
		activity = activityDao.get(activity);
		result.include("atividade", activity);
		List<CommentActivity> comentarios = commentActivityDao.listar(activity);
		result.include("comentarios", comentarios);
		result.include("qtdComentarios", comentarios.size());
		
		Project project = userWeb.getProject();
		Project projectVersion = this.projectDao.get(project);
		result.include("versions", projectVersion.getVersions());
		result.include("usuarios", userProjectsDao.listarUsuariosDoProj(project));
	}
	
	@Get @Path("/activity/edit/{activity.id}")
	public void activityForm(Activity activity) {
		activity = activityDao.get(activity);
		result.include("activity", activity);
		List<CommentActivity> comentarios = commentActivityDao.listar(activity);
		result.include("comentarios", comentarios);
		result.include("qtdComentarios", comentarios.size());
		
		Project project = userWeb.getProject();
		Project projectVersion = this.projectDao.get(project);
		result.include("versions", projectVersion.getVersions());
		result.include("usuarios", userProjectsDao.listarUsuariosDoProj(project));
		result.include("action", Action.EDIT);
	}
	
	@Get @Path("/project/{project.id}/activity/add")
	public void activityForm(Project project) {
		Project projectVersion = this.projectDao.get(userWeb.getProject());
		result.include("versions", projectVersion.getVersions());		
		result.include("usuarios", userProjectsDao.listarUsuariosDoProj(project));
		result.include("action", Action.ADD);
	}
	
	
	@Post @Path("/project/{project.id}/activity/save")
	public void save(Activity activity, Project project, Long[] versions) {
		activityService.save(activity, project, userWeb.getUser(), versions);		
		result.redirectTo(this).activities(project);
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
