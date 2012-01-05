package com.youcontrol.controller;

import java.io.File;

import com.youcontrol.images.ImageUser;
import com.youcontrol.model.User;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;

@Resource
public class UserController {

	private final Result result;
	private final ImageUser imageUser;
	
	public UserController(Result result, ImageUser imageUser) {
		this.result = result;
		this.imageUser = imageUser;
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
