package org.iii.seaotter.jayee.web;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.iii.seaotter.jayee.entity.Notice;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.ForumService;
import org.iii.seaotter.jayee.service.NoticeService;
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
	@Autowired
	private NoticeService noticeservice;

	@RequestMapping("/index")
	public String index() {
		return "index";
	}

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
		res.setData(articleService.getByRefIdAndType(performanceService.getTopByOrderByViewsDesc().getId(),
				ArticleType.Performance));
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
		return forumService.selectByBoardAndRefId(board, refId);
	}

	@GetMapping("/findUserBean/{userAccount}")
	@ResponseBody
	public SecurityUser findUserBean(@PathVariable String userAccount) {
		return securityUserService.findUserBean(userAccount);
	}

	@GetMapping("/artistTop5")
	@ResponseBody
	public List<SecurityUser> getTop5() {
		return securityUserService.getTop5();
	}

	@RequestMapping("/performancetop")
	@ResponseBody
	public List<Performance> performancetop3() {
		return performanceService.getTop3ByOrderByViewsDesc();
	}

	@GetMapping("/performanceview/{id}")
	public String view(@PathVariable Long id, Model model) {
		Performance performance = performanceService.getById(id);
		String url = performance.getUrl();
		String urlShort = url.substring(32);
		Long actId = performance.getActivityId();
		Activity activity = activityService.getById(actId);
		performance.setUrl(urlShort);
		String time = new SimpleDateFormat("yyyy年MM月dd日").format(performance.getUpdateTime());
		model.addAttribute("performance", performance);
		model.addAttribute("time", time);
		String actBeginTime = new SimpleDateFormat("yyyy年MM月dd日").format(activity.getBeginTime());
		String actEndTime = new SimpleDateFormat("yyyy年MM月dd日").format(activity.getBeginTime());
		SecurityUser user = securityUserService.getById(performance.getUserpId());
		model.addAttribute("activity", activity);
		model.addAttribute("begin", actBeginTime);
		model.addAttribute("end", actEndTime);
		model.addAttribute("userinf", user);
		return "/user/performance-view";
	}

	@RequestMapping("/pviewplus/{id}")
	@ResponseBody
	public void viewplus(@PathVariable("id") Long id, Model model) {
		Performance performance = performanceService.getById(id);
		Long views = performance.getViews();
		views++;
		performance.setViews(views);
		performanceService.update(performance, false);
	}

	@RequestMapping("/performanceall")
	@ResponseBody
	public List<Performance> All() {

		return performanceService.getAll();
	}

	@RequestMapping("/performanceSide")
	@ResponseBody
	public List<Performance> getAll() {
		List<Performance> list = performanceService.getAll();
		Collections.shuffle(list);
		return list;
	}

	@RequestMapping("/performances")
	public String performanceList() {
		return "/user/performance-all";
	}

	@RequestMapping("/psearch")
	@ResponseBody
	public GridResponse<Performance> query(@RequestParam(value = "page") Integer page,
			@RequestParam(value = "performanceGerne", defaultValue = "") String performanceGerne,
			@RequestParam(value = "keyword", defaultValue = "") String keyword) {
		System.out.println(keyword);
		String sidx = "updateTime";
		Integer size = 100;
		GridResponse<Performance> grid = new GridResponse<>();
		Sort sort = new Sort(Sort.Direction.DESC, sidx);
		// 固定給他1
		Pageable pageable = PageRequest.of(page - 1, size, sort);

		Specification<Performance> spec = new Specification<Performance>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Performance> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();

				if (!StringUtils.isEmpty(keyword)) {
					where = cb.and(cb.like(root.get("title"), "%" + keyword + "%"));
					where = cb.or(where, cb.like(root.get("username"), "%" + keyword + "%"));
				}

				if (!StringUtils.isEmpty(performanceGerne) && performanceGerne.equals("perf"))
					where = cb.and(where, cb.like(root.get("performanceGerne"), "表演藝術"));
				if (!StringUtils.isEmpty(performanceGerne) && performanceGerne.equals("look"))
					where = cb.and(where, cb.like(root.get("performanceGerne"), "視覺藝術"));
				if (!StringUtils.isEmpty(performanceGerne) && performanceGerne.equals("crea"))
					where = cb.and(where, cb.like(root.get("performanceGerne"), "創意藝術"));
				if (!StringUtils.isEmpty(performanceGerne) && performanceGerne.equals("all"))
					where = cb.and(where, cb.like(root.get("performanceGerne"), "%"));

				return where;
			}
		};
		Page<Performance> result = performanceService.getAll(spec, pageable);
		grid.setRows(result.getContent());
		grid.setPage(page);
		grid.setRecords(result.getTotalElements());
		grid.setTotal(result.getTotalPages());
		return grid;
	}

	@RequestMapping("/refarticle/{id}")
	@ResponseBody
	public List<Article> refarticle(@PathVariable(value = "id") Long id) {
		return articleService.getByRefIdAndType(id, ArticleType.Performance);
	}

	@RequestMapping("/findNotice/{username}")
	@ResponseBody
	public Map<String, Object> findNotice(@PathVariable(value = "username") String username) {
		Map<String, Object> res = new HashMap<>();
		Integer size = 0;
		Long id = securityUserService.getByUserName(username).getUserId();
		List<Notice> notices = noticeservice.getAllByReceiver(id);
		res.put("notices", notices);
		for (int i = 0; i < notices.size(); i++) {
			if (notices.get(i).getReaded()) {
			} else {
				size++;
			}
		}
		res.put("size", size);
		return res;
	}

	@RequestMapping("/readNotice/{username}")
	@ResponseBody
	public Map<String, String> readNotice(@PathVariable(value = "username") String username) {
		Map<String, String> res = new HashMap<>();
		Long id = securityUserService.getByUserName(username).getUserId();
		List<Notice> notices = noticeservice.getAllByReceiver(id);
		for (int i = 0; i < notices.size(); i++) {
			Notice notice = notices.get(i);
			notice.setReaded(true);
			noticeservice.save(notice);
		}
		res.put("success", "success");
		return res;
	}

}
