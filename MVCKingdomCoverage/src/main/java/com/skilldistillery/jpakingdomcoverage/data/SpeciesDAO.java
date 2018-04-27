package com.skilldistillery.jpakingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Species;

public interface SpeciesDAO {

	Species show(int id);

	Species create(Species species);

	Species update(int id, Species species);

	List<Insured> showClients(int id);

}
