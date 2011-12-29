package com.youcontrol.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.NotNull;

@Entity
public class Project {

	@Id @GeneratedValue
	private Long id;
	@NotNull
	private String projeto;
	@NotNull
	private String publicoAlvo;
	@NotNull
	private String status;
	@NotNull @Column(length=700)
	private String descricao;
	@NotNull
	private Date dataDeCriacao;
	@OneToMany(mappedBy = "projeto")
	private List<Activity> atividades;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getProjeto() {
		return projeto;
	}
	public void setProjeto(String projeto) {
		this.projeto = projeto;
	}
	public String getPublicoAlvo() {
		return publicoAlvo;
	}
	public void setPublicoAlvo(String publicoAlvo) {
		this.publicoAlvo = publicoAlvo;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public void setDataDeCriacao(Date dataDeCriacao) {
		this.dataDeCriacao = dataDeCriacao;
	}
	public Date getDataDeCriacao() {
		return dataDeCriacao;
	}
	public void setAtividades(List<Activity> atividades) {
		this.atividades = atividades;
	}
	public List<Activity> getAtividades() {
		return atividades;
	}
	
}
