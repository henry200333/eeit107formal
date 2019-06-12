package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.validation.Valid;

import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {

	@Autowired
	private ArtistService artistService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("artistlist", artistService.getAll());
		model.addAttribute("artist", new Artist());
		return "/admin/artist-list";
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		model.addAttribute("artist", new Artist());
		return "/admin/artist-add";
	}

	@RequestMapping("/edit")
	public String editPage(@ModelAttribute("artist") Artist artist, Model model) {
		artist = artistService.getById(artist.getId());
		model.addAttribute("artistParam", artist);
		return "/admin/artist-edit";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Artist> query() {
		return artistService.getAll();
	}

	@PostMapping("/insert")
	public String insert(@Valid @RequestBody List<Artist> list, Model model) {
		System.out.println(list.get(0));
		artistService.insert(list.get(0));
		return "redirect:/admin/artist/list";
	}

	@PostMapping("/update")
	public String update(@Valid @ModelAttribute("artist") Artist artist, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("artistParam", artist);
			return "/admin/artist-edit";
		}
		artistService.update(artist);
		return "redirect:/admin/artist/list";
	}

	@PostMapping("/delete")
	public String delete(@ModelAttribute("artist") Artist artist) {
		artistService.delete(artist);
		return "redirect:/admin/artist/list";
	}
}
