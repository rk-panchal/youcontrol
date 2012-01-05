package com.youcontrol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Activity;
import com.youcontrol.model.CommentActivity;

@Component
public class CommentActivityDao {

	private final Session session;
	
	public CommentActivityDao(Session session) {
		this.session = session;
	}
	
	public void salvar(CommentActivity comment) {
		session.save(comment);
	}
	
	@SuppressWarnings("unchecked")
	public List<CommentActivity> listar(Activity activity) {
		return session.createCriteria(CommentActivity.class).add(Restrictions.eq("atividade", activity)).list();
	}
	
}
