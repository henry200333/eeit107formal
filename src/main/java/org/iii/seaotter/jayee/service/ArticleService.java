package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.dao.ArticleDao;
import org.iii.seaotter.jayee.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ArticleService {
	@Autowired
	private ArticleDao articleDao;

	@Transactional(readOnly = true)
	public List<Article> getAll() {
		return articleDao.findAll();
	}

	public Article getById(Long id) {
		return articleDao.findById(id).orElse(null);
	}

	public Article insert(Article entity) {
		Article article = articleDao.save(entity);
		return article;
	}

	public Article update(Article entity) {
		Article article = null;
		if (articleDao.findById(entity.getId()) != null) {
			article = articleDao.save(entity);
		}
		return article;
	}

	public void delete(Article entity) {
		if (articleDao.findById(entity.getId()) != null) {
			articleDao.delete(entity);
		}
	}
	
	public List<Article> getByNameContainingOrContentContaining(String name, String content){
		return articleDao.findByNameContainingOrContentContaining(name, content);
	}
	
	public Article getTopByCount() {
		return articleDao.findTopByOrderByCountDesc();
	}
	
	public List<Article> getTop10ByCount() {
		return articleDao.findTop10ByOrderByCountDesc();
	}
}
