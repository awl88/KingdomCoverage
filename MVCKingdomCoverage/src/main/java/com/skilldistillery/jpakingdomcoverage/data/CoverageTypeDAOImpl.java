package com.skilldistillery.jpakingdomcoverage.data;

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

		em.getTransaction().begin();
		em.persist(coverage);
		em.flush();
		em.getTransaction().commit();
		return coverage;
	}
	
	@Override
	public CoverageType update(int id, CoverageType coverage) {
		em.getTransaction().begin();
		CoverageType managed = em.find(CoverageType.class, id);
		managed.setName(coverage.getName());
		managed.setCost(coverage.getCost());
		em.persist(managed);
		em.flush();
		em.getTransaction().commit();
		return managed;
	}
	
	@Override
	public CoverageType show(int id) {
		return em.find(CoverageType.class, id);
	}
}
