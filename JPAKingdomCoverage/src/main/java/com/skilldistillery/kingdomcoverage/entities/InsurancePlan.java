package com.skilldistillery.kingdomcoverage.entities;

import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "insurance_plan")
public class InsurancePlan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="name")
	private String name;
	
	@Column(name="active")
	private boolean active;
	
	@ManyToOne
	@JoinColumn(name="insured_id")
	private Insured insured;
	
	@ManyToOne
	@JoinColumn(name="agent_id")
	private Agent agent;
	
	@Column(name="create_date")
	private Date createDate;
	
	@Column(name="end_date")
	private Date endDate;
	
	@ManyToMany
	@JoinTable(name="plan_coverage", 
	joinColumns = @JoinColumn(name="insurance_plan_id"), 
	inverseJoinColumns= @JoinColumn(name="coverage_id"))
	private List<CoverageType> coverages;

//	End of fields

	public InsurancePlan() {
	}
	
	public InsurancePlan(int id, String name, boolean active, Insured insured, Agent agent, Date createDate,
			Date endDate) {
		super();
		this.id = id;
		this.name = name;
		this.active = active;
		this.insured = insured;
		this.agent = agent;
		this.createDate = createDate;
		this.endDate = endDate;
	}
	
//	End of constructors
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public Insured getInsured() {
		return insured;
	}

	public void setInsured(Insured insured) {
		this.insured = insured;
	}

	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getId() {
		return id;
	}
	
	public List<CoverageType> getCoverages() {
		return coverages;
	}

	public void setCoverages(List<CoverageType> coverages) {
		this.coverages = coverages;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("InsurancePlan [id=");
		builder.append(id);
		builder.append(", name=");
		builder.append(name);
		builder.append(", active=");
		builder.append(active);
		builder.append(", insured=");
		builder.append(insured);
		builder.append(", agent=");
		builder.append(agent);
		builder.append(", createDate=");
		builder.append(createDate);
		builder.append(", endDate=");
		builder.append(endDate);
		builder.append("]");
		return builder.toString();
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + (active ? 1231 : 1237);
		result = prime * result + ((agent == null) ? 0 : agent.hashCode());
		result = prime * result + ((createDate == null) ? 0 : createDate.hashCode());
		result = prime * result + ((endDate == null) ? 0 : endDate.hashCode());
		result = prime * result + id;
		result = prime * result + ((insured == null) ? 0 : insured.hashCode());
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
		InsurancePlan other = (InsurancePlan) obj;
		if (active != other.active)
			return false;
		if (agent == null) {
			if (other.agent != null)
				return false;
		} else if (!agent.equals(other.agent))
			return false;
		if (createDate == null) {
			if (other.createDate != null)
				return false;
		} else if (!createDate.equals(other.createDate))
			return false;
		if (endDate == null) {
			if (other.endDate != null)
				return false;
		} else if (!endDate.equals(other.endDate))
			return false;
		if (id != other.id)
			return false;
		if (insured == null) {
			if (other.insured != null)
				return false;
		} else if (!insured.equals(other.insured))
			return false;
		if (name == null) {
			if (other.name != null)
				return false;
		} else if (!name.equals(other.name))
			return false;
		return true;
	}

}
