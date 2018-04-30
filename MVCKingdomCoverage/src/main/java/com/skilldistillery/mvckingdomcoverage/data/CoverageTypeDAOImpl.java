package com.skilldistillery.mvckingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.CoverageType;


@Transactional
@Component
public class CoverageTypeDAOImpl implements CoverageTypeDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public CoverageType create(CoverageType coverage) {
		em.persist(coverage);
		em.flush();
		return coverage;
	}
	
	@Override
	public CoverageType update(int id, CoverageType coverage) {
		CoverageType managed = em.find(CoverageType.class, id);
		managed.setName(coverage.getName());
		managed.setCost(coverage.getCost());
		return managed;
	}
	
	@Override
	public CoverageType show(int id) {
		return em.find(CoverageType.class, id);
	}
}
