package org.iii.seaotter.jayee.web;

import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Activity;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Performance;
import org.iii.seaotter.jayee.service.ActivityService;
import org.iii.seaotter.jayee.service.ArticleService;
import org.iii.seaotter.jayee.service.PerformanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/performance")
public class AdminPerformanceController {

	@Autowired
	private PerformanceService performanceSurvice;

	@Autowired
	private ActivityService activityService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("performances", performanceSurvice.getAll());
		return "/admin/performance-list";

	}
	

	@GetMapping("/query")
	@ResponseBody // 轉成JSON
	public GridResponse <Performance> query(@RequestParam(value="page") Integer page, @RequestParam(value="rows") Integer size,
			@RequestParam(value="title", defaultValue="") String title,
			@RequestParam(value="sidx") String sidx,
			@RequestParam(value="sord") String sord)  {
		GridResponse<Performance> gridResponse = new GridResponse<Performance>();
		Sort sort=new Sort(Sort.Direction.ASC,sidx);
		if("desc".equalsIgnoreCase(sord)){
			sort=new Sort(Sort.Direction.DESC,sidx);
		}
		Pageable pageable = PageRequest.of(page-1, size,sort);
		Specification<Performance> spec = new Specification<Performance>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Performance> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();	
				if (!StringUtils.isEmpty(title)) {
					where = cb.and(cb.like(root.get("title"), "%" + title + "%"));
				}		
				return where;
			}
		};
		Page<Performance> result = performanceSurvice.getAll(spec, pageable);
