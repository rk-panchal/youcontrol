package com.youcontrol.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import com.youcontrol.model.User;

import br.com.caelum.vraptor.ioc.Component;

@Component
public class UserDao {

	private final Session session;
	
	public UserDao(Session session) {
		this.session = session;
	}
	
	public Long criarUsuario(User user) {
		return (Long) session.save(user);
	}
	
	public boolean existeEmail(User user) {
		User userEncontrado = (User) session.createCriteria(User.class).add(Restrictions.eq("email", user.getEmail())).uniqueResult();
		return userEncontrado != null;
	}
	
	public User carregar(User user) {
		return (User) session.createCriteria(User.class).add(Restrictions.eq("email", user.getEmail()))
														.add(Restrictions.eq("senha", user.getSenha()))
														.uniqueResult();
	}
	
	@SuppressWarnings("unchecked")
	public List<User> listarUsuarios() {
		return session.createCriteria(User.class).list();
	}
	
	public void refresh(User user) {
		session.refresh(user);
	}
	
}
