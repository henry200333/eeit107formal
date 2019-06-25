package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Forum.Board;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ForumDao extends JpaRepository<Forum, Long> {

	List<Forum> findByBoardAndRefId(Board board, Long refId);
}
