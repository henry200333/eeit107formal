package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface PerformanceDao extends JpaRepository<Performance,Long>,JpaSpecificationExecutor<Performance>{

	
	List<Performance> findByIdGreaterThanEqual(Long test);
//	List<Performance> findAllOrderByViews();
	
	public Performance findTopByOrderByViewsDesc();
	public List<Performance> findTop3ByOrderByViewsDesc();
	public List<SecurityUser> findDislikeuserById(Long id);
}
