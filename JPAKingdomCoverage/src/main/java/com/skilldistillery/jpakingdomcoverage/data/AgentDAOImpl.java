package com.skilldistillery.jpakingdomcoverage.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.Message;

@Transactional
@Component
public class AgentDAOImpl implements AgentDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Message> inboxShow(int id, Agent agent) {
		String query = "SELECT a.message_id FROM Agent a WHERE a.id = :id";
		List<Message> messages = em.createQuery(query, Message.class).setParameter("id", id).getResultList();	
		return messages;
	}

	@Override
	public Agent show(int id) {
		return em.find(Agent.class, id);
	}

		
}
