package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Message;

public interface AgentDAO {

	public Agent show(int id);
	public List<Message> inboxShow(int id);
	List<Insured> getClients(int id);
	List<Message> getMessagesByAgentId(Integer id);
	Integer getUserIdByNameAndPass(String name, String password);
	Insured getClientById(int id);
	Message getNewestInboxMessagesByAgentId(Integer id);
	Message getNewestSentMessagesByAgentId(Integer id);
	
}
