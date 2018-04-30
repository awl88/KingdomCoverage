package com.skilldistillery.mvckingdomcoverage.data;

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
		activate(plan.getId());
		em.persist(plan);
		em.flush();
		return plan;
	}
	
	@Override
	public InsurancePlan update(int id, InsurancePlan coverage) {
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		managed.setName(coverage.getName());
		managed.setActive(coverage.isActive());
		managed.setInsured(coverage.getInsured());
		managed.setAgent(coverage.getAgent());
		managed.setCreateDate(coverage.getCreateDate());
		managed.setEndDate(coverage.getEndDate());
		return managed;
	}
	
	@Override
	public InsurancePlan deactivate(int id) {
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		if(managed.isActive() == true) {
			managed.setActive(false);	
		} else {
			managed.setActive(false);
		}
		return managed;
	}
	
	@Override
	public InsurancePlan activate(int id) {
		InsurancePlan managed = em.find(InsurancePlan.class, id);
		if(managed.isActive() == false) {
			managed.setActive(true);	
		} else {
			managed.setActive(true);
		}
		return managed;
	}
}
