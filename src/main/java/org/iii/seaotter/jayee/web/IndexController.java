package org.iii.seaotter.jayee.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.ArtistService;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user")
public class IndexController {
	
	@Autowired
	private ArtistService artistService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ForumService forumService;
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request) {
		
		String username  = request.getParameter("username");
		if("SeaOtter".equals(username))
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
	
	@GetMapping("/activityTop3")
	@ResponseBody
	public List<Activity> activityTop3() {
		return activityService.getTop3NameByAwesomeNum();
	}
	
	@PostMapping("/fitComments")
	@ResponseBody
	public List<Forum> fitComment(@RequestBody Forum targetData) {
		return forumService.selectByBoardAndRefId(targetData.getBoard(), targetData.getRefId());
	}
	
	
}
