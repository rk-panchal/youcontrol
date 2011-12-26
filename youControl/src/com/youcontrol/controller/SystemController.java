package com.youcontrol.controller;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

import com.youcontrol.dao.UserDao;
import com.youcontrol.interceptor.Public;
import com.youcontrol.model.User;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.view.Results;

@Resource
public class SystemController {
	
	private final Result result;
	private final UserDao userDao;
	private final UserWeb userWeb;
	
	public SystemController(Result result, UserDao userDao, UserWeb userWeb) {
		this.result = result;
		this.userDao = userDao;
		this.userWeb = userWeb;
	}

	@Get @Path("/start")
	public void index() {
	}
	
	@Public
	@Get @Path("/")
	public void login() {
	}
	@Public
	@Post @Path("/login")
	public void fazLogin(User user) {
		
		String senha;
		MessageDigest md = null; 
		try { 
			md = MessageDigest.getInstance("MD5"); 
		} catch (NoSuchAlgorithmException e) { 
			e.printStackTrace(); 
		} 
		BigInteger hash = new BigInteger(1, md.digest(user.getSenha().getBytes())); 
		senha = hash.toString(16);
		
		user.setSenha(senha);
		
		User carregado = userDao.carregar(user);
		String retorno = "false";
		if (carregado != null) {
			retorno = "true";
			userWeb.login(carregado);
		}
		result.use(Results.json()).from(retorno).serialize();
		
	}
	@Get @Path("/logout")
	public void logout() {
		userWeb.logout();
		result.redirectTo(this).login();
	}
	
	@Public
	@Post @Path("/register")
	public void registraUsuario(User user) {
		String retorno = "";
		
		if (userDao.existeEmail(user)) {
			retorno = "existeEmail";
		} else if (user.getEmail().trim().equals("") || user.getSenha().trim().equals("") || user.getNome().trim().equals("")) {
			retorno = "emBranco";
		} else {
			/* GERA MD5 DA SENHA */
			String senha;
			MessageDigest md = null; 
			try { 
				md = MessageDigest.getInstance("MD5"); 
			} catch (NoSuchAlgorithmException e) { 
				e.printStackTrace(); 
			} 
			BigInteger hash = new BigInteger(1, md.digest(user.getSenha().getBytes())); 
			senha = hash.toString(16);
			
			user.setSenha(senha);
			
			Date date = new Date();
			user.setDataDeCriacao(date);
			
			userDao.criarUsuario(user);
			retorno = "ok";
		}
		
		result.use(Results.json()).from(retorno).serialize();
	}
}
