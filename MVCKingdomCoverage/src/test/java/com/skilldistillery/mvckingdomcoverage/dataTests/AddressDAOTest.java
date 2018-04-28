package com.skilldistillery.mvckingdomcoverage.dataTests;

import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;

import com.skilldistillery.mvckingdomcoverage.data.AddressDAOImpl;

class AddressDAOTest {
	private AddressDAOImpl dao; 

	@BeforeEach
	void setUp() throws Exception {
		dao = new AddressDAOImpl();
	}

	@AfterEach
	void tearDown() throws Exception {
		dao = null;
	}

	@Test
	@DisplayName("Test that the create method creates a new address in the database")
	void test_create_method() {
//		Address address = new Address("123 Muggle Street", "Mordor", "Middle Earth");
	}
	
	@Test
	@DisplayName("Test that the update method updates a existing address in the database")
	void test_update_method() {
		fail("Not yet implemented");
	}
	
	@Test
	@DisplayName("Test that the show method returns a existing address in the database")
	void test_show_method() {
		fail("Not yet implemented");
	}

}
