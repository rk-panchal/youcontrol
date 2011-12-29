package com.youcontrol.controller;

import java.util.Date;

import com.youcontrol.dao.ActivityDao;
import com.youcontrol.dao.ProjectDao;
import com.youcontrol.model.Activity;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class OwnProjectController {
	
	private final Result result;
	private final UserWeb userWeb;
	private final ProjectDao projectDao;
	private final ActivityDao activityDao;
	
	public OwnProjectController(Result result, UserWeb userWeb, ProjectDao projectDao, ActivityDao activityDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.projectDao = projectDao;
		this.activityDao = activityDao;
	}

	@Get @Path("/overview")
	public void overview() {
	}
	
	@Get @Path("/activity")
	public void activity() {
		result.include("atividades", projectDao.listarAtividades(userWeb.getProject()));
	}
	
	@Get @Path("/activity/new")
	public void newActivity() {
	}
	@Post @Path("/activity/new")
	public void createActivity(Activity activity) {
		Date date = new Date();
		activity.setDataCriacao(date);
		
		activity.setCriador(userWeb.getUser());
		activity.setProjeto(userWeb.getProject());
		
		activityDao.criarAtividade(activity);
				
		result.redirectTo(this).newActivity();
	}
}
