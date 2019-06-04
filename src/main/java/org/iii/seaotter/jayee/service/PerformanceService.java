package org.iii.seaotter.jayee.service;

import java.util.Date;
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
	
	public void insert(String entity) {
		//performanceDao.save(entity)
		
	}
	
	public Performance insert(Performance entity) {
		java.util.Date date = new Date();
		entity.setUpdateTime(date);
		Performance performance = performanceDao.save(entity);
		return performance;
		
	}
}
