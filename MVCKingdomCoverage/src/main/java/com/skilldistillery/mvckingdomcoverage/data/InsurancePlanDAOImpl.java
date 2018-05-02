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
import com.skilldistillery.kingdomcoverage.entities.QuoteDTO;

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
	public int getTotalCostOfPlanAndMultiplier(Insured insured) {
		int roundedTotal = 0;
		Double totalCoverageCost = 0.0;
		List<InsurancePlan> plans = insured.getPlans();
		if(plans.size() > 0) {
			InsurancePlan plan = plans.get(0);
			List<CoverageType> coverages = plan.getCoverages();
			if(coverages.size() > 0) {
				for (CoverageType coverage : coverages) {
					Double cost = coverage.getCost();
					totalCoverageCost += cost;
				}
			}
			String occupationQuery = "SELECT i.occupation.costMultiplier FROM Insured i";
			List<Double> occupationMultiplier = em.createQuery(occupationQuery, Double.class)
					.getResultList();
			Double occupationCostMultiplier = occupationMultiplier.get(0);
			String speciesQuery = "SELECT i.species.costMultiplier FROM Insured i";
			List<Double> speciesMultiplier = em.createQuery(speciesQuery, Double.class)
					.getResultList();
			Double speciesCostMultiplier = speciesMultiplier.get(0);
			Double totalMultiplier = (speciesCostMultiplier + occupationCostMultiplier)/2;
			Double totalCostOfPlan = totalCoverageCost * totalMultiplier;
			roundedTotal = (int) (Math.round(totalCostOfPlan));
			plans.get(0).setTotalCostOfPlan(roundedTotal);
		}
		return roundedTotal;
	}
	
	@Override
	public void deleteCoverageTypeById(int planId, int coverageId) {
		InsurancePlan managed = em.find(InsurancePlan.class, planId);
		List<CoverageType> coverages = managed.getCoverages();
		CoverageType coverageToDelete = em.find(CoverageType.class, coverageId);
		if(coverages.contains(coverageToDelete)) {
			coverages.remove(coverages.indexOf(coverageToDelete));
		}
	}
	
	@Override
	public void addCoverageTypeById(int planId, int coverageId) {
		InsurancePlan managed = em.find(InsurancePlan.class, planId);
		List<CoverageType> coverages = managed.getCoverages();
		CoverageType coverageToAdd = em.find(CoverageType.class, coverageId);
		if(! coverages.contains(coverageToAdd)) {
			coverages.add(coverageToAdd);
		}
	}
}
