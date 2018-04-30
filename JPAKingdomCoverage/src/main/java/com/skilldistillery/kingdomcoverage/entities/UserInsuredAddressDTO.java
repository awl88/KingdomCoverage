package com.skilldistillery.kingdomcoverage.entities;

public class UserInsuredAddressDTO {
	
	private String userName;
	
	private String userPassword;
	
	private int insuredAge;
	
	private char insuredGender;
	
	private String insuredFirstName;
	
	private String insuredLastName;
	
	private int insuredSpeciesId;
	
	private int insuredOccupationId;
	
	private String addressStreet;
	
	private String addressCity;
	
	private String addressRealm;

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

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
	
}
