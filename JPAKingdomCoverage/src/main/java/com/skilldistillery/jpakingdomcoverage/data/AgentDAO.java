package com.skilldistillery.jpakingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.Message;



public interface AgentDAO {

	public Agent show(int id);
	public List<Message> inboxShow(int id, Agent agent);
	
}
