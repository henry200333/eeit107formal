package org.iii.seaotter.jayee.web;

import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/forum")
public class AdminForumController {

	@Autowired
	private ForumService forumService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("models", forumService.getAll());
		return "/admin/forum-list";
	}
	
	@RequestMapping("/add")
	public String addPage(Model model) {
		return "/admin/forum-add";
	}
	@RequestMapping("/edit")
	public String editPage(Model model) {
		return "/admin/forum-edit";
	}
	
	public String update() {
		return null;
	}
	public String delete() {
		return null;
	}
	public String insert() {
		return null;
	}
	
	
}
