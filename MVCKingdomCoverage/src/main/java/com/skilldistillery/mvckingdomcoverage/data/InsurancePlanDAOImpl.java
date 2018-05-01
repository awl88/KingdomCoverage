package com.skilldistillery.mvckingdomcoverage.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.CoverageType;
import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;
import com.skilldistillery.kingdomcoverage.entities.Insured;

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
	
	@Override
	public List<InsurancePlan> getAllPlans() {
		List<InsurancePlan> plans = new ArrayList<>();
		String query = "SELECT p FROM InsurancePlan p";
		plans = em.createQuery(query, InsurancePlan.class)
				.getResultList();
		return plans;
	}
	
	@Override
	public void getTotalCostOfPlanAndMultiplier(Insured insured) {
		List<InsurancePlan> plans = insured.getPlans();
		if(plans.size() > 0) {
			String coverageTypeQuery = "SELECT SUM(ip.coverages.cost) FROM InsurancePlan ip JOIN FETCH ip.coverages";
			List<Double> coverageCost = em.createQuery(coverageTypeQuery, Double.class)
					.getResultList();
			double totalCoverageCost = coverageCost.get(0);
			String occupationQuery = "SELECT i.occupation.costMultiplier FROM Insured i";
			List<Double> occupationMultiplier = em.createQuery(occupationQuery, Double.class)
					.getResultList();
			double occupationCostMultiplier = occupationMultiplier.get(0);
			String speciesQuery = "SELECT i.species.costMultiplier FROM Insured i";
			List<Double> speciesMultiplier = em.createQuery(speciesQuery, Double.class)
					.getResultList();
			double speciesCostMultiplier = speciesMultiplier.get(0);
			double totalMultiplier = (speciesCostMultiplier + occupationCostMultiplier)/2;
			double totalCostOfPlan = totalCoverageCost * totalMultiplier;
			plans.get(0).setTotalCostOfPlan(totalCostOfPlan);
		}
	}
	
	@Override
	public void deleteCoverageTypeBytId(int planId, int coverageId) {
		InsurancePlan managed = em.find(InsurancePlan.class, planId);
		List<CoverageType> coverages = managed.getCoverages();
		CoverageType coverageToDelete = em.find(CoverageType.class, coverageId);
		if(coverages.contains(coverageToDelete)) {
			coverages.remove(coverages.indexOf(coverageToDelete));
		}
	}
}
