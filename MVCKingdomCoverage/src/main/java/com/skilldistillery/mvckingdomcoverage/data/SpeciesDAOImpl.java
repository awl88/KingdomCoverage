package com.skilldistillery.mvckingdomcoverage.data;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.Insured;
import com.skilldistillery.kingdomcoverage.entities.Species;

@Transactional
@Component
public class SpeciesDAOImpl implements SpeciesDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Species showSpecies(int id) {
		return em.find(Species.class, id);
	}
	
	@Override
	public Species create(Species species) {
		em.persist(species);
		em.flush();
		return species;
	}
	
	@Override
	public Species update(int id, Species species) {
		Species managed = em.find(Species.class, id);
		managed.setName(species.getName());
		managed.setClients(species.getClients());
		managed.setCostMultiplier(species.getCostMultiplier());
		return managed;
	}
	
	@Override 
	public List<Insured> showClients(int id) {
		String query = "SELECT s.clients FROM Species s WHERE s.id = :id";
		List<Insured> resultList = em.createQuery(query, Insured.class).setParameter("id", id).getResultList();
		return resultList;
	}
	
	@Override 
	public List<Species> getAllSpecies() {
		List<Species> allSpecies = new ArrayList<>();
		String query = "SELECT s FROM Species s";
		allSpecies = em.createQuery(query, Species.class)
				.getResultList();
		return allSpecies;
	}
}
