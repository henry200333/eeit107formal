package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.service.ArticleService;
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
	@Autowired
	private ArticleService articleService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		
		String username  = request.getParameter("username");
		if(username.equals("SeaOtter"))
			return "redirect:/admin/artist/list";
		
		else
		return "/user/user-index";
	}
	
	@RequestMapping("/login")
	public String login() {
		return "/user/user-login";
	}
	
	@GetMapping("/artistsTop5")
	@ResponseBody
	public List<Artist> queryTop5() {
		return artistService.getNameByFanNumberTop5();
	}
	
	@GetMapping("/articleTop")
	@ResponseBody
	public AjaxResponse<Article> articleTop() {
		AjaxResponse<Article> res = new AjaxResponse<>();
		res.setType(AjaxResponseType.SUCCESS);
		res.setData(articleService.getTopByCount());
		return res;
	}
	
	@GetMapping("/articleTop10")
	@ResponseBody
	public AjaxResponse<List<Article>> articleTop10() {
		AjaxResponse<List<Article>> res = new AjaxResponse<>();
		res.setType(AjaxResponseType.SUCCESS);
		res.setData(articleService.getTop10ByCount());
		return res;
	}
	
}
