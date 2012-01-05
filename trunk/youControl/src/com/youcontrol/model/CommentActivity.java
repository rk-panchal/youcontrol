package com.youcontrol.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import org.hibernate.validator.NotNull;

@Entity
public class CommentActivity {

	@Id @GeneratedValue
	private Long id;
	@ManyToOne
	private User usuario;
	@ManyToOne
	private Activity atividade;
	@NotNull
	private Date dataCriacao;
	@NotNull @Column(length=700)
	private String comentario;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public User getUsuario() {
		return usuario;
	}
	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}
	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public void setAtividade(Activity atividade) {
		this.atividade = atividade;
	}
	public Activity getAtividade() {
		return atividade;
	}
	
}
