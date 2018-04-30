package com.skilldistillery.mvckingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.PersistenceException;

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
		User user = new User();
<<<<<<< HEAD
		String query = "SELECT u from User u where u.name = :name and u.password = :password";
		try {
			user = em.createQuery(query, User.class)
					.setParameter("name", name)
					.setParameter("password", password)
					.getSingleResult();
		} catch (PersistenceException e) {
			e.printStackTrace();
		}
=======
		String query = "SELECT u FROM User u WHERE u.name = :name AND u.password = :password";
		user = em.createQuery(query, User.class)
				.setParameter("name", name)
				.setParameter("password", password)
				.getSingleResult();
>>>>>>> 64fcaba2bb87577919f1adaa400020e050212249
		return user.getId();
	}
	
}
