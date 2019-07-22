package org.iii.seaotter.jayee.web;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ActivityService;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/performance")
public class PerformanceController {

	@Autowired
	private PerformanceService performanceService;
	
	@Autowired
	private SecurityUserService SecurityUserService;
	
	@Autowired
	private ActivityService activityService;
	
	
	@RequestMapping("/add")
	public String add() {
		return "/user/user-performance-add";
	}
	

	
	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Performance> insert(@RequestBody Performance performance, Model model) {
		System.out.println("insert");
		// 測試是否傳到後台
		System.out.println(performance);

		// 回傳型態AjaxResponse與內部的宣告
		AjaxResponse<Performance> result = new AjaxResponse<>();
		List<Message> messages = new ArrayList<>();

		String title = performance.getTitle();
		String url = performance.getUrl();
		String introduction = performance.getIntroduction();

		// title
		if (title == null || title.trim().length() == 0) {
			messages.add(new Message("title", "title欄位不能為空"));
		}
		
		// introduction
				if (introduction == null || introduction.trim().length() == 0) {
					performance.setIntroduction("沒有簡介");
				}

		// url
		if (url == null || url.trim().length() == 0) {
			messages.add(new Message("url", "URL欄位不能為空"));
		} else {
			try {
				URL checkUrl = new URL(url);
				checkUrl.openStream();
			} catch (Exception e) {
				e.printStackTrace();
				messages.add(new Message("url", "無效的網址"));
			}
		}

		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}
		performance.setViews(0L);
		performance.setLikes(0L);
		performance.setDislikes(0L);
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(performanceService.insert(performance));
		return result;

	}
	
//	@GetMapping("/{id}")
//	@ResponseBody
//	public String view(@PathVariable Long id,Model model) {
//		Performance performance = performanceService.getById(id);
//		model.addAttribute("performance",performance);
//		return "/user/performance-view";
//	}
	
	@PostMapping("/like")
	@ResponseBody
	public Performance like(@RequestParam("id")Long id,@RequestParam("dislikeType") int dislikeType,@RequestParam("username") String username) {
		
		SecurityUser user = SecurityUserService.getByUserName(username);
		List<Performance> plikelist = user.getPlikes();
		Performance performance = performanceService.getById(id);
		Long likes = performance.getLikes();
		Long dislikes = performance.getDislikes();
		if(dislikeType==0) {
			likes++;
			performance.setLikes(likes);
			plikelist.add(performance);
			user.setPlikes(plikelist);
			SecurityUserService.update(user);
		}
		else if(dislikeType==1) {
			likes++;
			dislikes--;
			performance.setLikes(likes);
			performance.setDislikes(dislikes);
			plikelist.add(performance);
			user.setPlikes(plikelist);
			SecurityUserService.update(user);
			List<SecurityUser> dislikeuser = performance.getDislikeuser();
			for(int i =0;i<dislikeuser.size();i++) {
				SecurityUser s = dislikeuser.get(i);
				if(s.getUserId()==user.getUserId()) {
					dislikeuser.remove(s);
					i--;
				}
				performance.setDislikeuser(dislikeuser);
				performanceService.update(performance,false);
				
			}
		}else if(dislikeType==2) {
			likes--;
			performance.setLikes(likes);
			int size = plikelist.size();
			for(int i =0;i<size;i++) {
				Performance p = plikelist.get(i);
				if(p.getId()==id) {
					plikelist.remove(p);
				}
			}
		}
		performanceService.update(performance,false);
		return performance;
	}
	
	@PostMapping("/dislike")
	@ResponseBody
	public Performance unlike(@RequestParam("id")Long id,@RequestParam("likeType")int likeType,@RequestParam("username") String username) {
		SecurityUser user = SecurityUserService.getByUserName(username);
		Performance performance = performanceService.getById(id);
		Long likes = performance.getLikes();
		Long dislikes = performance.getDislikes();
		List<SecurityUser> userpdislike = performance.getDislikeuser();
		if(likeType==0) {
			dislikes++;
			performance.setDislikes(dislikes);
			userpdislike = performance.getDislikeuser();
			userpdislike.add(user);
			performance.setDislikeuser(userpdislike);
		}
		else if(likeType==1) {
			dislikes++;
			likes--;
			performance.setDislikes(dislikes);
			performance.setLikes(likes);
			userpdislike.add(user);
			performance.setDislikeuser(userpdislike);
			performanceService.update(performance,false);
			List<Performance> plikelist = user.getPlikes();
			for(int i=0;i<plikelist.size();i++) {
				Performance p = plikelist.get(i);
				if(p.getId()==id) {
					plikelist.remove(p);
					i--;
				}
				
				user.setPlikes(plikelist);
				SecurityUserService.update(user);
			}
		}else if(likeType==2) {
			dislikes--;
			performance.setDislikes(dislikes);
			for(int i =0;i<userpdislike.size();i++) {
				SecurityUser s = userpdislike.get(i);
				if(s.getUserId()==user.getUserId()) {
					userpdislike.remove(s);
					i--;
				}
				performance.setDislikeuser(userpdislike);
				performanceService.update(performance,false);
		}
		
	}
		performanceService.update(performance,false);
		return performance;
	}
	
	@RequestMapping("/likeordislike")
	@ResponseBody
	public Integer likeordislike(@RequestParam("id")Long id,@RequestParam("username") String username) {
		SecurityUser user = SecurityUserService.getByUserName(username);
		Long thisId = user.getUserId();
		Performance performance = performanceService.getById(id);
		
		List<Performance> thisUserLikep = user.getPlikes();
		List<SecurityUser> thisPdislikeUser = performance.getDislikeuser();
		for(int i =0;i<thisUserLikep.size();i++) {
			Performance p = thisUserLikep.get(i);
			Long pid = p.getId();
			if(pid==id) {
				return 1 ;
			}
		}
		
		for(int i = 0;i<thisPdislikeUser.size();i++) {
			SecurityUser  s= thisPdislikeUser.get(i);
			Long userid = s.getUserId();
			if(userid==thisId) {
				return 2 ;
			}
			
		}
		return 0;
		
	}
	
