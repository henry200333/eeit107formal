package org.iii.seaotter.jayee.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

import org.iii.seaotter.jayee.dao.PerformanceDao;
import org.iii.seaotter.jayee.entity.Performance;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class PerformanceService {
	@Autowired
	private PerformanceDao performanceDao;
	
	@Transactional(readOnly=true)
	public List<Performance> getAll(){
		return performanceDao.findAll();
		
	}
	
	public Performance getById(Long id) {
		return performanceDao.findById(id).orElse(null);
		
	}
	

	public Performance insert(Performance entity) {
		LocalDateTime localDateTime = LocalDateTime.now();		
		ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        Date date = Date.from(zdt.toInstant());
		entity.setUpdateTime(date);
		System.out.println(entity.getUpdateTime());
		Performance performance = performanceDao.save(entity);
		return performance;
		
	}
	
	public boolean update(Performance entity) {
		boolean result = false;
		LocalDateTime localDateTime = LocalDateTime.now();		
		ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        Date date = Date.from(zdt.toInstant());
		entity.setUpdateTime(date);
		System.out.println(entity);
		if(performanceDao.findById(entity.getId())!=null) {
			Performance performancenew = performanceDao.save(entity);
			if(performancenew!=null)
				result=true;
		}
		return result;
	}
	
	public void delete(Performance entity) {
		if(performanceDao.findById(entity.getId())!=null) {
			performanceDao.delete(entity);
			
		}
	
	}
	
	public List<Performance> test(Long x) {
		
		return performanceDao.findByIdGreaterThanEqual(x);
	}
	
	public Performance getTopByOrderByViewsDesc() {
		return performanceDao.findTopByOrderByViewsDesc();
	}
}
