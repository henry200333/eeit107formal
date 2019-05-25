package org.iii.seaotter.jayee.dao;

import org.iii.seaotter.jayee.entity.Article;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticleDao extends JpaRepository<Article, Long> {

}
