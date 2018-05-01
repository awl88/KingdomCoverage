package com.skilldistillery.mvckingdomcoverage.data;

import java.util.List;

import com.skilldistillery.kingdomcoverage.entities.CoverageType;

public interface CoverageTypeDAO {

	CoverageType create(CoverageType coverage);

	CoverageType update(int id, CoverageType coverage);

	CoverageType show(int id);

	List<CoverageType> getAllTypes();

	CoverageType getTypeByName(String name);

}
