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
import org.iii.seaotter.jayee.entity.Location;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.LocationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/activity")
public class ActivityController {
	
	@Autowired
	ActivityService activityService;
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	LocationService locationService;
	

	@RequestMapping(value= {"/list","/view"})
	public String list() {
		return "/user/activityList";
	}
	
	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable Long id, Model model) {
		Activity activity=activityService.getById(id);
		model.addAttribute("activityParam", activity);
		model.addAttribute("beginTime", activity.getBeginTime().toString().substring(0, 16));
		model.addAttribute("endTime", activity.getEndTime().toString().substring(0, 16));
		
		return "/user/activityEdit";
	}
	@RequestMapping("/add/{id}")
	public String addPage(@PathVariable Long id, Model model) {
		Activity activity=activityService.getById(id);
		model.addAttribute("activityParam", activity);
		model.addAttribute("beginTime", activity.getBeginTime().toString().substring(0, 16));
		model.addAttribute("endTime", activity.getEndTime().toString().substring(0, 16));
		
		return "/user/activityAdd";
	}
	
	@RequestMapping("/view/{id}")
	public String view(@PathVariable Long id, Model model) {
		Activity activity=activityService.getById(id);
		model.addAttribute("activityParam", activity);
		model.addAttribute("beginTime", activity.getBeginTime().toString().substring(0, 16));
		model.addAttribute("endTime", activity.getEndTime().toString().substring(0, 16));
		
		return "/user/activityView";
	}

	@RequestMapping("/article/{id}")
	@ResponseBody
	public AjaxResponse<List<Article>> getArticle(@PathVariable Long id){
	
		AjaxResponse<List<Article>> ajaxResponse=new AjaxResponse<>();
		List<Article> article=articleService.getByRefIdAndType(id, ArticleType.Activity);

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
										@RequestParam(value="rows") Integer rows,
										@RequestParam(value="actType", defaultValue="") String actType,
										@RequestParam(value="find", defaultValue="") String find
			) {
		String sidx="beginTime";
		GridResponse<Activity> grid = new GridResponse<Activity>();
		Sort sort = new Sort(Sort.Direction.DESC, sidx);
		Pageable pageable = PageRequest.of(page - 1, rows, sort);
		
		
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
	
	
	
	
	
	
	
	
	@RequestMapping("/location")
	@ResponseBody
	public List<Location> getLocation(){
		return locationService.getAll();
	}
	@RequestMapping("/location/city")
	@ResponseBody
	public List<String> getDistinctCity(){
		return locationService.getDistinctCity();
	}
	
	
	@RequestMapping("/location/{city}")
	@ResponseBody
	public List<String> getDistinctDistrictByCity(@PathVariable String city){
		return locationService.getDistinctDistrictByCity(city);
	}
	@RequestMapping("/location/district/{district}")
	@ResponseBody
	public List<Location> getByDistrict(@PathVariable String district){
		return locationService.getByDistrict(district);
	}
	@RequestMapping("/location/address/{locationName}")
	@ResponseBody
	public List<Location> getByLocationName(@PathVariable String locationName){
		return locationService.getByLocationName(locationName);
	}
	
}
