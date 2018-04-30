package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Message;
import com.skilldistillery.kingdomcoverage.entities.User;

@Transactional
@Component
public class AgentDAOImpl implements AgentDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public List<Message> inboxShow(int id) {
		String query = "SELECT a.messages FROM Agent a WHERE a.id = :id";
		List<Message> messages = em.createQuery(query, Message.class).setParameter("id", id).getResultList();	
		return messages;
	}

	@Override
	public Agent show(int id) {
		return em.find(Agent.class, id);
	}

	@Override
	public List<Insured> getClients(int id) {
		String query = "SELECT a.clients FROM Agent a WHERE a.id = :id";
		List<Insured> clientList = em.createQuery(query, Insured.class).setParameter("id", id).getResultList();
		return clientList;
	}
	
	@Override
	public List<Message> getMessagesByAgentId(Integer id) {
		String query = "SELECT a from Agent a JOIN FETCH a.messages where a.id = :id";
		List<Agent> agent = em.createQuery(query, Agent.class)
				.setParameter("id", id)
				.getResultList();
		return agent.get(0).getMessages();
	}
	
	@Override
	public Integer getUserIdByNameAndPass(String name, String password) {
		User user = new User();
		String query = "Select u from User u where u.name = :name and u.password = :password";
		
		user = em.createQuery(query, User.class)
				.setParameter("name", name)
				.setParameter("password", password)
				.getSingleResult();
		return user.getId();
	}
		
}
