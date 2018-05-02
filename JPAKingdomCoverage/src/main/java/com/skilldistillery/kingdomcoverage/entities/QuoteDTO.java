package com.skilldistillery.kingdomcoverage.entities;

import java.util.List;

public class QuoteDTO {
	
	private int occupationIdForQuote;
	
	private int speciesIdForQuote;
	
	private List<Integer> coveragesIdsForQuote;

	public int getOccupationIdForQuote() {
		return occupationIdForQuote;
	}

	public void setOccupationIdForQuote(int occupationIdForQuote) {
		this.occupationIdForQuote = occupationIdForQuote;
	}

	public int getSpeciesIdForQuote() {
		return speciesIdForQuote;
	}

	public void setSpeciesIdForQuote(int speciesIdForQuote) {
		this.speciesIdForQuote = speciesIdForQuote;
	}

	public List<Integer> getCoveragesIdsForQuote() {
		return coveragesIdsForQuote;
	}

	public void setCoveragesIdsForQuote(List<Integer> coveragesIdsForQuote) {
		this.coveragesIdsForQuote = coveragesIdsForQuote;
	}
	
	

}
