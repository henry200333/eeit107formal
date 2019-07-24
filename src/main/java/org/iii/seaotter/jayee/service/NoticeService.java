package org.iii.seaotter.jayee.service;





import java.util.List;

import org.iii.seaotter.jayee.dao.NoticeDao;
import org.iii.seaotter.jayee.entity.Notice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDao ;

	
	@Transactional(readOnly = true)
	public Page<Notice> getAll(Specification<Notice> specification, Pageable pageable) {
		return noticeDao.findAll(specification, pageable);
		
	}
	
	public void save(Notice notice) {
		noticeDao.save(notice);
		return;
	}
	
	
	public List<Notice> getAllByReceiver(Long receiverId){
		return noticeDao.findByReceiver(receiverId);
	}
	

	
	
	
	
}
