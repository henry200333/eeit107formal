package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {

	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")
	public String listPage() {
		return "/admin/article-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/article-add";
	}

	@RequestMapping("/edit")
	public String editPage(Article article, Model model) {
		article = articleService.getById(article.getId());
		model.addAttribute("articleParam", article);
		return "/admin/article-edit";
	}

	@GetMapping("/query")
	@ResponseBody // 轉成JSON
	public List<Article> query(@RequestParam(name="search", defaultValue="77777") String name) {
		System.out.println(name);
		if ("77777".equals(name)) {
			return articleService.getAll();
		}
		return articleService.getByNameContainingOrContentContaining(name, name);
	}

	@PostMapping("/add")
	@ResponseBody
	public AjaxResponse<Article> insert(@Valid @RequestBody Article article, BindingResult result) {
		System.out.println(article);
		AjaxResponse<Article> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		}
		ajaxRes.setType(AjaxResponseType.SUCCESS);
		ajaxRes.setData(articleService.insert(article));
		return ajaxRes;
	}

	@PutMapping("/edit")
	@ResponseBody
	public AjaxResponse<Article> update(@Valid @RequestBody Article article, BindingResult result) {
		System.out.println(article);
		AjaxResponse<Article> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		}
		ajaxRes.setType(AjaxResponseType.SUCCESS);
		ajaxRes.setData(articleService.update(article));
		return ajaxRes;

	}

	@DeleteMapping("/delete")
	@ResponseBody
	public AjaxResponse<Article> delete(@RequestBody Article article) {
		System.out.println(article);
		AjaxResponse<Article> ajaxRes = new AjaxResponse<>();
		article = articleService.getById(article.getId());
		if (article != null) {
			articleService.delete(article);
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(article);
		} else {
			ajaxRes.setType(AjaxResponseType.ERROR);
		}
		return ajaxRes;
	}

}
