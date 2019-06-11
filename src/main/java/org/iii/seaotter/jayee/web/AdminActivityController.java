package org.iii.seaotter.jayee.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
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
//		Date date=activity.getBeginTime();
//		String bGdateToStr = date.toString();
//		String beginTime=bGdateToStr.substring(0, 10)+"T"+bGdateToStr.substring(11, 16);
//		String endTime=bGdateToStr.substring(0, 10)+"T"+bGdateToStr.substring(11, 16);
		model.addAttribute("activityParam", activity);
		
		return "/admin/activity-edit";

	}
	
	@PostMapping("/insert")
	public String insert(@Valid@ModelAttribute("activity") Activity activity, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("activityParam", activity);
			return "/admin/activity-add";
		}
		activityService.insert(activity);
		return "redirect:/admin/activity/list";

	}
	@PostMapping("/update")
	public String update(@Valid@ModelAttribute("activity") Activity activity, BindingResult bindingResult, Model model) {
		System.out.println(activity);
		if (bindingResult.hasErrors()) {
			model.addAttribute("activityParam", activity);
			return "/admin/activity-edit";
		}
		activityService.update(activity);
		return "redirect:/admin/activity/list";

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
