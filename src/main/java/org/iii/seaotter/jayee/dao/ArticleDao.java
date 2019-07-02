package org.iii.seaotter.jayee.dao;

import java.util.List;

import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface ArticleDao extends JpaRepository<Article, Long>,JpaSpecificationExecutor<Article> {

	public Article findByRefIdAndArticleType(Long refId, ArticleType type);
	public List<Article> findTop10ByOrderByCountDesc();
}
