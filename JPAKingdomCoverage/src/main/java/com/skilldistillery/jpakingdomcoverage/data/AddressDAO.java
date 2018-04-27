package com.skilldistillery.jpakingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.Address;

public interface AddressDAO {

	Address create(Address addr);

	Address update(int id, Address addr);

}
