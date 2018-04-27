package com.skilldistillery.jpakingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

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
		em.getTransaction().begin();
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		managed.setName(coverage.getName());
		managed.setActive(coverage.isActive());
		managed.setInsured(coverage.getInsured());
		managed.setAgent(coverage.getAgent());
		managed.setCreateDate(coverage.getCreateDate());
		managed.setEndDate(coverage.getEndDate());
		em.persist(managed);
		em.flush();
		em.getTransaction().commit();
		return managed;
	}
	
	@Override
	public InsurancePlan deactivate(int id) {
		em.getTransaction().begin();
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		if(managed.isActive() == true) {
			managed.setActive(false);	
		} else {
			managed.setActive(false);
		}
		em.persist(managed);
		em.flush();
		em.getTransaction().commit();
		return managed;
	}
	
	@Override
	public InsurancePlan activate(int id) {
		em.getTransaction().begin();
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		if(managed.isActive() == false) {
			managed.setActive(true);	
		} else {
			managed.setActive(true);
		}
		em.persist(managed);
		em.flush();
		em.getTransaction().commit();
		return managed;
	}
}
