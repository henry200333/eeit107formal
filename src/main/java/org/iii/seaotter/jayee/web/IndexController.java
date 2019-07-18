package org.iii.seaotter.jayee.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.List;
 
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.ForumBoard;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.ForumService;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class IndexController {
	

	@Autowired
	private ArticleService articleService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ForumService forumService;
	@Autowired
	private PerformanceService performanceService;
	@Autowired
	private SecurityUserService securityUserService;
	
	
//	@RequestMapping("/index")
//	public String index() {
//		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//	
//		Collection<? extends GrantedAuthority> roles = ((UserDetails)principal).getAuthorities();
//		
//		for (GrantedAuthority grantedAuthority : roles) {
//			if(grantedAuthority.getAuthority().equals("ROLE_ADMIN")) {
//				return "redirect:/admin/artist/list";
//			}	
//		}
//		return "/user/index";
//	}
	
	@RequestMapping("/article")
	public String articleListPage() {
		return "/user/article-list";
	}
	
	@GetMapping("/article/query")
	@ResponseBody
	public GridResponse<Article> query(@RequestParam(value="name", defaultValue="") String name, 
			@RequestParam(value="type", defaultValue="") ArticleType articleType,
			@RequestParam(value="page") Integer page, 
			@RequestParam(value="rows") Integer size,
			@RequestParam(value="sidx") String sidx,
			@RequestParam(value="sord") String sord) {
		Sort sort=new Sort(Sort.Direction.ASC,sidx);
		if("desc".equalsIgnoreCase(sord)){
			sort=new Sort(Sort.Direction.DESC,sidx);
		}
		Pageable pageable = PageRequest.of(page-1, size, sort);
		GridResponse<Article> gridResponse = new GridResponse<>();
		Specification<Article> specification = new Specification<Article>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Article> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				if (!StringUtils.isEmpty(name)) {
					where = cb.and(cb.like(root.get("name"), "%" + name + "%"));
				}
				if (!StringUtils.isEmpty(articleType)) {
					where = cb.and(cb.equal(root.get("type"), articleType));
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
	
		
//	@GetMapping("/artistsTop5") 
//	@ResponseBody
//	public List<Artist> queryTop5() {
//		return artistService.getNameByFanNumberTop5();
//	}
	

	
	@GetMapping("/articleWithPerformanceTop")
	@ResponseBody
	public AjaxResponse<List<Article>> articleTop() {
		AjaxResponse<List<Article>> res = new AjaxResponse<>();
		res.setType(AjaxResponseType.SUCCESS);
		res.setData(articleService.getByRefIdAndType(performanceService.getTopByOrderByViewsDesc().getId(), ArticleType.Performance));
		return res;
	}
	
	@GetMapping("/articleTop6")
	@ResponseBody
	public AjaxResponse<List<Article>> articleTop6() {
		AjaxResponse<List<Article>> res = new AjaxResponse<>();
		res.setType(AjaxResponseType.SUCCESS);
		res.setData(articleService.getTop6ByCount());
		return res;
	}
	
	@GetMapping("/activityTop3")
	@ResponseBody
	public List<Activity> activityTop3() {
		return activityService.getTop3NameByAwesomeNum();
	}
	
	@GetMapping("/fitComments/{board}/{refId}")
	public List<Forum> fitComment(@PathVariable ForumBoard board, @PathVariable Long refId) {
		return forumService.selectByBoardAndRefId(board,refId);
	}
	
	@GetMapping("/findUserBean/{userAccount}")
	@ResponseBody
	public SecurityUser findUserBean(@PathVariable String userAccount) {
		return securityUserService.findUserBean(userAccount);
	}
	
	@GetMapping("/artistTop5")
	@ResponseBody
	public List<SecurityUser> getTop5(){
		return securityUserService.getTop5();
	}
	
	@RequestMapping("/performancetop")
	@ResponseBody
	public List<Performance> performancetop3() {
		return performanceService.getTop3ByOrderByViewsDesc();
	}
	
	@GetMapping("/performanceview/{id}")
	public String view(@PathVariable Long id,Model model) {
		Performance performance = performanceService.getById(id);
		String url = performance.getUrl();
		String urlShort = url.substring(32);
		Long actId = performance.getActivityId();
		Activity activity = activityService.getById(actId);
		String actName = activity.getName();
		performance.setUrl(urlShort);
		String time = new SimpleDateFormat("yyyy年MM月dd日").format(performance.getUpdateTime());
		model.addAttribute("performance",performance);
		model.addAttribute("time",time);
		String actBeginTime = new SimpleDateFormat("yyyy年MM月dd日").format(activity.getBeginTime());
		String actEndTime = new SimpleDateFormat("yyyy年MM月dd日").format(activity.getBeginTime());
		model.addAttribute("activity",activity);
		model.addAttribute("begin",actBeginTime);
		model.addAttribute("end",actEndTime);		
		return "/user/performance-view";
	}
	
	@RequestMapping("/pviewplus/{id}")
	@ResponseBody
	public void viewplus(@PathVariable("id") Long id, Model model) {
		System.out.println(id);
		Performance performance = performanceService.getById(id);
		Long views = performance.getViews();
		views ++;
		performance.setViews(views);
		performanceService.update(performance);
		}
	
	@RequestMapping("/performanceSide")
	@ResponseBody
	public List<Performance> getAll(){
		System.out.println("all");
		List<Performance> list = performanceService.getAll();
		Collections.shuffle(list);
		return list;
	}
	
}
