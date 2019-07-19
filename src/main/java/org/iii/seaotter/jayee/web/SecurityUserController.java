package org.iii.seaotter.jayee.web;

import java.io.IOException;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ArtistService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class SecurityUserController {
	
	@Autowired
	private SecurityUserService securityUserService;
	
	@RequestMapping("/{username}")
	public String userPage(@PathVariable String username, Model model) {
		SecurityUser user = securityUserService.getByUserName(username);
		model.addAttribute("userParam", user);
		return "/user/userpage";
	}
	
	@RequestMapping("/edit/{username}")
	public String edit(@PathVariable String username, Model model) {
		System.out.println(username);
		SecurityUser user = securityUserService.getByUserName(username);
		model.addAttribute("userParam", user);
		return "/user/edit";
	}
	
	@PostMapping("/uploadPhoto")
	public String upload(@RequestParam("imageFile") MultipartFile imageFile,@RequestParam("username")String username) throws IOException {
		System.out.println(username);
		String returnValue = "/index";
		try {
			ArtistService.saveImage(imageFile,username);
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
}
