package com.skilldistillery.kingdomcoverage.entities;

public class InsuredAddressDTO {
	
private int insuredAge;
	
	private char insuredGender;
	
	private String insuredFirstName;
	
	private String insuredLastName;
	
	private int insuredSpeciesId;
	
	private int insuredOccupationId;
	
	private String addressStreet;
	
	private String addressCity;
	
	private String addressRealm;

//	End of fields
	
	public InsuredAddressDTO() {
		super();
	}
	
//	End of Constructors
	
	public int getInsuredAge() {
		return insuredAge;
	}

	public void setInsuredAge(int insuredAge) {
		this.insuredAge = insuredAge;
	}

	public char getInsuredGender() {
		return insuredGender;
	}

	public void setInsuredGender(char insuredGender) {
		this.insuredGender = insuredGender;
	}

	public String getInsuredFirstName() {
		return insuredFirstName;
	}

	public void setInsuredFirstName(String insuredFirstName) {
		this.insuredFirstName = insuredFirstName;
	}

	public String getInsuredLastName() {
		return insuredLastName;
	}

	public void setInsuredLastName(String insuredLastName) {
		this.insuredLastName = insuredLastName;
	}

	public int getInsuredSpeciesId() {
		return insuredSpeciesId;
	}

	public void setInsuredSpeciesId(int insuredSpeciesId) {
		this.insuredSpeciesId = insuredSpeciesId;
	}

	public int getInsuredOccupationId() {
		return insuredOccupationId;
	}

	public void setInsuredOccupationId(int insuredOccupationId) {
		this.insuredOccupationId = insuredOccupationId;
	}

	public String getAddressStreet() {
		return addressStreet;
	}

	public void setAddressStreet(String addressStreet) {
		this.addressStreet = addressStreet;
	}

	public String getAddressCity() {
		return addressCity;
	}

	public void setAddressCity(String addressCity) {
		this.addressCity = addressCity;
	}

	public String getAddressRealm() {
		return addressRealm;
	}

	public void setAddressRealm(String addressRealm) {
		this.addressRealm = addressRealm;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("UserInsuredAddressDTO [userName=").append(", insuredAge=").append(insuredAge).append(", insuredGender=")
				.append(insuredGender).append(", insuredFirstName=").append(insuredFirstName)
				.append(", insuredLastName=").append(insuredLastName).append(", insuredSpeciesId=")
				.append(insuredSpeciesId).append(", insuredOccupationId=").append(insuredOccupationId)
				.append(", addressStreet=").append(addressStreet).append(", addressCity=").append(addressCity)
				.append(", addressRealm=").append(addressRealm).append("]");
		return builder.toString();
	}
	
}
