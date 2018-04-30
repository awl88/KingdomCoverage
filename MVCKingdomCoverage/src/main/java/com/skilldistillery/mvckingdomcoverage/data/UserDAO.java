package com.skilldistillery.mvckingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.User;

public interface UserDAO {
	public User create(User user);

	User show(int id);

	Integer getUserIdByNameAndPass(String name, String password);
	
	User getUserByName(String name);
}
