package com.skilldistillery.kingdomcoverage.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.kingdomcoverage.entities.User;

class UserTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private User u;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("KingdomCoverage");
		em = emf.createEntityManager();
		u = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	void test_country_association() {
		assertEquals("wombat1", u.getPassword());
	}

}
