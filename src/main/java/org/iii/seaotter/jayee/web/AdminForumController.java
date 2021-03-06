package org.iii.seaotter.jayee.web;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.ForumBoard;
import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.dao.SecurityRoleDao;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.service.ForumService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/forum")
public class AdminForumController {
	@Autowired
	SecurityUserService securityUserService;
	@Autowired
	SecurityRoleDao securityRoleDao;
	
	@Autowired
	private ForumService forumService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		return "/admin/forum-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/forum-add";
	}
	

	@RequestMapping("/edit/{id}")
	public String editPage(@PathVariable Long id, Model model) {
		Forum forum = forumService.getById(id);
		model.addAttribute("forumParam", forum);
		return "/admin/forum-edit";
	}

	@RequestMapping("/insertone")
	@ResponseBody
	public AjaxResponse<Forum> insert(Forum forum, Model model) {
		System.out.println(forum);
		AjaxResponse<Forum> result = new AjaxResponse<>();
		List<Message> messages = new ArrayList<>();
		if (forum.getUserName() == null || forum.getUserName().trim() == "") {
			messages.add(new Message("name", "請輸入名稱"));
		}
		if (forum.getComment() == null || forum.getComment().trim() == "") {
			messages.add(new Message("comment", "請輸入內容"));
		}
		if (forum.getForumBoard() == null || !ForumBoard.contains(forum.getForumBoard().name())) {
			messages.add(new Message("board", "請選擇"));
		}
		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(forumService.create(forum));
		return result;
	}

	@GetMapping("/update")
	@ResponseBody
	public AjaxResponse<Forum> update(Forum forum) {
		AjaxResponse<Forum> result = new AjaxResponse<Forum>();
		forumService.update(forum);
		result.setType(AjaxResponseType.SUCCESS);
		System.out.println("result with success");
		return result;
	}

	@DeleteMapping("/{id}")
	@ResponseBody
	public  AjaxResponse<Forum> delete(@PathVariable Long id) {
		System.out.println("enter delete");		
		forumService.deleteById(id);
		AjaxResponse<Forum> ajaxResponse = new AjaxResponse<>();
		ajaxResponse.setType(AjaxResponseType.SUCCESS);
		return ajaxResponse;
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public GridResponse <Forum> query(@RequestParam(value="page") Integer page, @RequestParam(value="rows") Integer size,
			@RequestParam(value="userName", defaultValue="") String userName,
			@RequestParam(value="comment", defaultValue="") String comment,
			@RequestParam(value="sidx") String sidx,
			@RequestParam(value="sord") String sord) {
		GridResponse<Forum> gridResponse = new GridResponse<Forum>();
		
		Sort sort=new Sort(Sort.Direction.ASC,sidx);
		if("desc".equalsIgnoreCase(sord)){
			sort=new Sort(Sort.Direction.DESC,sidx);
		}
		Pageable pageable = PageRequest.of(page-1, size,sort);
		Specification<Forum> specification = new Specification<Forum>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<Forum> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();	
				if (!StringUtils.isEmpty(userName)) {
					where = cb.and(cb.like(root.get("userName"), "%" + userName + "%"));
				}

				if (!StringUtils.isEmpty(userName)) {
					where = cb.or(where,cb.like(root.get("comment"), "%" + userName + "%"));
				}
				
				if (!StringUtils.isEmpty(comment)) {
					where = cb.and(cb.like(root.get("comment"),"%" + comment + "%"));
				}
				return where;
			}
		};
		Page<Forum> result = forumService.getAll(specification, pageable);
//		System.out.println(result);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setTotal(result.getTotalPages());
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
	};
	
	
	@RequestMapping("/selectall")
	@ResponseBody
	public List<Forum> selectAll(){
		return forumService.getAll();
	}
	

}
