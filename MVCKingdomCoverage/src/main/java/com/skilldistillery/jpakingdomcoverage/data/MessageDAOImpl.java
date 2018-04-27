package com.skilldistillery.jpakingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.Message;

@Transactional
@Component
public class MessageDAOImpl implements MessageDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Message create(Message message) {
		// start the transaction
		em.getTransaction().begin();
		// write the insured to the database
		em.persist(message);
		// update the "local" Insured object
		em.flush();
		// commit the changes (actually perform the operation)
		em.getTransaction().commit();
		// return the Insured object
		return message;
	}
	
	@Override
	public boolean destroy(int id) {
		if (em.find(Message.class, id) == null) {
			return false;
		} else {
			Message m = em.find(Message.class, id);
			em.getTransaction().begin();
			em.remove(m); // performs the delete on the managed entity
			em.getTransaction().commit();
			return true;
		}
	}
}
