package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Article.Type;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ArticleDao extends JpaRepository<Article, Long>,JpaSpecificationExecutor<Article> {

	public List<Article> findByNameContainingOrContentContaining(String name, String content);
	public Article findByRefIdAndType(Long refId, Type type);
	public List<Article> findTop10ByOrderByCountDesc();
}
