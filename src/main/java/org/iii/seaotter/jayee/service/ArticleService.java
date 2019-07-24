package org.iii.seaotter.jayee.service;

import java.util.List;

import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.dao.ArticleDao;
import org.iii.seaotter.jayee.entity.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
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
	
	@Transactional(readOnly = true)
	public Page<Article> getAll(Specification<Article> specification, Pageable  pageable) {
		return articleDao.findAll(specification,pageable);
	}
	
	@Transactional(readOnly = true)
	public Article getById(Long id) {
		return articleDao.findById(id).orElse(null);
	}
	
	public Article insert(Article entity) {
		return articleDao.save(entity);
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
	
	public List<Article> getByRefIdAndType(Long refId, ArticleType type) {
		return articleDao.findByRefIdAndArticleType(refId, type);
	}
	
	public List<Article> getTop10ByCount() {
		return articleDao.findTop10ByOrderByCountDesc();
	}
	
	public List<Article> getTop6ByCount() {
		return articleDao.findTop6ByOrderByCountDesc(); 
	}
	
	public List<Article> getByAnnouncedUserId(Long announcedUserId){
		return articleDao.findByAnnouncedUserId(announcedUserId);
	}
	
	public List<Integer> getTop6ForumCountByOrderByCountDesc(){
		return articleDao.findTop6ForumCountByOrderByCountDesc();
	}
}
