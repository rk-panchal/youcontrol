package com.youcontrol.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.validator.NotNull;

@Entity
public class User {
	
	@Id @GeneratedValue
	private Long id;
	@NotNull
	private String nome;
	@NotNull
	private String email;
	@NotNull
	private String senha;
	@NotNull
	private Date dataDeCriacao;
	@OneToMany (mappedBy = "user")
	private List<UserProjects> projetos;
	
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public void setDataDeCriacao(Date dataDeCriacao) {
		this.dataDeCriacao = dataDeCriacao;
	}
	public Date getDataDeCriacao() {
		return dataDeCriacao;
	}
	public void setProjetos(List<UserProjects> projetos) {
		this.projetos = projetos;
	}
	public List<UserProjects> getProjetos() {
		return projetos;
	}

}
