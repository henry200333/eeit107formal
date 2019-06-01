package org.iii.seaotter.jayee.web;

import javax.servlet.http.HttpServletRequest;

import org.iii.seaotter.jayee.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {
	
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("artistlist",artistService.getAll());
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

	public String insert(HttpServletRequest request) {
		return null;

	}

	public String update() {
		return null;

	}

	public String delete() {
		return null;

	}
}
