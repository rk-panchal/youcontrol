package com.youcontrol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.youcontrol.model.Project;
import com.youcontrol.model.User;
import com.youcontrol.model.UserProjects;

import br.com.caelum.vraptor.ioc.Component;

@Component
public class UserProjectsDao {

	private final Session session;
	
	public UserProjectsDao(Session session) {
		this.session = session;
	}
	
	public void criar(UserProjects userProjects) {
		session.merge(userProjects);
	}

	@SuppressWarnings("unchecked")
	public List<UserProjects> listarProjDoUsuario(User user) {
		return session.createCriteria(UserProjects.class).add(Restrictions.eq("user", user)).list();
	}

	@SuppressWarnings("unchecked")
	public List<UserProjects> listarUsuariosDoProj(Project project) {
		return session.createCriteria(UserProjects.class).add(Restrictions.eq("project", project)).list();
	}
	
}
