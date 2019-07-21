package org.iii.seaotter.jayee.service;

import org.iii.seaotter.jayee.dao.ChatMessageStoreDao;
import org.iii.seaotter.jayee.entity.ChatMessageStore;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ChatMessageStoreService {
	@Autowired
	ChatMessageStoreDao chatMessageStoreDao;
	
	public void recordMessage(ChatMessageStore bean) {
		chatMessageStoreDao.save(bean);
	}
	
	public Page<ChatMessageStore> getAll(Specification<ChatMessageStore> specification, Pageable pageable){
		return chatMessageStoreDao.findAll(specification,pageable);	
	}
	
}
