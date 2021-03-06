package org.iii.seaotter.jayee.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.ArticleType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.Article;
import org.iii.seaotter.jayee.entity.Job;
import org.iii.seaotter.jayee.entity.Vender;
import org.iii.seaotter.jayee.service.ArticleService;
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
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/vender")
public class AdminVenderController {

	@Autowired
	private VenderService venderService;
	@Autowired
	private JobService jobservice;
	
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/list")

	public String listPage(Model model) {
//		model.addAttribute("venders", venderService.getAll());
		return "/admin/vender-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/vender-add";
	}

	@RequestMapping("/edit")

	public String editPage(@RequestParam("id") Integer id, Model model) {
		Vender bean = venderService.getById(id);
//			System.out.println(bean);
			model.addAttribute("venderparam",bean);
			model.addAttribute("jobparam",jobservice.getByVender(bean));
		return "/admin/vender-edit";
	}
	
	@RequestMapping("/venderself")
	public String venderselfpage(@RequestParam("id")Long id, Model model) {
		Vender bean= venderService.getById(id);

//		System.out.println(bean);
		model.addAttribute("venderparam",bean);
		return "/admin/vender-jobs";
	}


	
	@RequestMapping("/findjobs")
	@ResponseBody
	public List<Job> query(@RequestParam("id")Long id, Model model){
		
		Vender bean= venderService.getById(id);
		System.out.println(jobservice.getByVender(bean).size());
		return jobservice.getByVender(bean);
	}
	
	
	
	@RequestMapping("/maptest")
	public String mapPage() {
		return "/admin/vender-maptest";
	}
	

	
	
	

	@RequestMapping("/query")
	@ResponseBody
	public GridResponse<Vender> query(@RequestParam(value = "name", defaultValue = "") String name,
			@RequestParam(value = "page") Integer page, @RequestParam(value = "rows") Integer size,
			@RequestParam(value = "sidx") String sidx, @RequestParam(value = "sord") String sord) {
		
//		System.out.println(sidx);
		GridResponse<Vender> grid = new GridResponse<Vender>();
		Sort sort = new Sort(Sort.Direction.ASC, sidx);
		if ("desc".equalsIgnoreCase(sord)) {
			sort = new Sort(Sort.Direction.DESC, sidx);
		}
		Pageable pageable = PageRequest.of(page - 1, size, sort);

		Specification<Vender> specification = new Specification<Vender>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Vender> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (!StringUtils.isEmpty(name)) {

					predicate = cb.and(cb.like(root.get("name"), "%" + name + "%"));

				}
				return predicate;
			}
		};
		Page<Vender> result = venderService.getAll(specification, pageable);
//		System.out.println(result.getContent().getClass());
		grid.setRows(result.getContent());
		grid.setPage(page);
		grid.setRecords(result.getTotalElements());
		grid.setTotal(result.getTotalPages());
		return grid;
	}


	@RequestMapping("/map")
	@ResponseBody
	public List<Vender> map(@RequestParam(value = "page") Integer page, @RequestParam(value = "rows") Integer size,
			@RequestParam(value = "maxlat") Double maxlat, @RequestParam(value = "minlat") Double minlat,
			@RequestParam(value = "maxlng") Double maxlng, @RequestParam(value = "minlng") Double minlng) {

		Pageable pageable = PageRequest.of(page - 1, size);
		Specification<Vender> specification = new Specification<Vender>() {

			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Vender> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate predicate = cb.conjunction();
				if (!StringUtils.isEmpty(maxlat) && !StringUtils.isEmpty(minlat)) {
					predicate = cb.and(cb.between(root.get("lat"), minlat, maxlat));
				}
				if (!StringUtils.isEmpty(maxlng) && !StringUtils.isEmpty(minlng)) {

					predicate = cb.and(cb.between(root.get("lng"), minlng, maxlng));
				}

				return predicate;
			}
		};

		System.out.println(venderService.getAll(specification, pageable).getContent().size());
		return venderService.getAll(specification, pageable).getContent();
	}

	@PostMapping("/insert")
	@ResponseBody
	public Map<String, String> insert(@RequestBody Vender vender, Model model) {
		Map<String, String> res = new HashMap<>();
		System.out.println(vender.getCity());
//		Vender vender=venders.get(0);
		String name = vender.getName();
		if (name == null || name.trim().length() == 0) {
			res.put("name", "請輸入餐廳名稱");
		}
		String address = vender.getAddress();
		if (address == null || address.trim().length() == 0) {
			res.put("address", "請輸入地址");
		}
		Integer max_people = vender.getMaxPeople();
		if (max_people == null || max_people == 0) {
			res.put("maxPeople", "請輸入容納人數");
		}
		String phone = vender.getPhone();
		if (phone == null || phone.trim().length() == 0) {
			res.put("phone", "請輸入電話");
		}
		if (!res.isEmpty()) {
			return res;
		}

		venderService.create(vender);
		res.put("success", "success");
		return res;

	}

	@PutMapping("/update")
	@ResponseBody
	public Map<String, String> updateinsert(@RequestBody List<Vender> venders, Model model) {
		Map<String, String> res = new HashMap<>();
		Vender vender = venders.get(0);
		String name = vender.getName();
		if (name == null || name.trim().length() == 0) {
			res.put("name", "請輸入名字");
		}
		String address = vender.getAddress();
		if (address == null || address.trim().length() == 0) {
			res.put("address", "請輸入地址");
		}
		Integer max_people = vender.getMaxPeople();
		if (max_people == null || max_people == 0) {
			res.put("maxPeople", "請輸入容納人數");
		}
		String phone = vender.getPhone();
		if (phone == null || phone.trim().length() == 0) {
			res.put("phone", "請輸入電話");
		}
		if (!res.isEmpty()) {
			return res;
		}
		venderService.edit(vender);
		res.put("success", "success");
		return res;

	}

	@DeleteMapping("/delete")
	@ResponseBody
	public Integer delete(@RequestParam("id") Integer id) {
		System.out.println(id);
//System.out.println(vender);
//		Vender vender=null;
//		vender=venderService.getById(id);
		venderService.delete(id);
//		System.out.println(vender);

		// begin of cascade.delete article
		List<Article> articleList = articleService.getByRefIdAndType(id.longValue(), ArticleType.Vender);
		if (articleList != null && articleList.size() != 0) {
			for (Article article : articleList) {
				articleService.delete(article);
			}
		}
		// end of cascade.delete article
		return id;

	}
}
