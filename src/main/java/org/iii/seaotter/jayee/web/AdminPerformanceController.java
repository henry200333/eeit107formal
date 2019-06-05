package org.iii.seaotter.jayee.web;

import javax.validation.Valid;

import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String editPage(@RequestParam("id") String idget,Model model) {
		Long id =Long.parseLong(idget);
		Performance performance = performanceSurvice.getById(id);
		Performance performanceUpdate = new Performance();
		model.addAttribute("performance", performanceUpdate);
		model.addAttribute("performanceEdit", performance);
		return "/admin/performance-edit";

	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute("performance") Performance performance,Model model) {
		performanceSurvice.insert(performance);
		
		return "redirect:/admin/performance/list";

	}
	@PostMapping("/update")
	public String update(@ModelAttribute("performance") Performance performance,  Model model) {
		boolean re = performanceSurvice.update(performance);
		System.out.println("re");
		return "redirect:/admin/performance/list";

	}
	@PostMapping("delete")
	public String delete(@RequestParam("id") String idget) {
		Long id =Long.parseLong(idget);
		Performance performance = new Performance();
		performance.setId(id);
		performanceSurvice.delete(performance);
		return "redirect:/admin/performance/list";

	}
}
