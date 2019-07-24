package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

public interface ArticleDao extends JpaRepository<Article, Long>,JpaSpecificationExecutor<Article> {

	public List<Article> findByRefIdAndArticleType(Long refId, ArticleType type);
	public List<Article> findByAnnouncedUserId(Long announcedUserId);
	public List<Article> findTop10ByOrderByCountDesc();
	public List<Article> findTop6ByOrderByCountDesc(); 
	@Query(nativeQuery=true, value="select top(6) count(f.forum_id) as forum_count from article a left outer join forum f on f.ref_id = a.id and f.forum_board = 'Article' group by a.count order by a.count desc")
	public List<Integer> findTop6ForumCountByOrderByCountDesc();
}
