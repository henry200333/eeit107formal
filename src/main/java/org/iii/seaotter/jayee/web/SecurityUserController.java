package org.iii.seaotter.jayee.web;

import java.io.IOException;

import org.iii.seaotter.jayee.entity.Notice;
import org.iii.seaotter.jayee.entity.SearchUser;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.ArtistService;
import org.iii.seaotter.jayee.service.NoticeService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SecurityUserController {

	@Autowired
	private SecurityUserService securityUserService;

	@Autowired
	private ArticleService articleService;

	@Autowired
	private NoticeService noticeService;

	@RequestMapping("/{username}")
	public String userPage(@PathVariable String username, Model model) {
		SearchUser user = new SearchUser();
		SecurityUser source = securityUserService.getByUserName(username);
		model.addAttribute("plike", source.getPlikes());
		BeanUtils.copyProperties(source, user);
		model.addAttribute("userParam", user);
		model.addAttribute("articleParam", articleService.getByAnnouncedUserId(source.getUserId()));
		return "/user/userpage";
	}

	@RequestMapping("/settings/profile")
	public String edit(Model model) {
		SecurityUser user = securityUserService
				.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		model.addAttribute("userParam", user);
		return "/user/edit";
	}

	@PostMapping("/uploadPhoto")
	public String upload(@RequestParam("imageFile") MultipartFile imageFile, @RequestParam("username") String username)
			throws IOException {
		String returnValue = "redirect:/settings/profile";
		try {
			ArtistService.saveImage(imageFile, username);
		} catch (Exception e) {
			e.printStackTrace();
			returnValue = "error";
		}
		SecurityUser user = securityUserService.getByUserName(username);
		String photo = "/resources/profile_image/" + username + ".jpg";
		user.setPhoto(photo);
		securityUserService.update(user);
		return returnValue;
	}

	@PostMapping("/add/friend")
	@ResponseBody
	public void addFriend(@RequestParam("reciever") String reciever) {
		noticeService.addFriendNotice(reciever);
	}
}
