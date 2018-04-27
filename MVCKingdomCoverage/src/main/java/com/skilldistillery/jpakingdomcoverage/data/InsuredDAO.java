package com.skilldistillery.jpakingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Message;

public interface InsuredDAO {
	public Insured create(Insured insured);

	public Insured update(int id, Insured insured);

	public List<Message> inboxShow(int id, Insured insured);

	public List<InsurancePlan> listPlans(int id, Insured insured);

	public Insured show(int id);
	
}
