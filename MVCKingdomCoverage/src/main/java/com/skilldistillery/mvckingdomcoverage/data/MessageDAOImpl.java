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
//		unimplemented and unfinished method to assign an agent to an insured, you will also need to create a new empty plan with no coverages when you implement this
//		String query = "SELECT a FROM Agent a JOIN FETCH a.address WHERE a.address.realm = :realm";
//		List<Agent> agents = em.createQuery(query, Agent.class)
//				.setParameter("realm", dto.getAddressRealm())
//				.getResultList();
//		insured.setAgents(agents);
		em.persist(message);
		em.flush();
		return message;
	}
	
	@Override
	public void persistSender(Message message) {
		Message managed = em.find(Message.class, message.getId());
		managed.setSenderString(message.getSenderString());
		managed.setSenderChar(message.getSenderChar());
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
