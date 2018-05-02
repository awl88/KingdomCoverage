package com.skilldistillery.kingdomcoverage.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

@Entity
public class Message {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@ManyToOne
	@JoinColumn(name="agent_id")
	private Agent agent;
	
	@ManyToOne
	@JoinColumn(name="insured_id")
	private Insured insured;
	
	@Column(name="message_body")
	private String messageBody;
	
	@Column(name="admin")
	private Character senderChar;

	@Transient
	String senderString;
	
//	End of fields
	
	public String getSenderString() {
		return senderString;
	}

	public void setSenderString(String senderString) {
		this.senderString = senderString;
	}

	public Message() {
		
	}
	
	public Message(int id, Agent agent, Insured insured) {
		super();
		this.id = id;
		this.agent = agent;
		this.insured = insured;
	}
	
//	End of constructors
	
	public Agent getAgent() {
		return agent;
	}

	public void setAgent(Agent agent) {
		this.agent = agent;
	}

	public Insured getInsured() {
		return insured;
	}

	public void setInsured(Insured insured) {
		this.insured = insured;
	}

	public int getId() {
		return id;
	}

	public Character getSenderChar() {
		return senderChar;
	}

	public void setSenderChar(Character senderChar) {
		this.senderChar = senderChar;
	}

	public String getMessageBody() {
		return messageBody;
	}

	public void setMessageBody(String messageBody) {
		this.messageBody = messageBody;
	}
	
	@Override
	public String toString() {
		senderString = senderChar + "";
		return senderString;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((agent == null) ? 0 : agent.hashCode());
		result = prime * result + id;
		result = prime * result + ((insured == null) ? 0 : insured.hashCode());
		result = prime * result + ((messageBody == null) ? 0 : messageBody.hashCode());
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
		Message other = (Message) obj;
		if (agent == null) {
			if (other.agent != null)
				return false;
		} else if (!agent.equals(other.agent))
			return false;
		if (id != other.id)
			return false;
		if (insured == null) {
			if (other.insured != null)
				return false;
		} else if (!insured.equals(other.insured))
			return false;
		if (messageBody == null) {
			if (other.messageBody != null)
				return false;
		} else if (!messageBody.equals(other.messageBody))
			return false;
		return true;
	}
	
}
