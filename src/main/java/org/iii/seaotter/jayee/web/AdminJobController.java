package org.iii.seaotter.jayee.web;




import java.util.List;
import java.util.Map;

import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.ArtistService;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.SecurityUserService;
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
	
	@Autowired
	private SecurityUserService securityUserService;
	
	@Autowired
	private ArtistService artistService ;
	
	@RequestMapping("/list")
	public String jobs() {
		return "/admin/job-list";
	}
	
	@RequestMapping("/findjobs")
	@ResponseBody
	public List<Job>findbyid(@RequestParam("id")Long id, Model model){
		
		Vender bean= venderService.getById(id);
		System.out.println(jobservice.getByVender(bean).size());
		return jobservice.getByVender(bean);
	}
	@RequestMapping("/query")
	@ResponseBody
	public List<Job> query(){
		System.out.println("aa");
		
		System.out.println(jobservice.getAll().size());
		return jobservice.getAll();
	}
	
	
	@RequestMapping("/addapplication")
	@ResponseBody
	public Map<String, String> addapplication(@RequestParam("jobid") Long jobid ,@RequestParam("username") String userName ,Model model){
		System.out.println(jobid);
		System.out.println(userName);
		SecurityUser user=securityUserService.getByUserName(userName);
		Job job=jobservice.getById(jobid);
		System.out.println(user.getPassword());
		Artist artist =artistService.getAll().get(0);
		System.out.println("I success");
		
		
		jobservice.saveApplication(artist, job);
		return null;
	}

	
	
}