//		System.out.println(result);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setTotal(result.getTotalPages());
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
	}

	@RequestMapping("/add")
	public String addPage(Model model) {
		System.out.println("add");
		return "/admin/performance-add";

	}

	@RequestMapping("/aid")
	@ResponseBody
	public List<Activity> addAid() {
		System.out.println("aid");
		return activityService.getAll();

	}


	
	@RequestMapping("/search")
	@ResponseBody
	public List<Performance> search(@RequestParam String search){
		List<Performance> getdata = performanceSurvice.getAll();
		if(search==null || search.trim().length()==0) {
			return getdata;
		}
		
		List<Performance> searchResult = new ArrayList<>();
		for(int i=0;i<getdata.size();i++) {
			boolean flag = false;
			Performance data = getdata.get(i);
			if(data.getActivityId().toString().contains(search))
				flag=true;
			if(data.getTitle().contains(search))
				flag=true;
			if(data.getUrl().contains(search))
				flag=true;
			if(data.getUpdateTime().toString().contains(search))
				flag=true;
			if(data.getActivityId().toString().contains(search))
				flag=true;
			if(data.getViews().toString().contains(search))
				flag=true;
			if(flag)
				searchResult.add(data);
		}
		System.out.println(searchResult);
		return searchResult;
	}


	
	//增加點閱率
	@RequestMapping("/viewplus")
	@ResponseBody
	public Performance viewplus(@ModelAttribute("performance") Performance performance, Model model) {
		System.out.println("viewplus");
		performance = performanceSurvice.getById(performance.getId());
		System.out.println(performance);
		Long views = performance.getViews();
		views ++;
		performance.setViews(views);
		System.out.println(performance);
		performanceSurvice.update(performance);
		return performance;

	}
	
	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable Long id, Model model) {
		Performance performance = performanceSurvice.getById(id);
		model.addAttribute("performance", performance);
		return "/admin/performance-edit";

	}

	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Performance> insert(@RequestBody Performance performance, Model model) {
		System.out.println("insert");
		// 測試是否傳到後台
		System.out.println(performance);

		// 回傳型態AjaxResponse與內部的宣告
		AjaxResponse<Performance> result = new AjaxResponse<>();
		List<Message> messages = new ArrayList<>();

		String title = performance.getTitle();
		String url = performance.getUrl();
		String introduction = performance.getIntroduction();

		// title
		if (title == null || title.trim().length() == 0) {
			messages.add(new Message("title", "title欄位不能為空"));
		}
		
		// introduction
				if (introduction == null || introduction.trim().length() == 0) {
					performance.setIntroduction("沒有簡介");
				}

		// url
		if (url == null || url.trim().length() == 0) {
			messages.add(new Message("url", "URL欄位不能為空"));
		} else {
			try {
				URL checkUrl = new URL(url);
				checkUrl.openStream();
			} catch (Exception e) {
				e.printStackTrace();
				messages.add(new Message("url", "無效的網址"));
			}
		}

		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}
		performance.setViews(0L);
		performance.setLikes(0L);
		performance.setUnlikes(0L);
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(performanceSurvice.insert(performance));
		return result;

	}

	@PutMapping("/update")
	@ResponseBody
	public AjaxResponse<Performance> update(@RequestBody Performance performance, Model model) {
		System.out.println("update");
		// 測試是否傳到後台
		System.out.println(performance);

		// 回傳型態AjaxResponse與內部的宣告
		AjaxResponse<Performance> result = new AjaxResponse<>();
		List<Message> messages = new ArrayList<>();

		String title = performance.getTitle();
		String url = performance.getUrl();
		String introduction = performance.getIntroduction();

		// title
		if (title == null || title.trim().length() == 0) {
			messages.add(new Message("title", "TITLE欄位不能為空"));
		}

		// introduction
		if (introduction == null || introduction.trim().length() == 0) {
			performance.setIntroduction("沒有簡介");
		}
		
		// url
		if (url == null || url.trim().length() == 0) {
			messages.add(new Message("url", "URL欄位不能為空"));
		} else {
			try {
				URL checkUrl = new URL(url);
				checkUrl.openStream();
			} catch (Exception e) {
				e.printStackTrace();
				messages.add(new Message("url", "無效的網址"));
			}
		}

		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}

		result.setType(AjaxResponseType.SUCCESS);
		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}		
		boolean updateResult  =performanceSurvice.update(performance);
		if(updateResult) {
			result.setType(AjaxResponseType.SUCCESS);
			result.setData(performanceSurvice.getById(performance.getId()));
		}else {
			result.setType(AjaxResponseType.ERROR);
		}
			return result;

	}


	@DeleteMapping("/{id}")
	@ResponseBody
	public AjaxResponse<Performance> delete(@PathVariable Long id) {
		AjaxResponse<Performance> result=new AjaxResponse<>();		
		performanceSurvice.deleteById(id);
		//begin of cascade.delete article
		List<Article> articleList = articleService.getByRefIdAndType(id, ArticleType.Performance);
		if(articleList != null && articleList.size() != 0) {
			for (Article article : articleList) {
				articleService.delete(article);
			}
		}
		//end of cascade.delete article
		result.setType(AjaxResponseType.SUCCESS);
		return result;

	}
	
	
	@PostMapping("like")
	@ResponseBody
	public Performance like(@RequestParam("id")Long id,@RequestParam("unlikeType") int unlikeType) {
		Performance performance = performanceSurvice.getById(id);
		Long likes = performance.getLikes();
		Long unlikes = performance.getUnlikes();
		if(unlikeType==0) {
			likes++;
			performance.setLikes(likes);
		}
		else if(unlikeType==1) {
			likes++;
			unlikes--;
			performance.setLikes(likes);
			performance.setUnlikes(unlikes);
		}else if(unlikeType==2) {
			likes--;
			performance.setLikes(likes);
		}
		performanceSurvice.update(performance);
		return performance;
	}
	
	@PostMapping("unlike")
	@ResponseBody
	public Performance unlike(@RequestParam("id")Long id,@RequestParam("likeType")int likeType) {
		System.out.println("unlike");
		Performance performance = performanceSurvice.getById(id);
		Long likes = performance.getLikes();
		Long unlikes = performance.getUnlikes();		
		if(likeType==0) {
			unlikes++;
			performance.setUnlikes(unlikes);
		}
		else if(likeType==1) {
			unlikes++;
			likes--;
			performance.setUnlikes(unlikes);
			performance.setLikes(likes);
		}else if(likeType==2) {
			unlikes--;
			performance.setUnlikes(unlikes);
		}
		performanceSurvice.update(performance);
		return performance;
	}
}
