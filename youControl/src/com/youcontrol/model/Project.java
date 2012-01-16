package com.youcontrol.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;

import org.hibernate.validator.NotNull;

@Entity
public class Project extends EntityObject{

	
	private String projeto;
	
	private String publicoAlvo;
	
	private String status;
	
	private String descricao;
	
	private Date dataDeCriacao;
	
	private List<Version> versions; 
	
	@NotNull
	public String getProjeto() {
		return projeto;
	}
	public void setProjeto(String projeto) {
		this.projeto = projeto;
	}
	
	@NotNull
	public String getPublicoAlvo() {
		return publicoAlvo;
	}
	public void setPublicoAlvo(String publicoAlvo) {
		this.publicoAlvo = publicoAlvo;
	}
	
	@NotNull
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	@NotNull @Column(length=700)
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	public void setDataDeCriacao(Date dataDeCriacao) {
		this.dataDeCriacao = dataDeCriacao;
	}
	
	@NotNull
	public Date getDataDeCriacao() {
		return dataDeCriacao;
	}
	
	@OneToMany(mappedBy="project", fetch=FetchType.LAZY)
	public List<Version> getVersions() {
		return this.versions;
	}
	public void setVersions(List<Version> versions) {
		this.versions = versions;
	}
	
}
