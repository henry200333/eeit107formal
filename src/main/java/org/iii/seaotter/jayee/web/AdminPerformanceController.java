package org.iii.seaotter.jayee.web;

import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/performance")
public class AdminPerformanceController {
	
	@Autowired
	private PerformanceService performanceSurvice;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("performances",performanceSurvice.getAll() );
		return "/admin/performance-list";

	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		model.addAttribute("performance", new Performance());
		return "/admin/performance-add";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/performance-edit";

	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute("performance") Performance performance,Model model) {
		performanceSurvice.insert(performance);
		
		return "redirect:/admin/performance/list";

	}
	@RequestMapping("/update")
	public String update() {
		return  "/admin/performance-update";

	}

	public String delete() {
		return null;

	}
}
