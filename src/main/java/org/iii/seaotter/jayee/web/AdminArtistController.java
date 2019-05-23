package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {

	@RequestMapping("/list")
	public String listPage() {
		return "/admin/artist-list";

	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/artist-add";

	}

	@RequestMapping("/edit")
	public String editPage() {
		return "/admin/artist-edit";

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
