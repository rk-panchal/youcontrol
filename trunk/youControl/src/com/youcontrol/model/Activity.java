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
	public void setDescription(String descricao) {
		this.description = descricao;
	}
	public String getCriticality() {
		return criticality;
	}
	public void setCriticality(String criticidade) {
		this.criticality = criticidade;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String prioridade) {
		this.priority = prioridade;
	}
	
	@OneToOne
	public User getAssignedTo() {
		return assignedTo;
	}
	public void setAssignedTo(User responsavel) {
		this.assignedTo = responsavel;
	}
	
	@OneToOne
	public User getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(User criador) {
		this.createdBy = criador;
	}
	public void setCreatedAt(Date dataCriacao) {
		this.createdAt = dataCriacao;
	}
	
	@NotNull
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setProject(Project projeto) {
		this.project = projeto;
	}
	
	@ManyToOne
	public Project getProject() {
		return project;
	}
	
	@ManyToMany
	public List<Version> getVersions() {
		return this.versions;
	}
	public void setVersions(List<Version> version) {
		this.versions = version;
	}
	
}
