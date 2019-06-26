package org.iii.seaotter.jayee.web;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/performance")
public class AdminPerformanceController {

	@Autowired
	private PerformanceService performanceSurvice;

	@Autowired
	private ActivityService activityService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("performances", performanceSurvice.getAll());
		return "/admin/performance-list";

	}
	
	@RequestMapping("/test")
	public String test() {
		return "/admin/test";

	}

	@GetMapping("/query")
	@ResponseBody // 轉成JSON
	public List<Performance> query() {
		return performanceSurvice.getAll();
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		System.out.println("add");
		return "/admin/performance-add";

	}

	@RequestMapping("/aid")
	@ResponseBody
	public List<Activity> addAid() {
		System.out.println("aid");
		return activityService.getAll();

	}
	//測試JPA id>=2
	@RequestMapping("/test2")
	@ResponseBody
	public List<Performance> test2() {
		
		return performanceSurvice.test(2L);

	}


	@RequestMapping("/index")
	public String index() {		
		return "/admin/index";
	}
	
	@RequestMapping("/search")
	@ResponseBody
	public List<Performance> search(@RequestParam String search){
		List<Performance> getdata = performanceSurvice.getAll();
		if(search==null || search.trim().length()==0) {
			return getdata;
		}
		
		List<Performance> searchResult = new ArrayList<>();
		for(int i=0;i<getdata.size();i++) {
			boolean flag = false;
			Performance data = getdata.get(i);
			if(data.getActivityId().toString().contains(search))
				flag=true;
			if(data.getTitle().contains(search))
				flag=true;
			if(data.getUrl().contains(search))
				flag=true;
			if(data.getUpdateTime().toString().contains(search))
				flag=true;
			if(data.getActivityId().toString().contains(search))
				flag=true;
			if(data.getViews().toString().contains(search))
				flag=true;
			if(flag)
				searchResult.add(data);
		}
		System.out.println(searchResult);
		return searchResult;
	}

//	@RequestMapping("/index")
//	public String index() {
//		
//		return "/admin/index";
//
//	}

	
	//增加點閱率
	@RequestMapping("/viewplus")
	@ResponseBody
	public Performance viewplus(@ModelAttribute("performance") Performance performance, Model model) {
		System.out.println("viewplus");
		performance = performanceSurvice.getById(performance.getId());
		System.out.println(performance);
		Long views = performance.getViews();
		views ++;
		performance.setViews(views);
		System.out.println(performance);
		performanceSurvice.update(performance);
		return performance;

	}
	
	@RequestMapping("/edit")
	public String editPage(@ModelAttribute("performance") Performance performance, Model model) {
		System.out.println("edit");
		System.out.println(performance);
		performance = performanceSurvice.getById(performance.getId());
		model.addAttribute("performance", performance);
		return "/admin/performance-edit";

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
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(performanceSurvice.insert(performance));
		return result;

	}

	@PutMapping("/update")
	@ResponseBody
	public AjaxResponse<Performance> update(@RequestBody Performance performance, Model model) {
		System.out.println("update");
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
			messages.add(new Message("title", "TITLE欄位不能為空"));
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

		result.setType(AjaxResponseType.SUCCESS);
		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}		
		boolean updateResult  =performanceSurvice.update(performance);
		if(updateResult) {
			result.setType(AjaxResponseType.SUCCESS);
			result.setData(performanceSurvice.getById(performance.getId()));
		}else {
			result.setType(AjaxResponseType.ERROR);
		}
			return result;

	}


	@PostMapping("delete")
	public String delete(@RequestParam("id") String idget) {
		Long id = Long.parseLong(idget);
		Performance performance = new Performance();
		performance.setId(id);
		performanceSurvice.delete(performance);
		return "redirect:/admin/performance/list";

	}
}
