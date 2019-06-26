package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Activity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ActivityDao extends JpaRepository<Activity,Long>{

	public List<Activity> findTop3ByOrderByAwesomeNumDesc();
	
	
	
}
