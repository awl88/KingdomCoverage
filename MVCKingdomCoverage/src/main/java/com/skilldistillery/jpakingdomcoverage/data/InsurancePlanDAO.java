package com.skilldistillery.jpakingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;

public interface InsurancePlanDAO {

	InsurancePlan show(int id);

	InsurancePlan create(InsurancePlan plan);

}
