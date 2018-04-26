package com.skilldistillery.kingdomcoverage.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Agent {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	private String name;
	@OneToMany(mappedBy="agent")
	@JoinColumn(name="message_id")
	private Message message;
	@OneToOne
	@JoinColumn(name="address_id")
	private Address address;
	
//	End of fields
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Message getMessage() {
		return message;
	}
	public void setMessage(Message message) {
		this.message = message;
	}
	public Address getAddress() {
		return address;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public int getId() {
		return id;
	}
	
//	End of getters/setters
	
}
