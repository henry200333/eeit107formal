package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ActivityDao;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Artist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ActivityService {
	@Autowired
	private ActivityDao activityDao;
	
	@Transactional(readOnly = true)
	public List<Activity> getAll() {
		return activityDao.findAll();
		
	}
	
	@Transactional(readOnly = true)
	public Page<Activity> getAll(Specification<Activity> specification, Pageable  pageable) {
		return activityDao.findAll(specification, pageable);
	}
	
	public Activity getById(Long id) {
		return activityDao.findById(id).orElse(null);
	}
	
	public Activity insert(Activity entity) {
		Activity activity = activityDao.save(entity);
		return activity;
	}

	public Activity update(Activity entity) {
		Activity activity = activityDao.save(entity);
		return activity;
	}

	public void delete(Activity entity) {
		if (activityDao.findById(entity.getId()) != null) {
			activityDao.delete(entity);
		}
	}
	public void deleteById(Long id) {
		activityDao.deleteById(id);
	}
	
	public List<Activity> getTop3NameByAwesomeNum() {
		List<Activity> activity = activityDao.findTop3ByOrderByAwesomeNumDesc();	
		return activity;
		
	}
	
	public List<Activity> getByArtistId(Artist artist){
		return activityDao.findByArtistId(artist);
	}
}
