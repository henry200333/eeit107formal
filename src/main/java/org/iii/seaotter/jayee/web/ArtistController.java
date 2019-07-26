package org.iii.seaotter.jayee.web;

import java.util.ArrayList;
import java.util.List;

import org.iii.seaotter.jayee.entity.SearchUser;
import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ArtistController {

	@Autowired
	private SecurityUserService securityUserService;

	@GetMapping("/artist")
	public String artistListPage() {
		return "/user/artist-list";
	}

	@GetMapping("/artist-list")
	@ResponseBody
	public List<SearchUser> artistList() {
		List<SearchUser> list = new ArrayList<SearchUser>();
		for (SecurityUser user : securityUserService.getAll()) {
			for (SecurityRole role : user.getRoles()) {
				if (role.toString().contains("ROLE_ARTIST")) {
					SearchUser user2 = new SearchUser();
					BeanUtils.copyProperties(user, user2);
					list.add(user2);
				}
			}

		}
		return list;
	}
	
	
	@GetMapping("/artist-query")
	@ResponseBody
	public List<SearchUser> artistQuery(@RequestParam(value = "search", defaultValue = "") String displayName){
		List<SearchUser> list = new ArrayList<SearchUser>();
		for (SecurityUser user : securityUserService.getByDisplayName(displayName)) {
			for (SecurityRole role : user.getRoles()) {
				if (role.toString().contains("ROLE_ARTIST")) {
					SearchUser user2 = new SearchUser();
					BeanUtils.copyProperties(user, user2);
					list.add(user2);
				}
			}

		}
		return list;
	}
}
