package com.youcontrol.model;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class UserAssignment extends EntityObject{

	private User user;	
	
	private Project project;
	
	private String role;
	
	@ManyToOne(cascade=CascadeType.ALL)
	public User getUser() {
		return user;
	}
	
	public void setUser(User user) {
		this.user = user;
	}
	
	@OneToOne(cascade=CascadeType.ALL)
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	
}
