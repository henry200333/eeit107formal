package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ForumDao;
import org.iii.seaotter.jayee.entity.Forum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ForumService {
	@Autowired
	private ForumDao forumDao;
	
	@Transactional(readOnly = true)
	public List<Forum> getAll(){
		return forumDao.findAll();
	}
	
	public Forum create(Forum forum) {	
		return forumDao.save(forum);
	}
	
	public Forum getById(Long id) {
		return forumDao.findById(id).orElse(null);
	}
	
	public void update(Forum forum) {
		forumDao.save(forum);
	}
	
	public void delete(Forum forum) {
		forumDao.delete(forum);	
	}
	public void deleteById(Long id) {
		forumDao.deleteById(id);
	}

}
