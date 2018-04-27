package com.skilldistillery.jpakingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;

public interface InsurancePlanDAO {

	InsurancePlan show(int id);

	InsurancePlan create(InsurancePlan plan);

	InsurancePlan update(int id, InsurancePlan coverage);

	InsurancePlan deactivate(int id, InsurancePlan coverage);

	InsurancePlan activate(int id, InsurancePlan coverage);

}
