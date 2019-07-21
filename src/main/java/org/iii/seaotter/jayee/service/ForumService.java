package org.iii.seaotter.jayee.service;

import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

import org.iii.seaotter.jayee.common.ForumBoard;
import org.iii.seaotter.jayee.dao.ForumDao;
import org.iii.seaotter.jayee.entity.Forum;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
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
	
	public Page<Forum> getAll(Specification<Forum> specification, Pageable pageable){
		return forumDao.findAll(specification,pageable);	
	}
	
	public List<Forum> getBoardRefIDComments(ForumBoard forumBoard, Long refId){
		return forumDao.findByForumBoardAndRefId(forumBoard,refId);		
	}
	
	public Forum create(Forum forum) {	
		LocalDateTime localDateTime = LocalDateTime.now();		
		ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        Date date = Date.from(zdt.toInstant());
        forum.setCommentDate(date);
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
	public List<Forum> selectByBoardAndRefId(ForumBoard forumboard, Long refId){
		return forumDao.findByForumBoardAndRefId(forumboard, refId);
	}

}
