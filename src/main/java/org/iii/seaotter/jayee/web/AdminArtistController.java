package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/admin/artist")
public class AdminArtistController {

	@Autowired
	private ArtistService artistService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		return "/admin/artist-list";
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		return "/admin/artist-add";
	}

	@RequestMapping("/edit")
	public String editPage(@ModelAttribute("artist") Artist artist, Model model) {
		artist = artistService.getById(artist.getId());
		model.addAttribute("artistParam", artist);
		return "/admin/artist-edit";
	}

	@GetMapping("/query")
	@ResponseBody
	public List<Artist> query() {
		return artistService.getAll();
	}

	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Artist> insert(@Valid @RequestBody Artist artist, BindingResult result) {
		System.out.println(artist);
		AjaxResponse<Artist> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		} else {
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(artistService.insert(artist));
			return ajaxRes;
		}
	}

	@PutMapping("/update")
	@ResponseBody
	public AjaxResponse<Artist> update(@Valid @RequestBody Artist artist, BindingResult result) {
		AjaxResponse<Artist> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		} else {
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(artistService.update(artist));
			return ajaxRes;
		}
	}

	@DeleteMapping("/delete")
	@ResponseBody
	public AjaxResponse<Artist> delete(@RequestBody Artist artist) {
		System.out.println(artist);
		AjaxResponse<Artist> ajaxRes = new AjaxResponse<>();
		artist = artistService.getById(artist.getId());
		if (null != artist) {
			artistService.delete(artist);
			ajaxRes.setType(AjaxResponseType.SUCCESS);
			ajaxRes.setData(artist);
		} else {
			ajaxRes.setType(AjaxResponseType.ERROR);
		}
		return ajaxRes;
	}

	@PostMapping("/uploadImage")
	public String upload(@RequestParam("imageFile") MultipartFile imageFile) {
		String returnValue = "/admin/artist-list";
		try {
			ArtistService.saveImage(imageFile);
		} catch (Exception e) {
			e.printStackTrace();
			returnValue = "error";
		}
		return returnValue;
	}
}
