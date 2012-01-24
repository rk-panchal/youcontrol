package com.youcontrol.model;

import java.util.List;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

import com.youcontrol.dao.ProjectDao;

@Component
@SessionScoped
public class UserWeb {

	private User user;
	private Project project;
	private List<Project> availableProjects;
	private ProjectDao projectDao;
	
	public UserWeb(ProjectDao projectDao) {
		this.projectDao = projectDao;
		setAvailableProjects(projectDao.listarProjetos());
	}
	
	public void login(User user) {
		this.user = user;
	}
	
	public void logout() {
		this.user = null;
		this.project = null;
	}
	
	public User getUser() {
		return this.user;
	}
	
	public boolean estaLogado() {
		return this.user != null;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Project getProject() {
		return project;
	}

	public List<Project> getAvailableProjects() {
		
		return this.availableProjects;
	}

	public void setAvailableProjects(List<Project> availableProjects) {
		this.availableProjects = availableProjects;
	}
	
}
