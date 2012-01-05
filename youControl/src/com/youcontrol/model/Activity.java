package com.youcontrol.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import org.hibernate.validator.NotNull;

@Entity
public class Activity {

	@Id @GeneratedValue
	private Long id;
	@NotNull
	private String resumo;
	@NotNull @Column(length=700)
	private String descricao;
	private String criticidade;
	private String prioridade;
	@ManyToOne
	private Project projeto;
	@OneToOne
	private User responsavel;
	@OneToOne
	private User criador;
	@NotNull
	private Date dataCriacao;
	@OneToMany(mappedBy = "atividade")
	private List<CommentActivity> comentarios;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getResumo() {
		return resumo;
	}
	public void setResumo(String resumo) {
		this.resumo = resumo;
	}
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
	public User getResponsavel() {
		return responsavel;
	}
	public void setResponsavel(User responsavel) {
		this.responsavel = responsavel;
	}
	public User getCriador() {
		return criador;
	}
	public void setCriador(User criador) {
		this.criador = criador;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setProjeto(Project projeto) {
		this.projeto = projeto;
	}
	public Project getProjeto() {
		return projeto;
	}
	public void setComentarios(List<CommentActivity> comentarios) {
		this.comentarios = comentarios;
	}
	public List<CommentActivity> getComentarios() {
		return comentarios;
	}
	
}