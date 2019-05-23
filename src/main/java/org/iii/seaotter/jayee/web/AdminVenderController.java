package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/vender")
public class AdminVenderController {
	@RequestMapping("/list")
	public String listPage() {
		return "/admin/vender-list";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/vender-add";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/vender-edit";

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
