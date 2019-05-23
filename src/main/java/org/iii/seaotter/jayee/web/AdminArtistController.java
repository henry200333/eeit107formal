package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {

	@RequestMapping("/list")
	public String listPage() {
		return "/WEB-INF/jsp/admin/artist-list.jsp";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/WEB-INF/jsp/admin/artist-add.jsp";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/WEB-INF/jsp/admin/artist-edit.jsp";

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
