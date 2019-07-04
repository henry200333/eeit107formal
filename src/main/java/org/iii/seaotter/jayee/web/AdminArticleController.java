package org.iii.seaotter.jayee.web;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")
	public String listPage() {
		return "/admin/article-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/article-add";
	}

	@RequestMapping("/edit")
	public String editPage(Article article, Model model) {
		article = articleService.getById(article.getId());
		model.addAttribute("articleParam", article);
		return "/admin/article-edit";
	}

	@RequestMapping("/query")
	@ResponseBody // 轉成JSON
	public GridResponse<Article> query(@RequestParam(value="name", defaultValue="") String name, 
			@RequestParam(value="type", defaultValue="") ArticleType articleType,
			@RequestParam(value="page") Integer page, 
			@RequestParam(value="rows") Integer size,
			@RequestParam(value="sidx") String sidx,
			@RequestParam(value="sord") String sord) {
		Sort sort=new Sort(Sort.Direction.ASC,sidx);
		if("desc".equalsIgnoreCase(sord)){
			sort=new Sort(Sort.Direction.DESC,sidx);
		}
		Pageable pageable = PageRequest.of(page-1, size, sort);
		GridResponse<Article> gridResponse = new GridResponse<>();
		Specification<Article> specification = new Specification<Article>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				if (!StringUtils.isEmpty(name)) {
					where = cb.and(cb.like(root.get("name"), "%" + name + "%"));
				}
				if (!StringUtils.isEmpty(articleType)) {
					where = cb.and(cb.equal(root.get("type"), articleType));
				}
				return where;
			}
		};
		Page<Article> result = articleService.getAll(specification, pageable);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setRecords(result.getTotalElements());
		gridResponse.setTotal(result.getTotalPages());
		return gridResponse;
	}

	@PostMapping("/add")
	@ResponseBody
	public AjaxResponse<Article> insert(@Valid @RequestBody Article article, BindingResult result) {
		System.out.println(article);
		AjaxResponse<Article> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		}
		ajaxRes.setType(AjaxResponseType.SUCCESS);
		ajaxRes.setData(articleService.insert(article));
		return ajaxRes;
	}

	@PutMapping("/edit")
	@ResponseBody
	public AjaxResponse<Article> update(@Valid @RequestBody Article article, BindingResult result) {
		System.out.println(article);
		AjaxResponse<Article> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		}
		ajaxRes.setType(AjaxResponseType.SUCCESS);
		ajaxRes.setData(articleService.update(article));
		return ajaxRes;

	}

	@DeleteMapping("/delete")
	@ResponseBody
	public AjaxResponse<Article> delete(@RequestBody Article article) {
		System.out.println(article);
		AjaxResponse<Article> ajaxRes = new AjaxResponse<>();
		article = articleService.getById(article.getId());
		if (article != null) {
			articleService.delete(article);
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(article);
		} else {
			ajaxRes.setType(AjaxResponseType.ERROR);
		}
		return ajaxRes;
	}

}
