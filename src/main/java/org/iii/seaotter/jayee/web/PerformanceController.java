package org.iii.seaotter.jayee.web;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/performance")
public class PerformanceController {

	@Autowired
	private PerformanceService performanceService;
	
	
	@RequestMapping("/add")
	public String add() {
		return "/user/user-performance-add";
	}
	
	@GetMapping("/top")
	@ResponseBody
	public AjaxResponse<Performance> performanceTop() {
//		UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext()
//			    .getAuthentication()
//			    .getPrincipal();
//		String user = userDetails.getUsername();
//		String password = userDetails.getPassword();
//		System.out.println(user+"---------------------");
//		System.out.println(password+"---------------------");
//		UserDetails d = securityUserService.loadUserByUsername(user);
//		System.out.println(d+"---------------------");
		AjaxResponse<Performance> res = new AjaxResponse<>();
		res.setType(AjaxResponseType.SUCCESS);
		res.setData(performanceService.getTopByOrderByViewsDesc());
		return res;
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
		performance.setUnlikes(0L);
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(performanceService.insert(performance));
		return result;

	}
	
	@RequestMapping("/userinf")
	@ResponseBody
	public Object getCurrenyUser() {
		return SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	@RequestMapping("/indextest")
	public String indextest() {
		return "/user/indextest";
	}
}
