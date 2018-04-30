package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Message;
import com.skilldistillery.kingdomcoverage.entities.UserInsuredAddressDTO;

public interface InsuredDAO {
	public Insured create(Insured insured);

	public Insured update(int id, Insured insured);

	public List<Message> inboxShow(int id);

	public List<InsurancePlan> listPlans(int id);

	public Insured show(int id);

	Integer getInsuredIdByUserId(Integer userId);

	List<Agent> getAgentsByInsuredId(Integer id);

	List<Message> getMessagesByInsuredId(Integer id);

	Insured createUserAndInsuredAndAddress(UserInsuredAddressDTO dto);
	
}
