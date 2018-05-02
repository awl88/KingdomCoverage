package com.skilldistillery.mvckingdomcoverage.data;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.skilldistillery.kingdomcoverage.entities.CoverageType;
import com.skilldistillery.kingdomcoverage.entities.Occupation;
import com.skilldistillery.kingdomcoverage.entities.QuoteDTO;
import com.skilldistillery.kingdomcoverage.entities.Species;

public class QuoteDAOImpl implements QuoteDAO {
	
	@Autowired
	private SpeciesDAO sdao = new SpeciesDAOImpl();
	
	@Autowired
	private OccupationDAO odao = new OccupationDAOImpl();
	
	@Autowired
	private CoverageTypeDAO ctdao = new CoverageTypeDAOImpl();

	@Override
	public int getQuote(QuoteDTO qdto) {
		Species species = sdao.showSpecies(qdto.getSpeciesIdForQuote());
		Occupation occupation = odao.show(qdto.getOccupationIdForQuote());
		List<Integer> idsOfCoverages = qdto.getCoveragesIdsForQuote();
		List<CoverageType> coverages = new ArrayList<>();;
		for (Integer integer : idsOfCoverages) {
			coverages.add(ctdao.show(integer));
		}
		double speciesCostMultiplier = species.getCostMultiplier();
		double occupationCostMultiplier = occupation.getCostMultiplier();
		double totalMultiplier = (speciesCostMultiplier + occupationCostMultiplier) / 2;
		double totalBaseCost = 0.0;
		for (CoverageType coverageType : coverages) {
			totalBaseCost += coverageType.getCost();
		}
		double totalCost = totalBaseCost * totalMultiplier;
		int roundedTotal = (int)(Math.round(totalCost));
		return roundedTotal;
	}

}
