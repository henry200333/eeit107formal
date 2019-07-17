package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/activity")
public class ActivityController {
	
	@Autowired
	ActivityService activityService;
	
	

	@RequestMapping("/list")
	public String list() {
		return "/user/activityTest";
	}
	
	@RequestMapping("/side")
	public String side() {
		return "/user/activitySidebar";
	}
	
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Activity> query(){	
		List<Activity> activity=activityService.getAll();
		System.out.println(activity);
		return activity;
	}
	
	@RequestMapping("/query123")
	@ResponseBody
	public GridResponse<Activity> query(@RequestParam(value="userInput", defaultValue="") String userInput,
								@RequestParam(value="artistSearch", defaultValue="") String artistSearch,
								@RequestParam(value="page") Integer page, 
								@RequestParam(value="rows") Integer size,
								@RequestParam(value="sidx") String sidx,
								@RequestParam(value="sord") String sord){	
		GridResponse<Activity> gridResponse=new GridResponse<Activity>();
		Sort sort=new Sort(Sort.Direction.ASC,sidx);
		if("desc".equalsIgnoreCase(sord)){
			sort=new Sort(Sort.Direction.DESC,sidx);
		}
		Pageable pageable = PageRequest.of(page-1, size, sort);
		Specification<Activity> specification = new Specification<Activity>() {
			private static final long serialVersionUID = 1L;
			@Override
			public Predicate toPredicate(Root<Activity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				if (!StringUtils.isEmpty(userInput)) {
					where = cb.and(cb.like(root.get("name"), "%" + userInput + "%"));
//					where = cb.or(where,cb.like(root.get("artist"), "%" + userInput +"%"));
					where = cb.or(where,cb.like(root.get("description"), "%" + userInput +"%"));
				}
				
				return where;
			}
		};
		Page<Activity> result=activityService.getAll(specification, pageable);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setTotal(result.getTotalPages());
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
	}
	
}
