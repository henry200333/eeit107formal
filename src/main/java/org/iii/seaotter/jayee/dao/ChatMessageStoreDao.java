package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.ChatMessageStore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ChatMessageStoreDao extends JpaRepository<ChatMessageStore, Long>, JpaSpecificationExecutor<ChatMessageStore>{

}
