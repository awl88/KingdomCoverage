package com.skilldistillery.kingdomcoverage.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.kingdomcoverage.entities.InsurancePlan;

class InsurancePlanTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private InsurancePlan plan;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("KingdomCoverage");
		em = emf.createEntityManager();
		plan = em.find(InsurancePlan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	void test_agent_associations() {
		assertEquals("Wizard Plan", plan.getName());
	}

}
