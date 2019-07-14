package org.iii.seaotter.jayee.web;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.dao.SecurityRoleDao;
import org.iii.seaotter.jayee.entity.SecurityRole;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/securityUser")
public class AdminSecurityUserController {

	@Autowired
	private SecurityUserService securityUserService;
	
	@Autowired
	private SecurityRoleDao securityRoleDao;

	@RequestMapping("/list")
	public String listPage() {
		return "/admin/securityuser-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/securityuser-add";
	}

	@RequestMapping("/edit")
	public String editPage(SecurityUser securityUser, Model model) {
		securityUser = securityUserService.getById(securityUser.getUserId());
		model.addAttribute("securityUserParam", securityUser);
		return "/admin/securityuser-edit";
	}

	@RequestMapping("/query")
	@ResponseBody // 轉成JSON
	public GridResponse<SecurityUser> query(
			@RequestParam(value = "name", defaultValue = "") String account,
			@RequestParam(value = "page") Integer page, 
			@RequestParam(value = "rows") Integer size,
			@RequestParam(value = "sidx") String sidx, 
			@RequestParam(value = "sord") String sord) {
		Sort sort = new Sort(Sort.Direction.ASC, sidx);
		if ("desc".equalsIgnoreCase(sord)) {
			sort = new Sort(Sort.Direction.DESC, sidx);
		}
		Pageable pageable = PageRequest.of(page - 1, size, sort);
		GridResponse<SecurityUser> gridResponse = new GridResponse<>();
		Specification<SecurityUser> specification = new Specification<SecurityUser>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<SecurityUser> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();
				if (!StringUtils.isEmpty(account)) {
					where = cb.and(cb.like(root.get("account"), "%" + account + "%"));
				}
				return where;
			}
		};
		Page<SecurityUser> result = securityUserService.getAll(specification, pageable);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setRecords(result.getTotalElements());
		gridResponse.setTotal(result.getTotalPages());
		return gridResponse;
	}

	@PostMapping("/add")
	@ResponseBody
	public AjaxResponse<SecurityUser> insert(@Valid @RequestBody SecurityUser securityUser, BindingResult result) {
		System.out.println(securityUser);
		AjaxResponse<SecurityUser> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		}
		ajaxRes.setType(AjaxResponseType.SUCCESS);
		ajaxRes.setData(securityUserService.signUp(securityUser));
		return ajaxRes;
	}

	@PutMapping("/edit")
	@ResponseBody
	public AjaxResponse<SecurityUser> update(@Valid @RequestBody SecurityUser securityUser, BindingResult result) {
		System.out.println(securityUser);
		AjaxResponse<SecurityUser> ajaxRes = new AjaxResponse<>();
		if (result.hasErrors()) {
			ajaxRes.setType(AjaxResponseType.ERROR);
			return ajaxRes;
		}
		ajaxRes.setType(AjaxResponseType.SUCCESS);
		ajaxRes.setData(securityUserService.update(securityUser));
		return ajaxRes;

	}
	
	//修改權限
	@PostMapping("/editRow")
	@ResponseBody
	public void updateRow(
			@RequestParam(value="userId") Long id,
			@RequestParam(value="enabled") boolean enabled,
			@RequestParam(value="ADMIN") boolean ADMIN,
			@RequestParam(value="ARTIST") boolean ARTIST,
			@RequestParam(value="VENDER") boolean VENDER,
			@RequestParam(value="account") String account
			) {
		
//		System.out.println("id: "+id+"enable: "+enabled+"ADMIN: "+ADMIN+"ARTIST: "+ARTIST+"VENDER: "+VENDER);
		SecurityUser user=(SecurityUser)securityUserService.loadUserByUsername(account);
//		System.out.println(user.getAuthorities().toString());
		user.getAuthorities().clear();
//		System.out.println(user.getAuthorities().toString());
		Set<SecurityRole> roles = new HashSet<SecurityRole>();
		if(true==enabled) {
			user.setEnabled(true);
		}else {
			user.setEnabled(false);
		}
			roles.add(securityRoleDao.findByCode("ROLE_USER"));
		if(true==ADMIN) 
			roles.add(securityRoleDao.findByCode("ROLE_ADMIN"));
		if(true==ARTIST) 
			roles.add(securityRoleDao.findByCode("ROLE_ARTIST"));
		if(true==VENDER) 
			roles.add(securityRoleDao.findByCode("ROLE_VENDER"));
		user.setRoles(roles);
//		System.out.println(user.getAuthorities().toString()+"\n"+user.isEnabled());
		securityUserService.update(user);
		
	}

}
