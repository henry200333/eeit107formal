package org.iii.seaotter.jayee.web;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/performance")
public class AdminPerformanceController {

	@Autowired
	private PerformanceService performanceSurvice;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("performances", performanceSurvice.getAll());
		return "/admin/performance-list";

	}
	
	@RequestMapping("/query")
	@ResponseBody  //轉成JSON
	public List<Performance> query(){
		List<Performance> list = performanceSurvice.getAll();
		for(Performance p : list) {
			System.out.println(p.getUpdateTime());
		}
		return performanceSurvice.getAll();
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		model.addAttribute("performance", new Performance());
		return "/admin/performance-add";

	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam("id") String idget, Model model) {
		Long id = Long.parseLong(idget);
		Performance performance = performanceSurvice.getById(id);
		Performance performanceUpdate = new Performance();
		model.addAttribute("performance", performanceUpdate);
		model.addAttribute("performanceEdit", performance);
		return "/admin/performance-edit";

	}

	@PostMapping("/insert")
	@ResponseBody
	public Map<String,String> insert(@RequestBody Performance performance, Model model) {

		System.out.println(performance);

		Map<String, String> result = new HashMap<>();
		
		String name = performance.getName();
		String url = performance.getUrl();
		Long aid = performance.getActivityId();

		// name
		if (name == null || name.trim().length() == 0) {
			result.put("name", "NAME欄位不能為空");
		}

		// url
		if (url == null || url.trim().length() == 0) {
			result.put("url", "URL欄位不能為空");
		}else {
			try {
				URL checkUrl = new URL(url);
				checkUrl.openStream();
			} catch (Exception e) {
				e.printStackTrace();
				result.put("url", "無效的網址");
			}
		}

		//aid
		if (aid == null ) {
			result.put("aid", "ACTIVITYID欄位不能為空");
		}
		if (!result.isEmpty()) {	
			return result;
		}
		
		performanceSurvice.insert(performance);
		result.put("success", "success");
		return result;

	}

	@PostMapping("/update")
	public String update(@ModelAttribute("performance") Performance performance, Model model) {
		Map<String, String> errorMsg = new HashMap<>();
		model.addAttribute("error",errorMsg );
		String name = performance.getName();
		String url = performance.getUrl();
		Long aid = performance.getActivityId();

		// name
		if (name == null || name.trim().length() == 0) {
			errorMsg.put("name", "NAME欄位不能為空");
		}

		// url
		if (url == null || url.trim().length() == 0) {
			errorMsg.put("url", "URL欄位不能為空");
		}else {
			try {
				URL checkUrl = new URL(url);
				checkUrl.openStream();
			} catch (Exception e) {
				e.printStackTrace();
				errorMsg.put("url", "無效的網址");
			}
		}

		//aid
		if (aid == null ) {
			errorMsg.put("aid", "ACTIVITYID欄位不能為空");
		}
		System.out.println(performance);
		if (!errorMsg.isEmpty()) {	
			model.addAttribute("peformacnce", performance);
			return "/admin/performance-edit";
		}
		
		boolean re = performanceSurvice.update(performance);
		return "redirect:/admin/performance/list";

	}

	@PostMapping("delete")
	public String delete(@RequestParam("id") String idget) {
		Long id = Long.parseLong(idget);
		Performance performance = new Performance();
		performance.setId(id);
		performanceSurvice.delete(performance);
		return "redirect:/admin/performance/list";

	}
}
