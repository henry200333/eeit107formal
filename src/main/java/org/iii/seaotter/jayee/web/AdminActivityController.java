package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin/activity")
public class AdminActivityController {
	
	
	
	@Autowired
	private ActivityService activityService;
	
	
	@RequestMapping("/list")
	public String listPage(Model model) {	
		model.addAttribute("activityList",activityService.getAll());
		model.addAttribute("activity", new Activity());
		return "/admin/activity-list";
		
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		model.addAttribute("activity", new Activity());
		return "/admin/activity-add";

	}

	@RequestMapping("/edit")
	public String editPage(Activity activity, Model model) {
		activity=activityService.getById(activity.getId());
		model.addAttribute("activityParam",activity);
		return "/admin/activity-edit";

	}
	
	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Activity> insert(@RequestBody Activity activity) {
		System.out.println("即將新增資料:"+activity);
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();
		activity=activityService.insert(activity);
		aJaxResp.setData(activity);
		aJaxResp.setType(AjaxResponseType.SUCCESS);
		return aJaxResp;

	}
	
	@PutMapping("/update")
	@ResponseBody
	public AjaxResponse<Activity> update(@RequestBody Activity activity) {
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();
		activity=activityService.update(activity);
		aJaxResp.setType(AjaxResponseType.SUCCESS);
		aJaxResp.setData(activity);
		return aJaxResp;
	}
	
	@DeleteMapping("/delete")
	@ResponseBody
	public AjaxResponse<Activity> delete(@RequestBody Activity activity) {
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();		
		activity =activityService.getById(activity.getId());
		
		if(activity!=null) {
			activityService.delete(activity);
			aJaxResp.setType(AjaxResponseType.SUCCESS);
			aJaxResp.setData(activity);
		}else {
			aJaxResp.setType(AjaxResponseType.ERROR);
		}
		return aJaxResp;
	}
	
//	@GetMapping("/query")
//	@ResponseBody
//	public List<Activity> query(){	
//		List<Activity> activity=activityService.getAll();
//		return activity;
//	}
	
	
	
	@GetMapping("/query")
	@ResponseBody
	public List<Activity> query(@RequestParam(value="name", defaultValue="") String name,
								@RequestParam(value="artist", defaultValue="") String artist, 
								@RequestParam(value="page") Integer page, 
								@RequestParam(value="rows") Integer size){	
		Pageable pageable = PageRequest.of(page-1, size);
		Specification<Activity> specification = new Specification<Activity>() {
			private static final long serialVersionUID = 1L;
			@Override
			public Predicate toPredicate(Root<Activity> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				if (!StringUtils.isEmpty(name)) {
					where = cb.and(cb.like(root.get("name"), "%" + name + "%"));
				}
				if (!StringUtils.isEmpty(artist)) {
					where = cb.and(cb.equal(root.get("artist"), artist));
				}
				return where;
			}
		};
		return activityService.getAll(specification, pageable).getContent();
	}
	
	
}
