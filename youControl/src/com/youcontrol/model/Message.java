package com.youcontrol.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import org.hibernate.validator.NotNull;

@Entity
public class Message extends EntityObject {

	private User fromUser;
	
	private User toUser;
	
	private String subject;
	
	private String message;
	
	private Message replyTo;
	
	private boolean markAsRead;
	
	private Date sentDate;

	@NotNull @ManyToOne
	public User getFromUser() {
		return fromUser;
	}
	public void setFromUser(User fromUser) {
		this.fromUser = fromUser;
	}

	@NotNull @ManyToOne
	public User getToUser() {
		return toUser;
	}
	public void setToUser(User toUser) {
		this.toUser = toUser;
	}

	@Column(length=200)
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	@NotNull @Column(length=700)
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}

	@OneToOne
	public Message getReplyTo() {
		return replyTo;
	}
	public void setReplyTo(Message replyTo) {
		this.replyTo = replyTo;
	}

	public boolean getMarkAsRead() {
		return markAsRead;
	}
	public void setMarkAsRead(boolean markAsRead) {
		this.markAsRead = markAsRead;
	}
	
	public Date getSentDate() {
		return sentDate;
	}
	public void setSentDate(Date sentDate) {
		this.sentDate = sentDate;
	}
	
}
