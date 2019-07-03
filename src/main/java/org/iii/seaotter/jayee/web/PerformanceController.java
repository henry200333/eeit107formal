package org.iii.seaotter.jayee.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user/performance")
public class PerformanceController {

	
	@RequestMapping("/add")
	public String add() {
		return "/user/user-performance-add";
	}
}
