package com.youcontrol.model;

import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Status extends EntityObject{
	
	private String code;
	
	private String name;
	
	private boolean markAsfinished;
	
	private Project project;

	public Status() {
	}
	
	public Status(String code, String description) {
		this.code = code;
		this.name = description;
	}
	
	public Status(String code, String description, Boolean markAsFinished) {
		this.code = code;
		this.name = description;
		this.markAsfinished = markAsFinished;
	}

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String description) {
		this.name = description;
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
