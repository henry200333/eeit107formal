package org.iii.seaotter.jayee.web;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Forum.Board;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin/forum")
public class AdminForumController {
	@Autowired
	private ForumService forumService;

	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("models", forumService.getAll());
		model.addAttribute("forum", new Forum());
		return "/admin/forum-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/forum-add";
	}

	@RequestMapping("/edit")
	public String editPage(HttpServletRequest request) {
		Long id = (Long) Long.valueOf(request.getParameter("id"));
		Forum forum = forumService.getById(id);
		request.setAttribute("forumParam", forum);
		return "/admin/forum-edit";
	}

	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Forum> insert(@Valid@RequestBody Forum forum,BindingResult bindingResult, Model model) {
		AjaxResponse<Forum> result = new AjaxResponse<>();
		List<Message> messages = new ArrayList<>();
		System.out.println(bindingResult.getAllErrors());
		if (forum.getName() == null || forum.getName().trim() == "") {		
			messages.add(new Message("name", "請輸入名稱"));
		}
		if (forum.getComment() == null || forum.getComment().trim() == "") {
			messages.add(new Message("comment", "請輸入內容"));
		}
		if (forum.getBoard() == null || !Board.contains(forum.getBoard().name())) {
			messages.add(new Message("board", "請選擇"));
		}
		if (!messages.isEmpty()) {
			result.setType(AjaxResponseType.ERROR);
			result.setMessages(messages);
			return result;
		}
		forum.setCommentDate(new Timestamp(new java.util.Date().getTime()));
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(forumService.create(forum));
		return result; 
	}

	@PostMapping("/update")
	@ResponseBody
	public AjaxResponse<Forum> update(@Valid@RequestBody Forum forum, BindingResult bindingResult) {
		System.out.println("enter to update");
		AjaxResponse<Forum> result = new AjaxResponse<Forum>();
		if(bindingResult.hasErrors()) {		
			System.out.println(bindingResult.getObjectName());
			result.setType(AjaxResponseType.ERROR);
			System.out.println("result with error");
			return result;
		}
		forum.setCommentDate(forumService.getById(forum.getId()).getCommentDate());
		forumService.update(forum);
		result.setType(AjaxResponseType.SUCCESS);
		System.out.println("result with success");
		return result; 
	}

	@PostMapping("/delete")
	public String delete(@RequestParam("id") Long id1, HttpServletRequest request,Model model) {
		forumService.deleteById(id1);
		return "redirect:/admin/forum/list";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Forum> query(){
		return forumService.getAll();
	}
	
}
