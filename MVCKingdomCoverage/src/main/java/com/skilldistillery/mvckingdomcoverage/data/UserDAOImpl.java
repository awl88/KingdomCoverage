package com.skilldistillery.mvckingdomcoverage.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.User;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User create(User user) {
		em.persist(user);
		em.flush();
		return user;
	}

	@Override
	public User show (int id) {
		return em.find(User.class, id);
	}
	
	@Override
	public Integer getUserIdByNameAndPass(String name, String password) {
		List<User> users = new ArrayList<>();
		String query = "SELECT u from User u where u.name = :name and u.password = :password";
	
		users = em.createQuery(query, User.class)
				.setParameter("name", name)
				.setParameter("password", password)
				.getResultList();
		
		if (users.size() > 0) {
			User user = users.get(0);
			return user.getId();
		}
		
		else {
			return 0;
		}
		
	}
	
	@Override
	public User getUserByName(String name) {
		String query = "SELECT u FROM User u WHERE u.name = :name";
		List<User> users = em.createQuery(query, User.class)
				.setParameter("name", name)
				.getResultList();
		User user = new User();
		if (users.size() != 0) {
			user = users.get(0);
		} else {
			user = null;
		}
		return user;
	}
	
}
