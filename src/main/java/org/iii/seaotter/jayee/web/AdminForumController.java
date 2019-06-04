package org.iii.seaotter.jayee.web;

import java.sql.Timestamp;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/forum")
public class AdminForumController {
	@Autowired
	private ForumService forumService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("models", forumService.getAll());
		model.addAttribute("forum", new Forum());
		return "/admin/forum-list";
	}
	@RequestMapping("/add")
	public String addPage(Model model) {
		model.addAttribute("forum",new Forum());
		return "/admin/forum-add";
	}
	@RequestMapping("/edit")
	public String editPage(@ModelAttribute("forum") Forum forum,Model model) {
		forum = forumService.getById(forum.getId());
		model.addAttribute("forumParam", forum);
		return "/admin/forum-edit";
	}
	@PostMapping("/insert")
	public String insert(@ModelAttribute("forum") Forum forum, Model model) {
		forum.setCommentDate(new Timestamp(new java.util.Date().getTime()));
		forumService.create(forum);
		return "redirect:/admin/forum/list";
	}
	@PostMapping("/update")
	public String update(@ModelAttribute("forum") Forum forum, Model model) {
		forum.setCommentDate(forumService.getById(forum.getId()).getCommentDate());
		forumService.update(forum);
		return "redirect:/admin/forum/list";
	}
	@PostMapping("/delete")
	public String delete(@ModelAttribute("forum") Forum forum, Model model) {
		forumService.delete(forum);
		return "redirect:/admin/forum/list";
	}
}
