package com.skilldistillery.jpakingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;

@Transactional
@Component
public class InsurancePlanDAOImpl implements InsurancePlanDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public InsurancePlan show(int id) {
		return em.find(InsurancePlan.class, id);
	}
	
	@Override
	public InsurancePlan create(InsurancePlan plan) {

		em.getTransaction().begin();
		em.persist(plan);
		em.flush();
		em.getTransaction().commit();
		return plan;
	}
	
	@Override
	public InsurancePlan update(int id, InsurancePlan coverage) {
		// start the transaction
		em.getTransaction().begin();
		// retrieve actor to update using id passed in
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		// update using the actor passed in
		managed.setName(coverage.getName());
		managed.setActive(coverage.isActive());
		managed.setActive(coverage.getActive());
		// write the actor to the database
		em.persist(managed);
		// update the "local" Actor object
		em.flush();
		// commit changes
		em.getTransaction().commit();
		return managed;
	}
}
