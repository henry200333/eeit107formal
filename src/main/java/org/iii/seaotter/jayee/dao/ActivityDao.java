package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ActivityDao extends JpaRepository<Activity,Long>,JpaSpecificationExecutor<Activity>{

	public List<Activity> findTop3ByOrderByAwesomeNumDesc();
	
	
	
}
