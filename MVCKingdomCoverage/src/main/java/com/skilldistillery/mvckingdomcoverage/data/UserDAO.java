package com.skilldistillery.mvckingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.User;

public interface UserDAO {
	public User create(User user);

	User show(int id);
}
