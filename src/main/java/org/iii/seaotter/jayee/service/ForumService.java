package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ForumDao;
import org.iii.seaotter.jayee.entity.Forum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ForumService {
	@Autowired
	private ForumDao forumDao;
	
	public List<Forum> getAll(){
		return forumDao.findAll();
	}
	
	public Forum create(Forum forum) {	
		return forumDao.save(forum);
	}

}
