package com.youcontrol.controller;

import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import com.youcontrol.dao.UserDao;
import com.youcontrol.dao.UserProjectsDao;
import com.youcontrol.images.ImageUser;
import com.youcontrol.model.User;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class UserController {

	private final Result result;
	private final UserWeb userWeb;
	private final ImageUser imageUser;
	private final UserDao userDao;
	private final UserProjectsDao userProjectsDao;
	
	public UserController(Result result, 
						  UserWeb userWeb, 
						  ImageUser imageUser,
						  UserDao userDao,
						  UserProjectsDao userProjectsDao) {
		this.result = result;
		this.userWeb = userWeb;
		this.imageUser = imageUser;
		this.userDao = userDao;
		this.userProjectsDao = userProjectsDao;
	}
	
	@Get @Path("/users/profile")
	public void myProfile() {
		result.include("projetos", userProjectsDao.listProjectsByUser(userWeb.getUser()));
	}
	@Post @Path("/users/profile")
	public void saveProfile(User user) {
		User userLogged = userWeb.getUser();
		userLogged.setNome(user.getNome());
		userLogged.setEmail(user.getEmail());
		
		String password;
		MessageDigest md = null; 
		try { 
			md = MessageDigest.getInstance("MD5"); 
		} catch (NoSuchAlgorithmException e) { 
			e.printStackTrace(); 
		} 
		BigInteger hash = new BigInteger(1, md.digest(user.getSenha().getBytes())); 
		password = hash.toString(16);
		
		userLogged.setSenha(password);
		
		userDao.update(userLogged);
		result.redirectTo(this).myProfile();
	}
	
	@Get @Path("/users/{user.id}")
	public void userProfile(User user) {
		user = userDao.get(user);
		result.include("user", user);
		result.include("projects", userProjectsDao.listProjectsByUser(user));
	}
	
	@Post @Path("/image/user/{user.id}")
	public void uploadImage(User user, final UploadedFile arquivo) {
		imageUser.upload(arquivo, user);
		result.redirectTo(SystemController.class).index();
	}
	@Get @Path("/image/user/{user.id}")
	public File showImageUser(User user) {
		return imageUser.showImage(user);
	}
	
}
