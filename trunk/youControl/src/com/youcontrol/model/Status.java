package com.youcontrol.model;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Status extends EntityObject{
	
	private String code;
	
	private String description;
	
	private boolean markAsfinished;
	
	private Project project;

	public Status(String code, String description) {
		this.code = code;
		this.description = description;
	}
	
	public Status(String code, String description, Boolean markAsFinished) {
		this.code = code;
		this.description = description;
		this.markAsfinished = markAsFinished;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean getMarkAsfinished() {
		return this.markAsfinished;
	}

	public void setMarkAsfinished(boolean markAsfinished) {
		this.markAsfinished = markAsfinished;
	}

	@ManyToOne
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

}
