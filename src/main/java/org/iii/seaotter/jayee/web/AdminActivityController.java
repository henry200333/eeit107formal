package org.iii.seaotter.jayee.web;

import javax.servlet.http.HttpServletRequest;

import org.iii.seaotter.jayee.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/activity")
public class AdminActivityController {
	
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("models",activityService.getAll());
		return "/admin/activity-list";
		
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/activity-add";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/activity-edit";

	}

	public String insert(HttpServletRequest request) {
		return null;

	}

	public String update() {
		return null;

	}

	public String delete() {
		return null;

	}
}
