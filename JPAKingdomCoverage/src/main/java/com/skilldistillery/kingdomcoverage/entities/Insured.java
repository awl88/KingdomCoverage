package com.skilldistillery.kingdomcoverage.entities;

import java.util.List;

import javax.persistence.Column;
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
	@Column(name="first_name")
	private String fName;
	@Column(name="last_name")
	private String lName;

	@ManyToOne
	@JoinColumn(name = "species_id")
	private Species species;

	@ManyToOne
	@JoinColumn(name = "occupation_id")
	private Occupation occupation;

	@OneToMany(mappedBy = "insured")
	@Column(name = "message_id")
	private List <Message> messages;

	@OneToOne
	@JoinColumn(name = "address_id")
	private Address address;

	@OneToMany(mappedBy = "insured")
	@Column(name = "plan_id")
	private List<InsurancePlan> plans;

	// End of fields

	public Insured() {
	}

	public Insured(int id, int age, char gender, String fName, String lName, Species species, Occupation occupation,
			List<Message> messages, Address address, List<InsurancePlan> plans) {
		super();
		this.id = id;
		this.age = age;
		this.gender = gender;
		this.fName = fName;
		this.lName = lName;
		this.species = species;
		this.occupation = occupation;
		this.messages = messages;
		this.address = address;
		this.plans = plans;
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

	public void setSpecies(Species species) {
		this.species = species;
	}

	public Occupation getOccupation() {
		return occupation;
	}

	public void setOccupation(Occupation occupation) {
		this.occupation = occupation;
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

	public void setAddress(Address address) {
		this.address = address;
	}

	public List<InsurancePlan> getPlans() {
		return plans;
	}

	public void setPlans(List<InsurancePlan> plans) {
		this.plans = plans;
	}

	public int getId() {
		return id;
	}

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
		builder.append(", messages=");
		builder.append(messages);
		builder.append(", address=");
		builder.append(address);
		builder.append(", plans=");
		builder.append(plans);
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
		result = prime * result + ((messages == null) ? 0 : messages.hashCode());
		result = prime * result + ((occupation == null) ? 0 : occupation.hashCode());
		result = prime * result + ((plans == null) ? 0 : plans.hashCode());
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
		if (messages == null) {
			if (other.messages != null)
				return false;
		} else if (!messages.equals(other.messages))
			return false;
		if (occupation == null) {
			if (other.occupation != null)
				return false;
		} else if (!occupation.equals(other.occupation))
			return false;
		if (plans == null) {
			if (other.plans != null)
				return false;
		} else if (!plans.equals(other.plans))
			return false;
		if (species == null) {
			if (other.species != null)
				return false;
		} else if (!species.equals(other.species))
			return false;
		return true;
	}



}
