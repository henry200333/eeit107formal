package org.iii.seaotter.jayee.web;

import java.io.IOException;
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
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.ArtistService;
import org.iii.seaotter.jayee.service.LocationService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/activity")
public class ActivityController {
	
	@Autowired
	ActivityService activityService;
	
	@Autowired
	ArticleService articleService;
	
	@Autowired
	LocationService locationService;
	
	@Autowired
	SecurityUserService securityUserService;
	

	@RequestMapping(value= {"/list","/view"})
	public String list() {
		return "/user/activityList";
	}
	
	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable Long id, Model model) {
		String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		Long currentUID=securityUserService.getByUserName(currentUser).getUserId();
		Long activityUID=activityService.getById(id).getUseraId();
		if(currentUID.equals(activityUID)) {
			Activity activity=activityService.getById(id);
			model.addAttribute("activityParam", activity);
			model.addAttribute("beginTime", activity.getBeginTime().toString().substring(0, 16));
			model.addAttribute("endTime", activity.getEndTime().toString().substring(0, 16));
			model.addAttribute("locationCity", locationService.getListById((activity.getLocationId())).get(0).getCity());
			model.addAttribute("locationDistrict", locationService.getListById((activity.getLocationId())).get(0).getDistrict());
			model.addAttribute("locationAddress", locationService.getListById((activity.getLocationId())).get(0).getAddress());
			model.addAttribute("locationLocationName", locationService.getListById((activity.getLocationId())).get(0).getLocationName());
			return "/user/activityEdit";
		}else
		return "/user/activityList";
	}
	@RequestMapping("/add")
	public String addPage(Model model) {
		String userName=SecurityContextHolder.getContext().getAuthentication().getName();
		securityUserService.getByUserName(userName).getDisplayName();
		int size = activityService.getAll().size();
		model.addAttribute("useraId", securityUserService.getByUserName(userName).getUserId());
		model.addAttribute("userName", securityUserService.getByUserName(userName).getDisplayName());
		model.addAttribute("activity", new Activity());
		model.addAttribute("activityPicId",size+1);
		return "/user/activityAdd";
	}
	
	@RequestMapping("/view/{id}")
	public String view(@PathVariable Long id, Model model) {
		Activity activity=activityService.getById(id);
		model.addAttribute("activityParam", activity);
		model.addAttribute("beginTime", activity.getBeginTime().toString().substring(0, 16));
		model.addAttribute("endTime", activity.getEndTime().toString().substring(0, 16));
		model.addAttribute("locationCity", locationService.getListById((activity.getLocationId())).get(0).getCity());
		model.addAttribute("locationDistrict", locationService.getListById((activity.getLocationId())).get(0).getDistrict());
		model.addAttribute("locationAddress", locationService.getListById((activity.getLocationId())).get(0).getAddress());
		model.addAttribute("locationLocationName", locationService.getListById((activity.getLocationId())).get(0).getLocationName());
		
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
		String sidx="id";
		GridResponse<Activity> grid = new GridResponse<Activity>();
		Sort sort = new Sort(Sort.Direction.ASC, sidx);
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
	
	
	@PutMapping("/insert")
	@ResponseBody
	public AjaxResponse<Activity> insert(@RequestBody Activity activity) {
		System.out.println("即將新增資料:"+activity);
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();
		activity.setAwesomeNum(0L);
		activity=activityService.insert(activity);
		aJaxResp.setData(activity);
		aJaxResp.setType(AjaxResponseType.SUCCESS);
		return aJaxResp;

	}
	
	
	
	
	@PutMapping("/update")
	@ResponseBody
	public AjaxResponse<Activity> update(@RequestBody Activity activity) {
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();
		System.out.println(activity);
		
		activity=activityService.update(activity);
		aJaxResp.setType(AjaxResponseType.SUCCESS);
		aJaxResp.setData(activity);
		return aJaxResp;
	}
	
	
	
	@RequestMapping("/checkuser")
	@ResponseBody
	public boolean checkuser(@RequestParam("id")Long id,@RequestParam("username") String username) {
		SecurityUser user = securityUserService.getByUserName(username);
		Long thisId = user.getUserId();
		Activity activity = activityService.getById(id);
		Long thisaId = activity.getUseraId();
		if(thisId==thisaId)return true;
		else return false;
	}
	
	
	@PostMapping("/uploadActivityPhoto")
	public String upload(@RequestParam("imageFile") MultipartFile imageFile, @RequestParam("activityId") Long activityId)
			throws IOException {
		System.out.println(activityId);
		String returnValue = "redirect:/activity/edit/"+activityId;
		try {
			ActivityService.saveImage(imageFile, activityId);
		} catch (Exception e) {
			e.printStackTrace();
			returnValue = "error";
		}
		return returnValue;
	}
	
	@PostMapping("/follow")
	@ResponseBody
	public Activity follow(@RequestParam("id")Long id,@RequestParam("follow") int follow,@RequestParam("username") String username) {
		
		SecurityUser user = securityUserService.getByUserName(username);
		Activity activity = activityService.getById(id);
		List<SecurityUser> UserFolList = activity.getFollowUser();
		Long followNum = activity.getAwesomeNum();
		if(follow==0) {
			followNum++;
			activity.setAwesomeNum(followNum);
			UserFolList.add(user);
			activity.setFollowUser(UserFolList);
			activityService.update(activity);
		}if(follow==1) {
			followNum--;
			activity.setAwesomeNum(followNum);
			int size = UserFolList.size();
			if(size>0) {
				for(int i =0;i<size;i++) {
					Long userId = UserFolList.get(i).getUserId();
					if(userId==user.getUserId()) {
						UserFolList.remove(UserFolList.get(i));
					}
				}
			}
			
			
			
		}	
		activityService.update(activity);
		return activity;
	}
	
	@RequestMapping("/followedOrNot")
	@ResponseBody
	public Boolean followedOrNot(@RequestParam("id")Long id,@RequestParam("username") String username) {
		SecurityUser user = securityUserService.getByUserName(username);
		Long thisId = user.getUserId();
		Activity activity = activityService.getById(id);
		List<SecurityUser> followUser = activity.getFollowUser();
		int size =followUser.size();
		if(size>0) {
			for(int i =0;i<size;i++) {
				Long userId = followUser.get(i).getUserId();
				if(userId==thisId) {
					return true;
				}
			}
		}else {
			return false;
		}
		return false;
	}
	
	//
	
	
}
