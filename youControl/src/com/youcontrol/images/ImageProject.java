package com.youcontrol.images;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;

import br.com.caelum.vraptor.interceptor.multipart.UploadedFile;
import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Project;

@Component
public class ImageProject {

	private File projectFolder;
	
	public ImageProject(ServletContext context) {
		String path = context.getRealPath("/WEB-INF/images/project");
		projectFolder = new File(path);
		projectFolder.mkdir();
	}
	
	public void upload(UploadedFile file, Project project) {
		File destino = new File(projectFolder, project.getId() + ".imagem");

		System.out.println("getFile: " + file.getFile() + " destino: " + destino);
		
		try {
			IOUtils.copyLarge(file.getFile(), new FileOutputStream(destino));
		} catch (IOException e) {
			throw new RuntimeException("Erro ao copiar imagem: " + e);
		}
	}
	
	public File showImage(Project project) {
		File file = new File(projectFolder, project.getId() + ".imagem");
		return (file.exists()) ? file : new File(projectFolder, "projeto.png");
	}
	
}
