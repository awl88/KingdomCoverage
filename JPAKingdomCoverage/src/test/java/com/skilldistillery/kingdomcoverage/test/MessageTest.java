package com.skilldistillery.kingdomcoverage.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.kingdomcoverage.entities.Agent;
import com.skilldistillery.kingdomcoverage.entities.Message;

class MessageTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Message m;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("KingdomCoverage");
		em = emf.createEntityManager();
		m = em.find(Message.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	void test_message_to_agent_mapping() {
		assertEquals("Jake", m.getAgent().getfName());
	}

}
