package com.youcontrol.dao;

import java.util.Collection;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Message;
import com.youcontrol.model.User;

@Component
public class MessageDao extends DefaultDao<Message>{

	public MessageDao(Session session) {
		super(session);
	}
	
	public Collection<Message> getSentMessagesFromUser(User user) {
		Criteria criteria = session.createCriteria(Message.class).add(Restrictions.eq("fromUser", user));
		return criteria.list();
	}
	
	public Collection<Message> getInboxFromUser(User user) {
		Criteria criteria = session.createCriteria(Message.class).add(Restrictions.eq("toUser", user));
		return criteria.list();
	}
	public Integer countUnreadMessages(User user) {
		return session.createCriteria(Message.class).add(Restrictions.eq("toUser", user))
											 		.add(Restrictions.eq("markAsRead", false)).list().size();
	}
	public Integer countReadMessages(User user) {
		return session.createCriteria(Message.class).add(Restrictions.eq("toUser", user))
 													.add(Restrictions.eq("markAsRead", true)).list().size();
	}
	
}
