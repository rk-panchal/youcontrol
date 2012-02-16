package com.youcontrol.model;

import java.util.Date;

import javax.persistence.Entity;

import org.hibernate.validator.NotNull;

@Entity
public class User extends EntityObject{
	
	private String nome;
	
	private String email;
	
	private String senha;
	
	private Date dataDeCriacao;
	
	@NotNull
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	
	@NotNull
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	@NotNull
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public void setDataDeCriacao(Date dataDeCriacao) {
		this.dataDeCriacao = dataDeCriacao;
	}
	
	@NotNull
	public Date getDataDeCriacao() {
		return dataDeCriacao;
	}

}
