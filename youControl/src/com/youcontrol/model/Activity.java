package com.youcontrol.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.validator.NotNull;

@Entity
public class Activity extends EntityObject {
	
	private String summary;
	
	private String description;
	
	private String criticality;
	
	private String priority;
	
	private Project project;
	
	private User assignedTo;
	
	private User createdBy;
	
	private Date createdAt;
	
	private List<Version> versions;
	
	private Status status;
	
		
	@NotNull
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	
	@NotNull @Column(length=700)
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCriticality() {
		return criticality;
	}
	public void setCriticality(String criticality) {
		this.criticality = criticality;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	
	@OneToOne
	public User getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(User user) {
		this.assignedTo = user;
	}
	
	@OneToOne
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User user) {
		this.createdBy = user;
	}
	public void setCreatedAt(Date date) {
		this.createdAt = date;
	}
	
	@NotNull
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	
	@ManyToOne
	public Project getProject() {
		return project;
	}
	
	@ManyToMany
	public List<Version> getVersions() {
		return this.versions;
	}
	
	public void setVersions(List<Version> versions) {
		this.versions = versions;
	}
	
	@ManyToOne
	public Status getStatus() {
		return this.status;
	}
	public void setStatus(Status status) {
		this.status = status;
	}
	
	
}
