package org.iii.seaotter.jayee.web;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
import org.iii.seaotter.jayee.entity.Notice;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.mail.EmailSenderService;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.LocationService;
import org.iii.seaotter.jayee.service.NoticeService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@Autowired
	EmailSenderService emailSenderService;
	
	@Autowired
	NoticeService noticeService;

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
		String sidx="activityStatus";
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
	
	
	@GetMapping("/insert")
	@ResponseBody
	public AjaxResponse<Activity> insert(Activity activity) {
		String userName=SecurityContextHolder.getContext().getAuthentication().getName();
		Long currentUserId =securityUserService.getByUserName(userName).getUserId();
		List<SecurityUser> friendList = securityUserService.getById(currentUserId).getFriends();
		Date date = new java.util.Date();
		for(SecurityUser friend:friendList) {
			Notice notice = new Notice();
			notice.setContent(securityUserService.getById(currentUserId).getDisplayName()+"已新增活動: "+activity.getName()+"，點我觀看");
			notice.setReaded(false);
			notice.setReceiver(friend.getUserId());
			notice.setUrl("/activity/view/"+(activityService.getAll().size()+1));
			notice.setSendtime(date);
			noticeService.save(notice);	
		}
	
		activity.setUseraId(currentUserId);
		activity.setActivityStatus(1L);
		activity.setNoticed(0L);
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();
		activity.setAwesomeNum(0L);
		activity=activityService.insert(activity);
		aJaxResp.setData(activity);
		aJaxResp.setType(AjaxResponseType.SUCCESS);
		return aJaxResp;

	}
	
	
	
	
	@GetMapping("/update")
	@ResponseBody
	public AjaxResponse<Activity> update(Activity activity) {
		AjaxResponse<Activity> aJaxResp=new AjaxResponse<>();
		String userName=SecurityContextHolder.getContext().getAuthentication().getName();
		Long currentUserId =securityUserService.getByUserName(userName).getUserId();
		List<SecurityUser> friendList = securityUserService.getById(currentUserId).getFriends();
		Date date = new java.util.Date();
		for(SecurityUser friend:friendList) {
			Notice notice = new Notice();
			notice.setContent(securityUserService.getById(currentUserId).getDisplayName()+"已編輯活動: "+activity.getName()+"，點我觀看");
			notice.setReaded(false);
			notice.setReceiver(friend.getUserId());
			notice.setUrl("/activity/view/"+activity.getId());
			notice.setSendtime(date);
			noticeService.save(notice);	
		}
		activity.setActivityStatus(activity.getActivityStatus());	
		activity.setNoticed(0L);
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
			throws IOException, InterruptedException {
		System.out.println(activityId);
		String returnValue = "redirect:/activity/edit/"+activityId;
		try {
			ActivityService.saveImage(imageFile, activityId);
		} catch (Exception e) {
			e.printStackTrace();
			returnValue = "error";
		}
		TimeUnit.SECONDS.sleep(1);
		return returnValue;
	}
	
	@PostMapping("/follow")
	@ResponseBody
	public Activity follow(@RequestParam("id")Long id,@RequestParam("follow") int follow,@RequestParam("username") String username) {
		
		SecurityUser user = securityUserService.getByUserName(username);
		Activity activity = activityService.getById(id);
		List<SecurityUser> UserFolList = activity.getFollowUser();
		Long followNum = activity.getAwesomeNum();
		Date date = new java.util.Date();
		if(follow==0) {
			//追蹤活動
			followNum++;
			activity.setAwesomeNum(followNum);
			UserFolList.add(user);
			activity.setFollowUser(UserFolList);
			activityService.update(activity);
			//新增追蹤活動通知
			Notice notice = new Notice();
			notice.setContent("您已追蹤活動: "+activity.getName());
			notice.setReaded(false);
			notice.setReceiver(user.getUserId());
			notice.setUrl("/activity/view/"+id);
			notice.setSendtime(date);
			noticeService.save(notice);	
			
		}if(follow==1) {
			followNum--;
			activity.setAwesomeNum(followNum);
			int size = UserFolList.size();
			if(size>0) {
				for(int i =0;i<size;i++) {
					Long userId = UserFolList.get(i).getUserId();
					if(userId==user.getUserId()) {
						UserFolList.remove(UserFolList.get(i));
						Notice notice = new Notice();
						notice.setContent("您已取消追蹤活動: "+activity.getName());
						notice.setReaded(false);
						notice.setReceiver(user.getUserId());
						notice.setUrl("/activity/view/"+id);
						notice.setSendtime(date);
						noticeService.save(notice);
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
	
	
//	private static final Logger logger =LoggerFactory.getLogger(ScheduledTasks.class);
//	private static final DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("HH:mm:ss");
	@Scheduled(fixedDelay=3000)
	public void activityStatusCheckScheduleWithCron() {
			Date date = new java.util.Date();
			for(Activity a:activityService.getAll()) {
				if(a.getBeginTime().compareTo(date)==-1 & a.getEndTime().compareTo(date)==1) {
					a.setActivityStatus(0L);
				}else if(a.getBeginTime().compareTo(date)==1) {
					a.setActivityStatus(1L);
				}else if(a.getEndTime().compareTo(date)==-1) {
					a.setActivityStatus(2L);
				}
				activityService.update(a);
			}
			
			SimpleMailMessage mailMessage = new SimpleMailMessage();
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
			for(Activity a:activityService.getAll()) {
				if(a.getActivityStatus()==1) {			
//					Date date = new java.util.Date();
					Calendar calendar = Calendar.getInstance(); 
					calendar.setTime(a.getBeginTime());
					calendar.add(Calendar.DAY_OF_MONTH, -1); 
					Date dBefore = calendar.getTime(); //前一天的日期
					for(SecurityUser followUser:a.getFollowUser()) {
					if(date.compareTo(dBefore)==1 && a.getNoticed()==0L) {
						a.setNoticed(1L);
						activityService.update(a);
						mailMessage.setTo(followUser.getMail());
						mailMessage.setSubject("您收藏的活動即將在明日開辦！");
						mailMessage.setFrom("jayee20192019@outlook.com");
						mailMessage.setText(
								"用戶您好，您收藏的活動：「"+a.getName()+"」即將在明日"+sdf.format(a.getBeginTime())+"舉辦，歡迎您來共襄盛舉！");
						emailSenderService.sendMail(mailMessage);
						System.out.println("信件已送出給:"+ followUser.getUsername());
					}
					}
				}
			}
			
			
			
			
			
			
			
//			try {
//				TimeUnit.MINUTES.sleep(5);
//			} catch (InterruptedException e) {
//				e.printStackTrace();
//			}
	
	};
	
//	@Scheduled(cron = "0/5 * * * * ?")
//	public void activityNotice() {
//		SimpleMailMessage mailMessage = new SimpleMailMessage();
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
//		for(Activity a:activityService.getAll()) {
//			if(a.getActivityStatus()==1) {			
//				Date date = new java.util.Date();
//				Calendar calendar = Calendar.getInstance(); 
//				calendar.setTime(a.getBeginTime());
//				calendar.add(Calendar.DAY_OF_MONTH, -1); 
//				Date dBefore = calendar.getTime(); //前一天的日期
//				for(SecurityUser followUser:a.getFollowUser()) {
//				if(date.compareTo(dBefore)==1 && a.getNoticed()==0L) {
//					System.out.println(a.getNoticed()+"Before"+"ID="+a.getId());
//					a.setNoticed(1L);
//					activityService.update(a);
//					System.out.println(a.getNoticed()+"After"+"ID="+a.getId());
////					try {
////						TimeUnit.MINUTES.sleep(50);
////					} catch (InterruptedException e) {
////						e.printStackTrace();
////					}
//					System.out.println(a.getNoticed()+"After");
//					mailMessage.setTo(followUser.getMail());
////					mailMessage.setTo("vaildiablo448@gmail.com");
//					mailMessage.setSubject("您收藏的活動即將在明日開辦！");
//					mailMessage.setFrom("jayee20192019@outlook.com");
//					mailMessage.setText(
//							"用戶您好，您收藏的活動：「"+a.getName()+"」即將在明日"+sdf.format(a.getBeginTime())+"舉辦，歡迎您來共襄盛舉！");
//					emailSenderService.sendMail(mailMessage);
//					System.out.println("信件已送出給:"+ followUser.getUsername());
//				}
//				}
//			}
//		}
////		try {
////			TimeUnit.MINUTES.sleep(50);
////		} catch (InterruptedException e) {
////			e.printStackTrace();
////		}
//	}
	
//	@RequestMapping("/followedOrNot")
//	public Long trackActivityNotice(String reciever, Long activityId) {
//		String account = SecurityContextHolder.getContext().getAuthentication().getName();
//		SecurityUser securityUser=securityUserService.getByUserName(account);
//		Activity activity = activityService.getById(activityId);
//		Notice notice = new Notice();
//		notice.setContent("您已追蹤活動: "+activity.getName());
//		notice.setReaded(false);
//		notice.setReceiver(securityUser.getUserId());
//		notice.setUrl("/activity/view/"+activityId);
//		noticeService.save(notice);
//		return notice.getId();
//	}
	
}
