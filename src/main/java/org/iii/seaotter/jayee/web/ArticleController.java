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
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/article")
public class ArticleController {

	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private SecurityUserService securityUserService;
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private PerformanceService performanceService;
	
	@Autowired
	private VenderService venderService;

	@RequestMapping("")
	public String articleListPage() {
		return "/user/article-list";
	}

	@RequestMapping("/{articleId}")
	public String articleSinglePage(@PathVariable(name = "articleId") Long id, Model model) {
		Article article = articleService.getById(id);
		if (article != null) {
			model.addAttribute("createdDate", article.getAnnounce().toString().substring(0, 19));
			model.addAttribute("article", article);
			article.setCount(article.getCount() + 1);
			articleService.update(article);
			return "/user/article-single";
		}
		return "/user/article-list";
	}

	@GetMapping("/query")
	@ResponseBody
	public GridResponse<Article> query(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "type", defaultValue = "") ArticleType articleType,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "rows", defaultValue = "20") Integer size,
			@RequestParam(value = "sidx", defaultValue = "announce") String sidx,
			@RequestParam(value = "sord", defaultValue = "desc") String sord) {
		Sort sort = new Sort(Sort.Direction.ASC, sidx);
		if ("desc".equalsIgnoreCase(sord)) {
			sort = new Sort(Sort.Direction.DESC, sidx);
		}
		Pageable pageable = PageRequest.of(page - 1, size, sort);
		GridResponse<Article> gridResponse = new GridResponse<>();
		Specification<Article> specification = new Specification<Article>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				if (!StringUtils.isEmpty(name)) {
					where = cb.and(where, cb.like(root.get("name"), "%" + name + "%"));
				}
				if (!StringUtils.isEmpty(articleType)) {
					where = cb.and(where, cb.equal(root.get("articleType"), articleType));
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
	
	@RequestMapping("/add")
	public String addArticlePage(
			@RequestParam(name="type", defaultValue="") String articleType, 
			@RequestParam(name="refid", defaultValue="0") Long refId, 
			Model model) {
		Long userId = securityUserService.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName()).getUserId();
		if ("".equals(articleType) || refId == 0) {
			model.addAttribute("articleType", articleType);
			model.addAttribute("refId", refId);
			return "/user/article-list";
		}
		if ("Artist".equals(articleType)) {
			if (refId == userId) {
				model.addAttribute("articleType", articleType);
				model.addAttribute("refId", refId);
				return "/user/article-add";
			}
		}else if("Activity".equals(articleType)) {
			Activity activity = activityService.getById(refId);
			if (activity != null) {
				if (activity.getUseraId() == userId) {
					model.addAttribute("articleType", articleType);
					model.addAttribute("refId", refId);
					return "/user/article-add";
				}
			}
		}else if("Performance".equals(articleType)) {
			Performance performance = performanceService.getById(refId);
			if (performance != null) {
				if (performance.getUserpId() == userId) {
					model.addAttribute("articleType", articleType);
					model.addAttribute("refId", refId);
					return "/user/article-add";
				}
			}
		}else if("Vender".equals(articleType)) {
			Vender vender = venderService.getById(refId);
			if (vender != null) {
				if (vender.getUser().getUserId() == userId) {
					model.addAttribute("articleType", articleType);
					model.addAttribute("refId", refId);
					return "/user/article-add";
				}
			}
		}
		return "/user/article-list";
	}

	@RequestMapping("/top6")
	@ResponseBody
	public AjaxResponse<List<Article>> articleTop6() {
		AjaxResponse<List<Article>> res = new AjaxResponse<>();
		res.setType(AjaxResponseType.SUCCESS);
		res.setData(articleService.getTop6ByCount());
		return res;
	}

}
