package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Performance;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PerformanceDao extends JpaRepository<Performance,Long>{

	
	List<Performance> findByIdGreaterThanEqual(Long test);
}
