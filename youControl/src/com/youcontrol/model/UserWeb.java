package com.youcontrol.model;

import br.com.caelum.vraptor.ioc.Component;
import br.com.caelum.vraptor.ioc.SessionScoped;

@Component
@SessionScoped
public class UserWeb {

	private User user;
	private Project project;
	
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
	
}
