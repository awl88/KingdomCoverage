package com.skilldistillery.jpakingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Component
public class UserDAOImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public User create(User user) {
		// start the transaction
				em.getTransaction().begin();
				// write the actor to the database
				em.persist(user);
				// update the "local" Actor object
				em.flush();
				// commit the changes (actually perform the operation)
				em.getTransaction().commit();

				// return the Customer object
				return user;
	}

	
	
}
