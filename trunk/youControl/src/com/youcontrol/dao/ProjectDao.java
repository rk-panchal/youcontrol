package com.youcontrol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.youcontrol.model.Project;

import br.com.caelum.vraptor.ioc.Component;

@Component
public class ProjectDao {

	private final Session session;
	
	public ProjectDao(Session session) {
		this.session = session;
	}
	
	public Long criarProjeto(Project project) {
		return (Long) session.save(project);
	}
	
	public void remover(Project project) {
	}
	
	public void atualizar(Project project) {
	}
	
	public Project carregar(Long id) {
		return (Project) session.createCriteria(Project.class).add(Restrictions.eq("id", id)).uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<Project> listarProjetos() {
		return session.createCriteria(Project.class).list();
	}
	
}
