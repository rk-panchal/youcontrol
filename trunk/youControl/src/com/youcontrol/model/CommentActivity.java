package com.youcontrol.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;

import org.hibernate.validator.NotNull;

@Entity
public class CommentActivity extends EntityObject{

	
	private User usuario;
	
	private Activity atividade;
	
	private Date dataCriacao;
	
	private String comentario;
	
	@ManyToOne
	public User getUsuario() {
		return usuario;
	}
	public void setUsuario(User usuario) {
		this.usuario = usuario;
	}
	
	@NotNull
	public Date getDataCriacao() {
		return dataCriacao;
	}
	public void setDataCriacao(Date dataCriacao) {
		this.dataCriacao = dataCriacao;
	}
	
	@NotNull @Column(length=700)
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	public void setAtividade(Activity atividade) {
		this.atividade = atividade;
	}
	
	@ManyToOne
	public Activity getAtividade() {
		return atividade;
	}
	
}