//	@RequestMapping("/addfriend")
//	public void addfriend(@RequestParam("id")Long id,@RequestParam("username") String username) {
//		System.out.println("addfriend");
//		SecurityUser thisuser = SecurityUserService.getByUserName(username);
//		Performance performance = performanceService.getById(id);
//		SecurityUser adduser = SecurityUserService.getById(performance.getUserpId());
//
//		SecurityUserService.addfirend(thisuser, adduser);
//	}
	
	
	@RequestMapping("/checkuser")
	@ResponseBody
	public boolean checkuser(@RequestParam("id")Long id,@RequestParam("username") String username) {
		SecurityUser user = SecurityUserService.getByUserName(username);
		Long thisId = user.getUserId();
		Performance performance = performanceService.getById(id);
		Long thispId = performance.getUserpId();
		if(thisId==thispId)return true;
		else return false;
	}
	
	@RequestMapping("/edit/{id}")
	public String editp(@PathVariable(value="id") Long id,Model model) {
		Performance performance = performanceService.getById(id);
		model.addAttribute("editp",performance);
		String url = performance.getUrl().substring(32);
		model.addAttribute("url",url);
		return "/user/performance-edit";
	}
	
	@RequestMapping("/activity")
	@ResponseBody
	public List<Activity> addAid(@RequestParam("username") String username) {
		SecurityUser user = SecurityUserService.getByUserName(username);
		return activityService.getByArtistId(user.getUserId());

	}
	
	@RequestMapping("/select")
	public String select() {
		return "/user/performance-select";

	}
	
	@RequestMapping("/edit")
	@ResponseBody
	public boolean editP(@RequestParam("id")Long id,@RequestParam("title") String titlenew,@RequestParam("introduction") String introductionnew) {
		Performance performance = performanceService.getById(id);
		performance.setTitle(titlenew);
		performance.setIntroduction(introductionnew);		
		return performanceService.update(performance, false);

	}

}
