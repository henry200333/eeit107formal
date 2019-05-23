package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/article")
public class AdminArticleController {

	@RequestMapping("/list")
	public String listPage() {
		return "/WEB-INF/jsp/admin/article-list.jsp";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/WEB-INF/jsp/admin/article-add.jsp";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/WEB-INF/jsp/admin/article-edit.jsp";

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
