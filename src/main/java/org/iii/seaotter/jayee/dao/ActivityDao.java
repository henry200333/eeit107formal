package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ActivityDao extends JpaRepository<Activity,Long>,JpaSpecificationExecutor<Activity>{

	public List<Activity> findTop3ByOrderByAwesomeNumDesc();
	
	public List<Activity> findByUseraId(Long userid);
	
	public List<Activity> findByBeginTimeLessThanEqual(java.util.Date date);
	
	public List<Activity> findByEndTimeGreaterThanEqual(java.util.Date date);
	
}
