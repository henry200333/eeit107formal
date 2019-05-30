package org.iii.seaotter.jayee.web;


import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/vender")
public class AdminVenderController {
	
	@Autowired
	private VenderService venderService;
	

	@RequestMapping("/list")

	public String listPage(Model model) {	
		model.addAttribute("models", venderService.getAll());
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
