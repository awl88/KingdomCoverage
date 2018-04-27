package com.skilldistillery.jpakingdomcoverage.data;

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
		em.getTransaction().begin();
		em.persist(user);
		em.flush();
		em.getTransaction().commit();
		return user;
	}

	@Override
	public User show (int id) {
		return em.find(User.class, id);
	}
	
}
