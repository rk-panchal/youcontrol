package com.youcontrol.controller;

import java.util.Date;

import com.youcontrol.dao.MessageDao;
import com.youcontrol.dao.UserDao;
import com.youcontrol.model.Message;
import com.youcontrol.model.User;
import com.youcontrol.model.UserWeb;

import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;

@Resource
public class MessageController {

	private final Result result;
	private final UserDao userDao;
	private final UserWeb userWeb;
	private final MessageDao messageDao;
	
	public MessageController(Result result, UserDao userDao, UserWeb userWeb, MessageDao messageDao) {
		this.result = result;
		this.userDao = userDao;
		this.userWeb = userWeb;
		this.messageDao = messageDao;
	}
	
	@Get @Path("/messages")
	public void messages() {
		User logged = userWeb.getUser();
		
		result.include("users", userDao.listarUsuarios());
		result.include("sentMessages", messageDao.getSentMessagesFromUser(logged));
		result.include("inboxMessages", messageDao.getInboxFromUser(logged));
	}
	@Post @Path("/messages/new")
	public void newMessage(Message message) {
		message.setFromUser(userWeb.getUser());
		message.setMarkAsRead(false);
		message.setSentDate(new Date());
		
		messageDao.save(message);
		
		result.redirectTo(this).messages();
	}
}
