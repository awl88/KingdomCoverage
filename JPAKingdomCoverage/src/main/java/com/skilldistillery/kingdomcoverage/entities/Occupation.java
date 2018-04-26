package com.skilldistillery.kingdomcoverage.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Occupation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@OneToMany(mappedBy="occupation")
	private List<Insured> clients;
	
	@Column(name="cost_multiplier")
	private double costMultiplier;

//	End of fields
	
	public Occupation() {
	}
	
	public Occupation(int id, String name, double costMultiplier) {
		super();
		this.id = id;
		this.name = name;
		this.costMultiplier = costMultiplier;
	}

//	End of constructors

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public double getCostMultiplier() {
		return costMultiplier;
	}

	public void setCostMultiplier(double costMultiplier) {
		this.costMultiplier = costMultiplier;
	}

	public int getId() {
		return id;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Occupation [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", costMultiplier=");
		builder.append(costMultiplier);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		long temp;
		temp = Double.doubleToLongBits(costMultiplier);
		result = prime * result + (int) (temp ^ (temp >>> 32));
		result = prime * result + id;
		result = prime * result + ((name == null) ? 0 : name.hashCode());
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
		Occupation other = (Occupation) obj;
		if (Double.doubleToLongBits(costMultiplier) != Double.doubleToLongBits(other.costMultiplier))
			return false;
		if (id != other.id)
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}
	
	
}
