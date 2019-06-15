package org.iii.seaotter.jayee.web;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Forum.Board;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public Forum insert(@Valid@RequestBody Forum forum,BindingResult bindingResult, Model model) {
		
		System.out.println(bindingResult.getAllErrors());
		Map<String, String> result = new HashMap<>();
		System.out.println(forum.getName());
		if (forum.getName() == null || forum.getName().trim() == "") {
			result.put("eName", "請輸入名稱");
		}
		if (forum.getContent() == null || forum.getContent().trim() == "") {
			result.put("eContent", "請輸入內容");
		}
		if (forum.getBoard() == null || !Board.contains(forum.getBoard().name())) {
			result.put("eBoard", "請選擇");
		}
		if (!result.isEmpty()) {
			return forumService.create(forum);
		}
		forum.setCommentDate(new Timestamp(new java.util.Date().getTime()));
		System.out.println(forum.getCommentDate());
//		forumService.create(forum);
		result.put("success", "ok");
		return forumService.create(forum); 
	}

	@PostMapping("/update")
	public String update(@ModelAttribute("forum") Forum forum, Model model) {
		forum.setCommentDate(forumService.getById(forum.getId()).getCommentDate());
		forumService.update(forum);
		return "redirect:/admin/forum/list";
	}

	@PostMapping("/delete")
	public String delete(@RequestParam("id") Long id1, HttpServletRequest request,Model model) {
//		Long id = (Long) Long.valueOf(request.getParameter("id"));
		forumService.deleteById(id1);
		return "redirect:/admin/forum/list";
	}
	
	@RequestMapping("/query")
	@ResponseBody
	public List<Forum> query(){
		return forumService.getAll();
	}
	
}
