package org.iii.seaotter.jayee.web;

import java.util.List;

import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		List<Article> list = articleService.getAll();
		model.addAttribute("articleList", list);
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

	@PostMapping("/insert")
	public String insert(Article article) {
		articleService.insert(article);
		return "redirect:/admin/article/list";
	}

	public String update() {
		return null;

	}

	public String delete() {
		return null;

	}

}
