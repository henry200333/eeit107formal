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
@RequestMapping("/user")
public class IndexController {
	
	@Autowired
	private ArtistService artistService;
	
	@RequestMapping("/index")
	public String index() {
		return "/user/index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "/user/login";
	}
	
	@GetMapping("/artistsTop5")
	@ResponseBody
	public List<Artist> queryTop5() {
		System.out.println("img");
		return artistService.getNameByFanNumberTop5();
	}
	
}
