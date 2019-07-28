package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Location;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.LocationService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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
	
	@Autowired
	private ActivityService activityService;
	
	@Autowired
	private LocationService locationService;

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

	@RequestMapping("/location")
	@ResponseBody
	public List<Location> queryLocation(@RequestParam(value = "page") Integer page, @RequestParam(value = "rows") Integer size,
	@RequestParam(value = "maxlat") Double maxlat, @RequestParam(value = "minlat") Double minlat,
	@RequestParam(value = "maxlng") Double maxlng, @RequestParam(value = "minlng") Double minlng){
		Pageable pageable = PageRequest.of(page - 1, size);
		Specification<Location> specification = new Specification<Location>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Location> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
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
			return locationService.getAll(specification, pageable).getContent();
	}
	
	
	
	
	

	
	@RequestMapping("/activity")
	@ResponseBody
	public List<Activity> queryActivity(@RequestParam(value = "page") Integer page,
										@RequestParam(value="rows") Integer rows,
			@RequestParam(value = "maxlat") Double maxlat, @RequestParam(value = "minlat") Double minlat,
			@RequestParam(value = "maxlng") Double maxlng, @RequestParam(value = "minlng") Double minlng
			) {
		String sidx="activityStatus";
		Sort sort = new Sort(Sort.Direction.ASC, sidx);
		Pageable pageable = PageRequest.of(page - 1, rows, sort);
		
		
		Specification<Activity> specification = new Specification<Activity>() {
			private static final long serialVersionUID = 1L;
			@Override
			public Predicate toPredicate(Root<Activity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();	
				if (!StringUtils.isEmpty(maxlat) && !StringUtils.isEmpty(minlat)) {
					where = cb.and(where,cb.between(root.get("lat"), minlat, maxlat));
				}
				if (!StringUtils.isEmpty(maxlng) && !StringUtils.isEmpty(minlng)) {

					where = cb.and(where,cb.between(root.get("lng"), minlng, maxlng));
				}
					where = cb.and(where,cb.between(root.get("activityStatus"),0,1));
				return where;
			}
		};
		return activityService.getAll(specification, pageable).getContent();
	}
	

}
