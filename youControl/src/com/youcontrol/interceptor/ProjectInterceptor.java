package com.youcontrol.interceptor;

import javax.servlet.http.HttpServletRequest;

import com.youcontrol.dao.ProjectDao;
import com.youcontrol.model.Project;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class ProjectInterceptor implements Interceptor {

	private final HttpServletRequest request;
	private final UserWeb userWeb;
	private final ProjectDao projectDao;
	
	public ProjectInterceptor(HttpServletRequest request, UserWeb userWeb, ProjectDao projectDao) {
		this.request = request;
		this.userWeb = userWeb;
		this.projectDao = projectDao;
	}
	
	@Override
	public boolean accepts(ResourceMethod method) {
		/* DOES THE URL MATCHES WITH /projects/number? */
		if (request.getRequestURI().matches("/projects/\\d+")) return true;
		return false;
	}
	
	@Override
	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) throws InterceptionException {
		
		/* THIS WILL VERIFY IF THE PROJECT IS DIFFERENT FROM THE ACTUAL SELECTED */
		
		String url = request.getRequestURI();
		String[] pieces = url.split("/");
		Long id = Long.parseLong(pieces[2]);
		
		if (userWeb.getProject() != null) {
			if (!id.equals(userWeb.getProject().getId())) {
				Project project = new Project();
				project.setId(id);
				userWeb.setProject(projectDao.loadById(id));
			}
		} else {
			Project project = new Project();
			project.setId(id);
			userWeb.setProject(projectDao.loadById(id));
		}
		
		stack.next(method, resourceInstance);
	}
	
}
