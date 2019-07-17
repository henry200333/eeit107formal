package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/activity")
public class ActivityController {

	@RequestMapping("/list")
	public String jobs() {
		return "/user/activityTest";
	}
	
}
