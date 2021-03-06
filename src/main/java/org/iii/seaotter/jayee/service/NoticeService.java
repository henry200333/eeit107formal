package org.iii.seaotter.jayee.service;





import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.Date;
import java.util.List;

import org.iii.seaotter.jayee.dao.NoticeDao;
import org.iii.seaotter.jayee.dao.SecurityUserDao;
import org.iii.seaotter.jayee.entity.Notice;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class NoticeService {
	@Autowired
	private NoticeDao noticeDao ;
	
	@Autowired
	private SecurityUserDao securityUserDao;
	
	
	@Transactional(readOnly = true)
	public Page<Notice> getAll(Specification<Notice> specification, Pageable pageable) {
		return noticeDao.findAll(specification, pageable);
		
	}
	
	public void save(Notice notice) {
		notice.setReaded(false);
		LocalDateTime localDateTime = LocalDateTime.now();		
		ZoneId zoneId = ZoneId.systemDefault();
        ZonedDateTime zdt = localDateTime.atZone(zoneId);
        Date date = Date.from(zdt.toInstant());
        notice.setSendtime(date);
		noticeDao.save(notice);
		return;
	}
	
	public void update(Notice notice) {
		noticeDao.save(notice);
		return;
	}
	
	public Long addFriendNotice(String reciever) {
		String account = SecurityContextHolder.getContext().getAuthentication().getName();
		SecurityUser sender = securityUserDao.findByAccount(account);
		SecurityUser recieverBean = securityUserDao.findByDisplayName(reciever);
		Notice notice = new Notice();
		notice.setContent(sender.getDisplayName()+"對你發送好友邀請");
		notice.setFriendstatus("申請中");
		notice.setReaded(false);
		notice.setReceiver(recieverBean.getUserId());
		notice.setSender(sender.getUserId());
		notice.setUrl("/"+sender.getAccount());
		noticeDao.save(notice);
		return notice.getId();
	}
	
	public void disFriendNotice(Long noticeId) {
		Notice notice = noticeDao.getOne(noticeId);
		noticeDao.delete(notice);
	}

	public Notice findById(Long id) {
		return noticeDao.getOne(id);
	}
		
	public List<Notice> getAllByReceiver(Long receiverId){
		return noticeDao.findByReceiver(receiverId);
	}
	
	public Boolean checkFriendNotice(Long userId,Long friendId){
		Notice notice= noticeDao.findByReceiverAndSender(friendId, userId);
		if(notice!=null && notice.getFriendstatus().equals("申請中"))
			return true;
		else
			return false;
	}
	
	public Long getReceiverAndSender(Long userId,Long friendId) {
		return noticeDao.findByReceiverAndSender(friendId, userId).getId();
	}
	

	
	
}
