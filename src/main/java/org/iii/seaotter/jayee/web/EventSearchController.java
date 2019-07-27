package org.iii.seaotter.jayee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/map")
public class EventSearchController {

	@Autowired
	private VenderService venderService;
	@Autowired
	private JobService jobservice;
	
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/page")
	public String listPage(Model model) {
		return "/user/eventsearch";
	}


	
	@RequestMapping("/venderself")
	public String venderselfpage(@RequestParam("id")Long id, Model model) {
		Vender bean= venderService.getById(id);

//		System.out.println(bean);
		model.addAttribute("venderparam",bean);
		return "/admin/vender-jobs";
	}


	

	
	
	
	@RequestMapping("/maptest")
	public String mapPage() {
		return "/admin/vender-maptest";
	}
	

	
	
	

	


	@RequestMapping("/map")
	@ResponseBody
	public List<Vender> map(@RequestParam(value = "page") Integer page, @RequestParam(value = "rows") Integer size,
			@RequestParam(value = "maxlat") Double maxlat, @RequestParam(value = "minlat") Double minlat,
			@RequestParam(value = "maxlng") Double maxlng, @RequestParam(value = "minlng") Double minlng) {
		
		Pageable pageable = PageRequest.of(page - 1, size);
		Specification<Vender> specification = new Specification<Vender>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Vender> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (!StringUtils.isEmpty(maxlat) && !StringUtils.isEmpty(minlat)) {
					predicate = cb.and(predicate,cb.between(root.get("lat"), minlat, maxlat));
				}
				if (!StringUtils.isEmpty(maxlng) && !StringUtils.isEmpty(minlng)) {

					predicate = cb.and(predicate,cb.between(root.get("lng"), minlng, maxlng));
				}

				return predicate;
			}
		};

		System.out.println(venderService.getAll(specification, pageable).getContent().size());
		return venderService.getAll(specification, pageable).getContent();
	}

	

	

}
