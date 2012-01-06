package com.youcontrol.images;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.User;

@Component
public class ImageUser {

	private File userFolder;
	
	public ImageUser(ServletContext context) {
		String path = context.getRealPath("/WEB-INF/images/users");
		userFolder = new File(path);
		userFolder.mkdir();
	}
	
	public void upload(UploadedFile file, User user) {
		File destino = new File(userFolder, user.getId() + ".imagem");

		System.out.println("getFile: " + file.getFile() + " destino: " + destino);
		
		try {
			IOUtils.copyLarge(file.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
			throw new RuntimeException("Erro ao copiar imagem: " + e);
		}
	}
	
	public File showImage(User user) {
		File file = new File(userFolder, user.getId() + ".imagem");
		return (file.exists()) ? file : new File(userFolder, "usuario.png");
	}
	
}
