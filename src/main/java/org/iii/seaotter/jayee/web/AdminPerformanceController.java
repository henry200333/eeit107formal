package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/performance")
public class AdminPerformanceController {
	
	@RequestMapping("/list")
	public String listPage() {
		return "/admin/performance-list";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/performance-add";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/performance-edit";

	}

	public String insert() {
		return null;

	}

	public String update() {
		return null;

	}

	public String delete() {
		return null;

	}
}
