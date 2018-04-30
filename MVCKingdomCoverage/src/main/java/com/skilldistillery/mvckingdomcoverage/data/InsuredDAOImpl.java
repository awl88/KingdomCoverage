package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Message;

@Transactional
@Component
public class InsuredDAOImpl implements InsuredDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Insured show(int id) {
		return em.find(Insured.class, id);
	}
	
	@Override
	public Insured create(Insured insured) {
		em.persist(insured);
		em.flush();
		return insured;
	}
	
	@Override
	public Insured update(int id, Insured insured) {
		Insured managed = em.find(Insured.class, id);
		managed.setAge(insured.getAge());
		managed.setGender(insured.getGender());
		managed.setfName(insured.getfName());
		managed.setlName(insured.getlName());
		managed.setSpecies(insured.getSpecies());
		managed.setOccupation(insured.getOccupation());
		managed.setMessages(insured.getMessages());
		managed.setAddress(insured.getAddress());
		managed.setPlans(insured.getPlans());
		return managed;
	}
	
	@Override
	public List<Message> inboxShow(int id) {
		String query = "SELECT in.messages FROM Insured in WHERE in.id = :id";
		List<Message> messages = em.createQuery(query, Message.class).setParameter("id", id).getResultList();	
		return messages;
	}
	
	@Override
	public List<InsurancePlan> listPlans(int id) {
		String query = "SELECT in.plans FROM Insured in WHERE in.id = :id";
		List<InsurancePlan> plans = em.createQuery(query, InsurancePlan.class).setParameter("id", id).getResultList();
		return plans;		
	}
}
