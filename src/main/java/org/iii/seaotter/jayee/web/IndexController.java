package org.iii.seaotter.jayee.web;

import java.util.List;

import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.service.ArtistService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
public class IndexController {
	
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping("/index")
	public String index() {
		return "/admin/index";
	}
	
	@GetMapping("/artistsTop5")
	@ResponseBody
	public List<Artist> queryTop5() {
		return artistService.getNameByFanNumberTop5();
	}
	
}
