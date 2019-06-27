package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Article.Type;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleDao extends JpaRepository<Article, Long> {

	public List<Article> findByNameContainingOrContentContaining(String name, String content);
	public Article findByRefIdAndType(Long refId, Type type);
	public List<Article> findTop10ByOrderByCountDesc();
}
