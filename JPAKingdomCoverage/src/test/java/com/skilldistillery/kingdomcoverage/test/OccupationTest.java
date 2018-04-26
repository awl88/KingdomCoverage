package com.skilldistillery.kingdomcoverage.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.kingdomcoverage.entities.Occupation;

class OccupationTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Occupation o;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("KingdomCoverage");
		em = emf.createEntityManager();
		o = em.find(Occupation.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	void test_country_association() {
		assertEquals("Adventurer", o.getName());
	}
	}
