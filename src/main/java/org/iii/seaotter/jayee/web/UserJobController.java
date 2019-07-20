package org.iii.seaotter.jayee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.hibernate.hql.internal.ast.tree.IsNullLogicOperatorNode;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.JobApplication;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.JobService;
import org.iii.seaotter.jayee.service.LocationService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.iii.seaotter.jayee.service.VenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/user/job")
public class UserJobController {

	@Autowired
	private LocationService locationService;

	@Autowired
	private JobService jobservice;

	@Autowired
	private VenderService venderService;

	@Autowired
	private SecurityUserService securityUserService;

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
	public List<Job> findById(@RequestParam("id") Long id, Model model) {

		Vender bean = venderService.getById(id);
		System.out.println(jobservice.getByVender(bean).size());
		return jobservice.getByVender(bean);
	}

	@RequestMapping("/finduserapplication/{username}")
	@ResponseBody
	public GridResponse<JobApplication> findByUserId(@PathVariable("username") String username,
			@RequestParam(value = "page") Integer page) {
		String sidx = "applicationTime";
		Integer size = 6;
		GridResponse<JobApplication> grid = new GridResponse<JobApplication>();
		Sort sort = new Sort(Sort.Direction.DESC, sidx);
		Pageable pageable = PageRequest.of(page - 1, size, sort);
		Long userId = securityUserService.getByUserName(username).getUserId();
		Specification<JobApplication> specification = new Specification<JobApplication>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<JobApplication> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				predicate = cb.and(cb.equal(root.get("user"), userId));
				predicate = cb.and(cb.equal(root.get("status"), "申請中"));
				return predicate;
			}
		};
		Page<JobApplication> result = jobservice.getAllJobApplication(specification, pageable);
//		System.out.println(result.getContent().getClass());
		grid.setRows(result.getContent());
		grid.setPage(page);
		grid.setRecords(result.getTotalElements());
		System.out.println(result.getTotalElements());
		grid.setTotal(result.getTotalPages());
		System.out.println(result.getTotalPages());

		return grid;
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
	public GridResponse<Job> query(@RequestParam(value = "page") Integer page,
			@RequestParam(value = "type") String type, @RequestParam(value = "city") String city,
			@RequestParam(value = "district") String district) {
		System.out.println("star");
		System.out.println(district);
		System.out.println("end");
		String sidx = "jobTime";
		Integer size = 6;
		GridResponse<Job> grid = new GridResponse<Job>();
		Sort sort = new Sort(Sort.Direction.DESC, sidx);
		Pageable pageable = PageRequest.of(page - 1, size, sort);

		Specification<Job> specification = new Specification<Job>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Job> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (type == null ||  type.equals("null")  ||type.equals("全部") || type.trim().equals("")) {
					System.out.println("type empty");
				} else {
					predicate = cb.and(cb.equal(root.get("jobType"), type));
				}
				

				if (city == null || city.equals("null")  || city.equals("請選擇") || city.trim().equals("")) {
					System.out.println("city empty");
				} else {
					predicate = cb.and(cb.equal(root.get("city"), city));
				}
				

				if (district==null ||  district.equals("null")  || district.equals("請選擇") || district.trim().equals("")) {
					System.out.println("district empty");
				} else {
					System.out.println(district.equals("null"));
					predicate = cb.and(cb.equal(root.get("district"), district));
				}
				

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

	@RequestMapping("/location/city")
	@ResponseBody
	public List<String> getDistinctCity() {
		return locationService.getDistinctCity();
	}

	@RequestMapping("/location/{city}")
	@ResponseBody
	public List<String> getDistinctDistrictByCity(@PathVariable String city) {
		return locationService.getDistinctDistrictByCity(city);
	}

	@RequestMapping("/addapplication")
	@ResponseBody
	public Map<String, String> addapplication(@RequestParam("jobid") Long jobid,
			@RequestParam("username") String userName, Model model) {

		Map<String, String> message = new HashMap<>();
		SecurityUser user = securityUserService.getByUserName(userName);
		Job job = jobservice.getById(jobid);
		// 確定使用者是否有artist腳色
		if (false) {
			message.put("mes", "未具有申請資格");
			return message;
		}
		if (jobservice.getApplication(user, job) != null
				&& jobservice.getApplication(user, job).getStatus().equals("申請中")) {
			System.out.println("已申請");
			message.put("mes", "你已經申請了");
		} else {
			JobApplication application;
			if (jobservice.getApplication(user, job) == null) {
				application = new JobApplication();
			} else {
				application = jobservice.getApplication(user, job);
			}

			application.setJob(job);
			application.setUser(user);
			jobservice.saveApplication(application, "申請中");
			message.put("mes", "申請成功");
		}

		return message;
	}

	@RequestMapping("/cancelapplication")
	@ResponseBody
	public Map<String, String> cancelapplication(@RequestParam("jobid") Long jobid,
			@RequestParam("username") String userName, Model model) {
		SecurityUser user = securityUserService.getByUserName(userName);
		Job job = jobservice.getById(jobid);
		Map<String, String> message = new HashMap<>();
		JobApplication application = jobservice.getApplication(user, job);
		if (application != null && application.getStatus().equals("申請中")) {
			jobservice.saveApplication(application, "取消");
			message.put("mes", "已取消");
		} else {
			message.put("mes", "取消失敗，可能申請已取消或不存在");
		}
		return message;

	}

}
