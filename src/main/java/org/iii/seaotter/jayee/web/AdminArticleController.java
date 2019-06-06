package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.validation.Valid;

import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("articleList", articleService.getAll());
		model.addAttribute("article", new Article());
		return "/admin/article-list";

	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		model.addAttribute("article", new Article());
		return "/admin/article-add";
	}

	@RequestMapping("/edit")
	public String editPage(@ModelAttribute("article") Article article, Model model) {
		article = articleService.getById(article.getId());
		model.addAttribute("articleParam", article);
		return "/admin/article-edit";
	}
	
	@RequestMapping("/query")
	@ResponseBody  //轉成JSON
	public List<Article> query(String name){
		return articleService.getAll();
	}

	@PostMapping("/insert")
	public String insert(@Valid@ModelAttribute("article") Article article, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("articleParam", article);
			return "/admin/article-add";
		}
		articleService.insert(article);
		return "redirect:/admin/article/list";
	}
	
	@PostMapping("/update")
	public String update(@Valid@ModelAttribute("article") Article article, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("articleParam", article);
			return "/admin/article-edit";
		}
		articleService.update(article);
		return "redirect:/admin/article/list";

	}
	
	@PostMapping("/delete")
	public String delete(@ModelAttribute("article") Article article) {
		articleService.delete(article);
		return "redirect:/admin/article/list";
	}

}
