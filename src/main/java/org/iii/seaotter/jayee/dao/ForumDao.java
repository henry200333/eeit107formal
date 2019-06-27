package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Forum.Board;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ForumDao extends JpaRepository<Forum, Long>, JpaSpecificationExecutor<Forum>  {

	List<Forum> findByBoardAndRefId(Board board, Long refId);

}
