package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Location;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface LocationDao extends JpaRepository<Location,Long>,JpaSpecificationExecutor<Location> {
	@Query("SELECT DISTINCT l.city FROM Location l")
	public List<String> findDistinctCity();
	@Query("SELECT DISTINCT l.district FROM Location l WHERE l.city = ?1")
	public List<String> findDistinctDistrictByCity(String city);	
	public List<Location> findByCityIs(String city);
	public List<Location> findByDistrictIs(String district);
	public List<Location> findByLocationNameIs(String locationName);
	
	
}
