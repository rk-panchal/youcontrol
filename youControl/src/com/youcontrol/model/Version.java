package com.youcontrol.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.hibernate.validator.NotNull;

@Entity
public class Version extends EntityObject{
	
	private String name;
	
	private String description;
	
	private Project project;
	
	private List<Activity> activities;

	@NotNull
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@NotNull @Column(length=700)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@ManyToOne
	@JoinColumn(name="project_id")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@OneToMany
	@JoinTable(name="Version_Activity",
    joinColumns = @JoinColumn(name="activity_id"),
    inverseJoinColumns = @JoinColumn(name="version_id"))
	public List<Activity> getActivities() {
		return this.activities;
	}

	public void setActivities(List<Activity> activities) {
		this.activities = activities;
	}
	
}
