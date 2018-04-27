package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Occupation;

public interface OccupationDAO {

	Occupation show(int id);

	Occupation create(Occupation occupation);

	Occupation update(int id, Occupation occupation);

	List<Insured> clientsShow(int id);

}
