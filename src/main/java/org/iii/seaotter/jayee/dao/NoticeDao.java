package org.iii.seaotter.jayee.dao;


import java.util.List;

import org.iii.seaotter.jayee.entity.Notice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface NoticeDao extends JpaRepository<Notice, Long>,JpaSpecificationExecutor<Notice> {
	
	public List<Notice> findByReceiver(Long receiverId);
	public List<Notice> findByReceiverAndFriendstatusOrderBySendtimeDesc(Long receiverId,String friendStatus);
}
