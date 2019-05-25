package org.iii.seaotter.jayee.web;

import org.iii.seaotter.jayee.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {
	
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("models", articleService.getAll());
		return "/admin/article-list";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/article-add";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/article-edit";

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
