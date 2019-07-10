package org.iii.seaotter.jayee.web;




import java.util.List;

import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin/job")
public class AdminJobController {
	
	@Autowired
	private JobService jobservice;
	
	@Autowired
	private VenderService venderService;
	
	@RequestMapping("/jobs")
	public String jobs() {
		return "/admin/vender-jobs";
	}
	
	@RequestMapping("/findjobs")
	@ResponseBody
	public List<Job> query(@RequestParam("id")Long id, Model model){
		
		Vender bean= venderService.getById(id);
		System.out.println(jobservice.getByVender(bean).size());
		return jobservice.getByVender(bean);
	}
	
}
