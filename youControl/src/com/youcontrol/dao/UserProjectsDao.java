package com.youcontrol.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.ioc.Component;

import com.youcontrol.model.Project;
import com.youcontrol.model.User;
import com.youcontrol.model.UserAssignment;
import com.youcontrol.model.Version;

@Component
public class UserProjectsDao {

	private final Session session;
	
	
	public UserProjectsDao(Session session) {
		this.session = session;
	}
	
	public void criar(Project project, User user, String role) {
		UserAssignment userProject = new UserAssignment();
		user = (User) session.load(User.class, user.getId());
		userProject.setUser(user);
		userProject.setProject(project);
		userProject.setRole(role);
		
		session.save(userProject);
	}

	@SuppressWarnings("unchecked")
	public List<UserAssignment> listProjectsByUser(User user) {
		return session.createCriteria(UserAssignment.class).add(Restrictions.eq("user", user)).list();
	}

	@SuppressWarnings("unchecked")
	public List<UserAssignment> listUserAssignmentsByProject(Project project) {
		return session.createCriteria(UserAssignment.class).add(Restrictions.eq("project", project)).list();
	}
	
	public List<User> listUsersByProject(Project project) {
		List<UserAssignment> userAssignments = listUserAssignmentsByProject(project);
		List<User> users = new ArrayList<User>();
		for(UserAssignment userAssignment: userAssignments){
			users.add(userAssignment.getUser());
		}
		return users;
	}

	@SuppressWarnings("unchecked")
	public List<Version> getVersionsFromProject(Long projectId) {
		return session.createCriteria(Version.class).add(Restrictions.eq("project.id", projectId)).list();
	}
	
}
