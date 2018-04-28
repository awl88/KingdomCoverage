package com.skilldistillery.mvckingdomcoverage.dataTests;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.mvckingdomcoverage.data.AgentDAOImpl;

class AgentDAOTest {
	private AgentDAOImpl dao;

	@BeforeEach
	void setUp() throws Exception {
		dao = new AgentDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}
	
	@Test
	@DisplayName("Test that the show method returns an Agent by their id")
	void test_show() {
		String name = dao.show(1).getfName();
		System.out.println(name);
		assertEquals("Jake", name);
	}

	@Test
	@DisplayName("Test that the inboxShow method returns the list of messages for an Agent")
	void test_inboxShow() {
		fail("Not yet implemented");
	}
	
	@Test
	@DisplayName("Test that the getClients method returns the list of Insured for an Agent")
	void test_getClients() {
		fail("Not yet implemented");
	}

}
