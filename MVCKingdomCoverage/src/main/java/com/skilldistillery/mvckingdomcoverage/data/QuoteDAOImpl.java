package com.skilldistillery.mvckingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.CoverageType;
import com.skilldistillery.kingdomcoverage.entities.Occupation;
import com.skilldistillery.kingdomcoverage.entities.Species;

@Transactional
@Component
public class QuoteDAOImpl implements QuoteDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Autowired
	private SpeciesDAO sdao = new SpeciesDAOImpl();
	
	@Autowired
	private OccupationDAO odao = new OccupationDAOImpl();
	
	@Autowired
	private CoverageTypeDAO ctdao = new CoverageTypeDAOImpl();

	@Override
	public int getQuote(int coverageId, int speciesId, int occupationId) {
		CoverageType coverage = ctdao.show(coverageId);
		Species species = sdao.showSpecies(speciesId);
		Occupation occupation = odao.show(occupationId);
		double speciesCostMultiplier = species.getCostMultiplier();
		double occupationCostMultiplier = occupation.getCostMultiplier();
		double coverageCost = coverage.getCost();
		double totalMultiplier = (speciesCostMultiplier + occupationCostMultiplier) / 2;
		double totalCost = coverageCost * totalMultiplier;
		int roundedTotal = (int)(Math.round(totalCost));
		return roundedTotal;
	}

}
