package org.iii.seaotter.jayee.web;




import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
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

	
	
}
