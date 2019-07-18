package org.iii.seaotter.jayee.web;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.websocket.server.PathParam;

import org.hibernate.hql.internal.ast.tree.IsNullLogicOperatorNode;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Artist;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.JobApplication;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.ArtistService;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/user/job")
public class UserJobController {
	
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
		return "/user/job-list";
	}
	
	@RequestMapping("/application/list")
	public String userJobPage() {
		return "/user/artist-application-list";
	}
	
	@RequestMapping("/findjobs")
	@ResponseBody
	public List<Job>findById(@RequestParam("id")Long id, Model model){
		
		Vender bean= venderService.getById(id);
		System.out.println(jobservice.getByVender(bean).size());
		return jobservice.getByVender(bean);
	}
	
	
	@RequestMapping("/finduserapplication/{username}")
	@ResponseBody
	public List<JobApplication> findByUserId(@PathVariable("username") String username){
		SecurityUser user=securityUserService.getByUserName(username);
		return jobservice.getByUser(user);
	}
	
	
//	@RequestMapping("/query")
//	@ResponseBody
//	public List<Job> query(){
//		System.out.println("aa");
//		
//		System.out.println(jobservice.getAll().size());
//		return jobservice.getAll();
//	}
	
	@RequestMapping("/query")
	@ResponseBody
	public GridResponse<Job> query(@RequestParam(value = "page") Integer page) {
		String sidx="jobTime";
		Integer size = 6;
		GridResponse<Job> grid = new GridResponse<Job>();
		Sort sort = new Sort(Sort.Direction.DESC, sidx);
		Pageable pageable = PageRequest.of(page - 1, size, sort);

		Specification<Job> specification = new Specification<Job>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Job> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
			
				return predicate;
			}
		};
		Page<Job> result = jobservice.getAll(specification, pageable);
		grid.setRows(result.getContent());
		grid.setPage(page);
		grid.setRecords(result.getTotalElements());
		grid.setTotal(result.getTotalPages());
		return grid;
	}
	
	
	
	
	
	@RequestMapping("/addapplication")
	@ResponseBody
	public Map<String, String> addapplication(@RequestParam("jobid") Long jobid ,@RequestParam("username") String userName ,Model model){
		
		
		Map<String, String> message=new HashMap<>();
		SecurityUser user=securityUserService.getByUserName(userName);
		Job job=jobservice.getById(jobid);
		if(user.getArtist()==null) {
			message.put("mes", "未具有申請資格");
			return message;
		}
		if(jobservice.checkApplication(user, job)) {
			System.out.println("已申請");
			message.put("mes", "你已經申請了");
		}else {
			jobservice.saveApplication(user,job);
			message.put("mes", "申請成功");
		}
		
		
		
		return message;
	}

	
	
}
