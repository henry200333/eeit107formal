package org.iii.seaotter.jayee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String editPage(@ModelAttribute("activity") Activity activity, Model model) {
		activity = activityService.getById(activity.getId());
		model.addAttribute("activityParam", activity);
		
		return "/admin/activity-edit";

	}
	
	@PostMapping("/insert")
	@ResponseBody
	public Activity insert(@RequestBody Activity activity, Model model) {
		System.out.println(activity);
//		Map<String, String> errorMsg = new HashMap<>();
//		
//		if(activity.getName()==null || activity.getName().trim()=="") {
//			System.out.println("name為空");
//			errorMsg.put("name","請輸入活動名稱");
//		}
//		if(activity.getArtist()==null || activity.getArtist().trim()=="") {
//			errorMsg.put("artist","請輸入表演者");
//		}
//		if(activity.getDescription()==null || activity.getDescription().trim()=="") {
//			errorMsg.put("description","請輸入活動描述");
//		}
//		if(activity.getBeginTime()==null) {
//			errorMsg.put("bt","日期格式錯誤");
//		}
//		if(activity.getEndTime()==null) {
//			errorMsg.put("et","日期格式錯誤");
//		}
//		
//		if(!errorMsg.isEmpty()) {
//			model.addAttribute("errorMsg", errorMsg);
//			System.out.println("錯誤訊息不為空");
//			return activity;
//		}
//		activityService.insert(activity);
//		errorMsg.put("noError","無錯誤");
//		System.out.println("新增成功");
		return activityService.insert(activity);

	}
	@PostMapping("/update")
	@ResponseBody
	public Activity update(@RequestBody Activity activity, Model model) {
		System.out.println(activity);
		Map<String, String> errorMsg = new HashMap<>();
				
		return activityService.update(activity);
		

	}
	@PostMapping("/delete")
	public String delete(@ModelAttribute("activity") Activity activity) {
		activityService.delete(activity);
		return "redirect:/admin/activity/list";

	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Activity> query(){	
		return activityService.getAll();
	}
	
	
	
	
}
