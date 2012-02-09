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
	
	private String resumo;
	
	private String descricao;
	
	private String criticidade;
	
	private String prioridade;
	
	private Project projeto;
	
	private User responsavel;
	
	private User criador;
	
	private Date dataCriacao;
	
	private List<Version> versions;
		
	@NotNull
	public String getResumo() {
		return resumo;
	}
	public void setResumo(String resumo) {
		this.resumo = resumo;
	}
	
	@NotNull @Column(length=700)
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getCriticidade() {
		return criticidade;
	}
	public void setCriticidade(String criticidade) {
		this.criticidade = criticidade;
	}
	public String getPrioridade() {
		return prioridade;
	}
	public void setPrioridade(String prioridade) {
		this.prioridade = prioridade;
	}
	
	@OneToOne
	public User getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(User responsavel) {
		this.responsavel = responsavel;
	}
	
	@OneToOne
	public User getCriador() {
		return criador;
	}
	public void setCriador(User criador) {
		this.criador = criador;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	
	@NotNull
	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setProjeto(Project projeto) {
		this.projeto = projeto;
	}
	
	@ManyToOne
	public Project getProjeto() {
		return projeto;
	}
	
	@ManyToMany
	public List<Version> getVersions() {
		return this.versions;
	}
	public void setVersions(List<Version> version) {
		this.versions = version;
	}
	
}
