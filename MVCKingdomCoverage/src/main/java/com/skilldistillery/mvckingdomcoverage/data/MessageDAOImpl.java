package com.skilldistillery.mvckingdomcoverage.data;

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
		em.persist(message);
		em.flush();
		return message;
	}
	
	@Override
	public boolean destroy(int id) {
		if (em.find(Message.class, id) == null) {
			return false;
		} else {
			Message m = em.find(Message.class, id);
			em.remove(m); // performs the delete on the managed entity
			return true;
		}
	}
	
	@Override
	public Message show(int id) {
		return em.find(Message.class, id);
	}
}
