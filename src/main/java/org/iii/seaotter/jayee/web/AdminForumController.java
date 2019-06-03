package org.iii.seaotter.jayee.web;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Forum.Board;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/forum")
public class AdminForumController {

	@Autowired
	private ForumService forumService;
	
	@RequestMapping("/list")
	public String listPage(Model model) {
		model.addAttribute("models", forumService.getAll());
		return "/admin/forum-list";
	}
	
	@RequestMapping("/add")
	public String addPage(Model model) {
		return "/admin/forum-add";
	}
	@RequestMapping("/edit")
	public String editPage(Model model) {
		return "/admin/forum-edit";
	}
	
	public String update() {
		return null;
	}
	public String delete() {
		return null;
	}
	

	@RequestMapping("/insert")
	public String insert(Model model, HttpServletRequest request) {
		Forum forum = null;
		try {
			request.setCharacterEncoding("UTF-8");
			forum = new Forum();
			forum.setName(request.getParameter("name"));
			forum.setBoard(Board.valueOf(request.getParameter("Board")));
			forum.setContent(request.getParameter("content"));
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss");
			forum.setCommentDate(new java.sql.Timestamp(new java.util.Date().getTime()));
			forumService.create(forum);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}		
		return listPage(model);
	}
	
	
}
