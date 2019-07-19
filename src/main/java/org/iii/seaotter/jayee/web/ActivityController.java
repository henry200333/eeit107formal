package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/activity")
public class ActivityController {
	
	@Autowired
	ActivityService activityService;
	
	@Autowired
	ArticleService articleService;
	
	

	@RequestMapping("/list")
	public String list() {
		return "/user/activityTest";
	}
	@RequestMapping("/view")
	public String view() {
		return "/user/activityView";
	}

	@RequestMapping("/article/{id}")
	@ResponseBody
	public AjaxResponse<List<Article>> getArticle(@PathVariable Long id){
		System.out.println(id);
		AjaxResponse<List<Article>> ajaxResponse=new AjaxResponse<>();
		List<Article> article=articleService.getByRefIdAndType(id, ArticleType.Activity);
		System.out.println(article);
		if(article.isEmpty()) {
			ajaxResponse.setType(AjaxResponseType.ERROR);
			return ajaxResponse;
		}
		ajaxResponse.setType(AjaxResponseType.SUCCESS);
		ajaxResponse.setData(article);
		return ajaxResponse;
	}
	
	
	@RequestMapping("/query")
	@ResponseBody
	public GridResponse<Activity> query(@RequestParam(value = "page") Integer page,
										@RequestParam(value="actType", defaultValue="") String actType,
										@RequestParam(value="find", defaultValue="") String find
			) {
		
		String sidx="beginTime";
		Integer size = 100;
		GridResponse<Activity> grid = new GridResponse<Activity>();
		Sort sort = new Sort(Sort.Direction.DESC, sidx);
		Pageable pageable = PageRequest.of(page - 1, size, sort);
		
		
		Specification<Activity> specification = new Specification<Activity>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Activity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				
				
				if (!StringUtils.isEmpty(find)) {
					where = cb.and(cb.like(root.get("name"), "%" + find + "%"));
					where = cb.or(where,cb.like(root.get("description"), "%" + find +"%"));
					where = cb.or(where,cb.like(root.get("artist"), "%" + find +"%"));
				}
				if (!StringUtils.isEmpty(actType) && actType.equals("perf")) 
					where = cb.and(cb.like(root.get("perfType"), "表演藝術"));
				if (!StringUtils.isEmpty(actType) && actType.equals("look")) 
					where = cb.and(cb.like(root.get("perfType"), "視覺藝術"));
				if (!StringUtils.isEmpty(actType) && actType.equals("crea")) 
					where = cb.and(cb.like(root.get("perfType"), "創意藝術"));
				if (!StringUtils.isEmpty(actType) && actType.equals("all")) 
					where = cb.and(cb.like(root.get("perfType"), "%"));
			
			
				return where;
			}
		};
		Page<Activity> result = activityService.getAll(specification, pageable);
		grid.setRows(result.getContent());
		grid.setPage(page);
		grid.setRecords(result.getTotalElements());
		grid.setTotal(result.getTotalPages());
		return grid;
	}
	
}
