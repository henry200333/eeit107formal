package org.iii.seaotter.jayee.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

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
	
	@PostMapping("/settings/profiles")
	@ResponseBody
	public Boolean profileSetting(@RequestParam("type")String type, @RequestParam("context") String context) {
		SecurityUser user = securityUserService
				.getByUserName(SecurityContextHolder.getContext().getAuthentication().getName());
		if ("introduction".equals(type)) {
			user.setIntroduction(context);
			securityUserService.update(user);
			return true;
		}else if ("displayName".equals(type)) {
			user.setDisplayName(context);
			securityUserService.update(user);
			return true;
		}else if ("trueName".equals(type)) {
			user.setMemberName(context);
			securityUserService.update(user);
			return true;
		}else if ("address".equals(type)) {
			user.setAddress(context);
			securityUserService.update(user);
			return true;
		}else if ("mail".equals(type)) {
			user.setMail(context);
			securityUserService.update(user);
			return true;
		}else if ("gender".equals(type)) {
			user.setGender(context);
			securityUserService.update(user);
			return true;
		}else
			return false;
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
	public Long addFriend(@RequestParam("reciever") String reciever) {
		return noticeService.addFriendNotice(reciever);
	}
	
	@PostMapping("/dis/friend")
	@ResponseBody
	public void disFriend(@RequestParam("noticeId") Long noticeId) {
		noticeService.disFriendNotice(noticeId);
	}
	
	@PostMapping("/check/friend")
	@ResponseBody
	public Map<String,String> checkFriend(@RequestParam Map<String,String> data) {
		Map<String,String> res=new HashMap<>();
		SecurityUser user=securityUserService.getByUserName(data.get("username"));
		Long userId=user.getUserId();
		Long friendId =securityUserService.getByUserName(data.get("friendname")).getUserId();
		for(int i=0;i<user.getFriends().size();i++) {
			if(user.getFriends().get(i).getUserId().equals(friendId)) {
				res.put("status", "已是好友");
				return res;
			};
		}
		
		if(noticeService.checkFriendNotice(userId, friendId)) {
			res.put("status", "申請中");
			res.put("noticeId", noticeService.getReceiverAndSender(userId, friendId).toString());
			return res;
		}else {
			res.put("status", "可申請");
			return res;
		}
	}
	
	
}
