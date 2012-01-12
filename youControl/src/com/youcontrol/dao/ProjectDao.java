package com.youcontrol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Activity;
import com.youcontrol.model.Project;

@Component
public class ProjectDao extends DefaultDao<Project>{
	
	public ProjectDao(Session session) {
		super(session);
	}
	
	public Long criarProjeto(Project project) {
		return (Long) session.save(project);
	}
	
	public void remover(Project project) {
	}
	
	public void atualizar(Project project) {
		session.merge(project);
	}
	
	@SuppressWarnings("unchecked")
	public List<Project> listarProjetos() {
		return session.createCriteria(Project.class).list();
	}
	
	@SuppressWarnings("unchecked")
	public List<Activity> listarAtividades(Project project) {
		return session.createCriteria(Activity.class).add(Restrictions.eq("projeto", project)).list();
	}
}
