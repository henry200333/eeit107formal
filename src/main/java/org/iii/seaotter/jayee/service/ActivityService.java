package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ActivityDao;
import org.iii.seaotter.jayee.entity.Activity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ActivityService {
	@Autowired
	private ActivityDao activityDao;
	
	public List<Activity> getAll() {
		return activityDao.findAll();
		
	}
}
