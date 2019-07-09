package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.entity.Location;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArtistService;
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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
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
	@Autowired
	private ArtistService artistService;
	@Autowired
	private LocationService locationService;
	
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

	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable Long id, Model model) {
		Activity activity=activityService.getById(id);
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
	
	@DeleteMapping("/{id}")
	@ResponseBody
	public AjaxResponse<Activity> delete(@PathVariable Long id) {
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();		
		activityService.deleteById(id);
			aJaxResp.setType(AjaxResponseType.SUCCESS);
		return aJaxResp;
	}
	
//	@GetMapping("/query")
//	@ResponseBody
//	public List<Activity> query(){	
//		List<Activity> activity=activityService.getAll();
//		return activity;
//	}
	
	@RequestMapping("/artist")
	@ResponseBody
	public List<Artist> getArtist(){
		List<Artist> artist =artistService.getAll();
		return artist;
	}
	
	
	
	
	@RequestMapping("/query")
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
		//setTotal總頁數
		gridResponse.setTotal(result.getTotalPages());
		//setRecords總比數
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
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
