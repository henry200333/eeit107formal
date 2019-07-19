package org.iii.seaotter.jayee.web;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	@PostMapping("like")
	@ResponseBody
	public Performance like(@RequestParam("id")Long id,@RequestParam("dislikeType") int dislikeType,@RequestParam("username") String username) {
		System.out.println(username);
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
			int size = dislikeuser.size();
			for(int i =0;i<size;i++) {
				SecurityUser s = dislikeuser.get(i);
				if(s.getUserId()==user.getUserId()) {
					plikelist.remove(s);
				}
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
		performanceService.update(performance);
		return performance;
	}
	
	@PostMapping("dislike")
	@ResponseBody
	public Performance unlike(@RequestParam("id")Long id,@RequestParam("likeType")int likeType) {
		Performance performance = performanceService.getById(id);
		Long likes = performance.getLikes();
		Long dislikes = performance.getDislikes();		
		if(likeType==0) {
			dislikes++;
			performance.setDislikes(dislikes);
		}
		else if(likeType==1) {
			dislikes++;
			likes--;
			performance.setDislikes(dislikes);
			performance.setLikes(likes);
		}else if(likeType==2) {
			dislikes--;
			performance.setDislikes(dislikes);
		}
		performanceService.update(performance);
		return performance;
	}
	
}
