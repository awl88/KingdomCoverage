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

		// start the transaction
		em.getTransaction().begin();
		// write the actor to the database
		em.persist(coverage);
		// update the "local" Actor object
		em.flush();
		// commit the changes (actually perform the operation)
		em.getTransaction().commit();
		// return the Customer object
		return coverage;
	}
	
	@Override
	public CoverageType update(int id, CoverageType coverage) {
		// start the transaction
		em.getTransaction().begin();
		// retrieve actor to update using id passed in
		CoverageType managed = em.find(CoverageType.class, id);
		// update using the actor passed in
		managed.setName(coverage.getName());
		managed.setCost(coverage.getCost());
		// write the actor to the database
		em.persist(managed);
		// update the "local" Actor object
		em.flush();
		// commit changes
		em.getTransaction().commit();
		return managed;
	}
}
