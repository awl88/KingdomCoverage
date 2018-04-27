package com.skilldistillery.mvckingdomcoverage.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.skilldistillery.kingdomcoverage.entities.Address;

@Transactional
@Component
public class AddressDAOImpl implements AddressDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public Address create(Address addr) {

		em.getTransaction().begin();
		em.persist(addr);
		em.flush();
		em.getTransaction().commit();

		return addr;
	}
	
	@Override
	public Address update(int id, Address addr) {
		em.getTransaction().begin();
		Address managed = em.find(Address.class, id);
		managed.setStreet(addr.getStreet());
		managed.setCity(addr.getCity());
		managed.setRealm(addr.getRealm());
		em.persist(managed);
		em.flush();
		em.getTransaction().commit();
		return managed;
	}
	
	@Override
	public Address show(int id) {
		return em.find(Address.class, id);
	}
}
