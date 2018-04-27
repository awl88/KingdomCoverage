package com.skilldistillery.jpakingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


import com.skilldistillery.kingdomcoverage.entities.Address;

@Transactional
@Component
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Address create(Address addr) {

		// start the transaction
		em.getTransaction().begin();
		// write the actor to the database
		em.persist(addr);
		// update the "local" Actor object
		em.flush();
		// commit the changes (actually perform the operation)
		em.getTransaction().commit();

		// return the Customer object
		return addr;
	}
	
	@Override
	public Address update(int id, Address addr) {
		// start the transaction
		em.getTransaction().begin();
		// retrieve actor to update using id passed in
		Address managed = em.find(Address.class, id);
		// update using the actor passed in
		managed.setStreet(addr.getStreet());
		managed.setCity(addr.getCity());
		managed.setRealm(addr.getRealm());
		// write the actor to the database
		em.persist(managed);
		// update the "local" Actor object
		em.flush();
		// commit changes
		em.getTransaction().commit();
		return managed;
	}
}
