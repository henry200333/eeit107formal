package org.iii.seaotter.jayee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {

	@Autowired
	private ArtistService artistService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("artistlist", artistService.getAll());
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
		List<Artist> list = artistService.getAll();
		return list;
	}

	@PostMapping("/insert")
	@ResponseBody
	public Artist insert(@RequestBody Artist artist, Model model) {
		Map<String, String> result = new HashMap<>();
		String name = artist.getName();
		String location = artist.getLocation();
		if (name == null || name.trim().length() == 0) {
			result.put("name", "姓名請勿空白");
		}
		if (location == null || location.trim().length() == 0) {
			result.put("location", "地點請勿空白");
		}
		if (!result.isEmpty()) {
			return null;
		}
		artistService.insert(artist);
		result.put("success", "success");
		return artistService.insert(artist);
	}

	@PutMapping("/update")
	public String update(@Valid @ModelAttribute("artist") Artist artist, BindingResult bindingResult, Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("artistParam", artist);
			return "/admin/artist-edit";
		}
		artistService.update(artist);
		return "redirect:/admin/artist/list";
	}

	@DeleteMapping("/delete")
	public String delete(@RequestParam("id") String id) {
		Long Id = Long.parseLong(id);
		Artist artist = new Artist();
		artist.setId(Id);
		artistService.delete(artist);
		return "redirect:/admin/artist/list";
	}
}
