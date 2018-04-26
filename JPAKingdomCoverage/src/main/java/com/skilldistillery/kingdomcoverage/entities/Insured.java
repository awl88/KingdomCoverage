package com.skilldistillery.kingdomcoverage.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Insured {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private int age;
	private char gender;

	@ManyToOne
	@JoinColumn(name = "species_id")
	private Species species;

	@ManyToOne
	@JoinColumn(name = "occupation_id")
	private Occupation occupation;

	@OneToMany(mappedBy = "insured")
	@JoinColumn(name = "message_id")
	private Message message;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@OneToMany(mappedBy = "insured")
	@JoinColumn(name = "plan_id")
	private InsurancePlan plan;

	// End of fields

	public Insured() {
	}

	public Insured(int id, int age, char gender, Species species, Occupation occupation, Message message, Address address) {
		super();
		this.id = id;
		this.age = age;
		this.gender = gender;
		this.species = species;
		this.occupation = occupation;
		this.message = message;
		this.address = address;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	public Species getSpecies() {
		return species;
	}

	public void setspecies(Species species) {
		this.species = species;
	}

	public Occupation getOccupation() {
		return occupation;
	}

	public void setoccupation(Occupation occupation) {
		this.occupation = occupation;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Insured [id=");
		builder.append(id);
		builder.append(", age=");
		builder.append(age);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", species=");
		builder.append(species);
		builder.append(", occupation=");
		builder.append(occupation);
		builder.append(", message=");
		builder.append(message);
		builder.append(", address=");
		builder.append(address);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((address == null) ? 0 : address.hashCode());
		result = prime * result + age;
		result = prime * result + gender;
		result = prime * result + id;
		result = prime * result + ((message == null) ? 0 : message.hashCode());
		result = prime * result + ((occupation == null) ? 0 : occupation.hashCode());
		result = prime * result + ((plan == null) ? 0 : plan.hashCode());
		result = prime * result + ((species == null) ? 0 : species.hashCode());
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
		Insured other = (Insured) obj;
		if (address == null) {
			if (other.address != null)
				return false;
		} else if (!address.equals(other.address))
			return false;
		if (age != other.age)
			return false;
		if (gender != other.gender)
			return false;
		if (id != other.id)
			return false;
		if (message == null) {
			if (other.message != null)
				return false;
		} else if (!message.equals(other.message))
			return false;
		if (occupation == null) {
			if (other.occupation != null)
				return false;
		} else if (!occupation.equals(other.occupation))
			return false;
		if (plan == null) {
			if (other.plan != null)
				return false;
		} else if (!plan.equals(other.plan))
			return false;
		if (species == null) {
			if (other.species != null)
				return false;
		} else if (!species.equals(other.species))
			return false;
		return true;
	}

}
