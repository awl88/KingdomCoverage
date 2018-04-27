package com.skilldistillery.jpakingdomcoverage.data;

import java.util.List;



public interface AgentDAO {

	public Agent show(int id);
	public List<Message> inboxShow(int id, Agent agent);
	
}
