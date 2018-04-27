package com.skilldistillery.mvckingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.Address;

public interface AddressDAO {

	Address create(Address addr);

	Address update(int id, Address addr);

	Address show(int id);

}
