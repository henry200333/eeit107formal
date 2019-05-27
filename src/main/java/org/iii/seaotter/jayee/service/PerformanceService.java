package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.PerformanceDao;
import org.iii.seaotter.jayee.entity.Performance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PerformanceService {
	@Autowired
	private PerformanceDao performanceDao;
	
	public List<Performance> getAll(){
		return performanceDao.findAll();
		
	}
}
