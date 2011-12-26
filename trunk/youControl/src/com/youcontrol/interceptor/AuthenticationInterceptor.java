package com.youcontrol.interceptor;

import com.youcontrol.controller.SystemController;
import com.youcontrol.dao.UserDao;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.InterceptionException;
import br.com.caelum.vraptor.Intercepts;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.core.InterceptorStack;
import br.com.caelum.vraptor.interceptor.Interceptor;
import br.com.caelum.vraptor.resource.ResourceMethod;

@Intercepts
public class AuthenticationInterceptor implements Interceptor {

	private final Result result;
	private final UserDao userDao;
	private final UserWeb userWeb;
	
	public AuthenticationInterceptor(Result result, UserDao userDao, UserWeb userWeb) {
		this.result = result;
		this.userDao = userDao;
		this.userWeb = userWeb;
	}
	
	public boolean accepts(ResourceMethod method) {
		return !method.containsAnnotation(Public.class);
	}
	
	public void intercept(InterceptorStack stack, ResourceMethod method,
			Object resourceInstance) throws InterceptionException {
		if (userWeb.estaLogado()) {
			userDao.refresh(userWeb.getUser());
			stack.next(method, resourceInstance);
		} else {
			result.redirectTo(SystemController.class).login();
		}
	}
}
