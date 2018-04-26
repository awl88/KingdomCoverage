package com.skilldistillery.kingdomcoverage.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Address {
	
	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	private int id;
	
	private String street;
	private String city;
	private String realm;
	
//	End of fields
	
	public Address() {
	}
	
	public Address(int id, String street, String city, String realm) {
	super();
	this.id = id;
	this.street = street;
	this.city = city;
	this.realm = realm;
	}
	
//	End of constructors
	
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getRealm() {
		return realm;
	}
	public void setRealm(String realm) {
		this.realm = realm;
	}
	public int getId() {
		return id;
	}
}
