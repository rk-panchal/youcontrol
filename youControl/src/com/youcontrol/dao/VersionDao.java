package com.youcontrol.dao;

import org.hibernate.Session;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Version;

@Component
public class VersionDao extends DefaultDao<Version> {

	public VersionDao(Session session) {
		super(session);
	}

}
