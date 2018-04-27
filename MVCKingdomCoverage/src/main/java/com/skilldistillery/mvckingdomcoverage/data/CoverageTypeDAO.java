package com.skilldistillery.mvckingdomcoverage.data;

import com.skilldistillery.kingdomcoverage.entities.CoverageType;

public interface CoverageTypeDAO {

	CoverageType create(CoverageType coverage);

	CoverageType update(int id, CoverageType coverage);

	CoverageType show(int id);

}
