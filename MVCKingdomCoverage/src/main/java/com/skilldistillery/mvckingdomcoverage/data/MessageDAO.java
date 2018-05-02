package com.skilldistillery.mvckingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.Message;

public interface MessageDAO {

	Message create(Message message);

	boolean destroy(int id);

	Message show(int id);

	void persistSender(Message message);

}
