package org.iii.seaotter.jayee.service;

import java.net.URL;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.iii.seaotter.jayee.dao.ActivityDao;
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Notice;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import net.bytebuddy.asm.Advice.This;

@Service
public class ActivityService {
	@Autowired
	private ActivityDao activityDao;
	
	@Autowired
	private SecurityUserDao securityUserDao; 
	
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
	
	public List<Activity> getByArtistId(Long userid){
		return activityDao.findByUseraId(userid);
	}
	
	
	public List<Activity> getActiveActivity(java.util.Date date){
		return activityDao.findByBeginTimeLessThanEqual(date);
	}
	public List<Activity> getPastActivity(java.util.Date date){
		return activityDao.findByBeginTimeLessThanEqual(date);
	}
	
	
	
	
	
	
	
	public static void saveImage(MultipartFile imageFile, Long activityId) throws Exception {

		URL R = This.class.getResource("/");
		String decoded = URLDecoder.decode(R.getFile(), "UTF-8");
		if (decoded.startsWith("/")) {
			decoded = decoded.replaceFirst("/", "");
		}
		decoded = decoded.replace("target", "src");
		decoded = decoded.replace("classes", "main");
		decoded += "webapp/resources/user-bootstrap/img/activity/";
		Files.write(Paths.get(decoded +"activity"+activityId + ".jpg"), imageFile.getBytes());

	}
	
	
	
	
	
}
