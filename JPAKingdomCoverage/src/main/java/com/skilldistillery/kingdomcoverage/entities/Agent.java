package com.skilldistillery.kingdomcoverage.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Agent {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="first_name")
	private String fName;
	
	@Column(name="last_name")
	private String lName;
	
	@OneToMany(mappedBy="agent")
	@Column(name="message_id")
	private List <Message> messages;
	
	@OneToOne
	@JoinColumn(name="address_id")
	private Address address;
	
	@ManyToMany(mappedBy="agents")
	private List<Insured> clients;
	
	@OneToMany(mappedBy="agent")
	private List<InsurancePlan> plans;
	
//	End of fields
	
	public Agent() {
	}

	public Agent(int id, String fName, String lName, List<Message> messages, Address address) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.messages = messages;
		this.address = address;
	}
	
//	End of constructors

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getlName() {
		return lName;
	}

	public void setlName(String lName) {
		this.lName = lName;
	}

	public List<Message> getMessages() {
		return messages;
	}

	public void setMessages(List<Message> messages) {
		this.messages = messages;
	}

	public Address getAddress() {
		return address;
	}
	
	public void addMessageToMessages(Message message) {
		if(message == null) messages = new ArrayList<>();
        if(!messages.contains(message)) {
            messages.add(message);
        }
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<Insured> getClients() {
		return clients;
	}

	public void setClients(List<Insured> clients) {
		this.clients = clients;
	}

	public int getId() {
		return id;
	}

	public List<InsurancePlan> getPlans() {
		return plans;
	}

	public void setPlans(List<InsurancePlan> plans) {
		this.plans = plans;
	}

//	@Override
//	public String toString() {
//		StringBuilder builder = new StringBuilder();
//		builder.append("Agent [id=");
//		builder.append(id);
//		builder.append(", fName=");
//		builder.append(fName);
//		builder.append(", lName=");
//		builder.append(lName);
//		builder.append(", messages=");
//		builder.append(messages);
//		builder.append(", address=");
//		builder.append(address);
//		builder.append("]");
//		return builder.toString();
//	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + ((fName == null) ? 0 : fName.hashCode());
		result = prime * result + id;
		result = prime * result + ((lName == null) ? 0 : lName.hashCode());
		result = prime * result + ((messages == null) ? 0 : messages.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Agent other = (Agent) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (fName == null) {
			if (other.fName != null)
				return false;
		} else if (!fName.equals(other.fName))
			return false;
		if (id != other.id)
			return false;
		if (lName == null) {
			if (other.lName != null)
				return false;
		} else if (!lName.equals(other.lName))
			return false;
		if (messages == null) {
			if (other.messages != null)
				return false;
		} else if (!messages.equals(other.messages))
			return false;
		return true;
	}
	
	
	
}