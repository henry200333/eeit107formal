package org.iii.seaotter.jayee.web;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Iterator;
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

import net.minidev.json.JSONArray;

@Controller
@RequestMapping("/admin/forum")
public class AdminForumController {
	@Autowired
	private ForumService forumService;

	@RequestMapping("/list")
	public String listPage(Model model) {
//		model.addAttribute("models", forumService.getAll());
//		model.addAttribute("forum", new Forum());
		return "/admin/forum-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/forum-add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id, Model model) {
//		Long id = (Long) Long.valueOf(request.getParameter("id"));
		Forum forum = forumService.getById(id);
		model.addAttribute("forumParam", forum);
		return "/admin/forum-edit";
	}

	@PostMapping("/insert")
	@ResponseBody
	public AjaxResponse<Forum> insert(@Valid @RequestBody Forum forum, BindingResult bindingResult, Model model) {
		AjaxResponse<Forum> result = new AjaxResponse<>();
		List<Message> messages = new ArrayList<>();
		System.out.println(bindingResult.getAllErrors());
		if (forum.getUserName() == null || forum.getUserName().trim() == "") {
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
		result.setType(AjaxResponseType.SUCCESS);
		result.setData(forumService.create(forum));
		return result;
	}

	@PostMapping("/update")
	@ResponseBody
	public AjaxResponse<Forum> update(@RequestBody Forum forum, BindingResult bindingResult) {
		AjaxResponse<Forum> result = new AjaxResponse<Forum>();
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getObjectName());
			result.setType(AjaxResponseType.ERROR);
			System.out.println("result with error");
			return result;
		}
//		forum.setCommentDate(forumService.getById(forum.getId()).getCommentDate());
		forumService.update(forum);
		result.setType(AjaxResponseType.SUCCESS);
		System.out.println("result with success");
		return result;
	}

	@PostMapping("/delete")
	public String delete(@RequestParam("id") Long id1, HttpServletRequest request, Model model) {
		forumService.deleteById(id1);
		return "redirect:/admin/forum/list";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Forum> query() {
		return forumService.getAll();
	}

//	@RequestMapping("/search")
//	@ResponseBody
//	public List<Forum> search(@RequestBody Forum forum) {
//		Board board = forum.getBoard();
//		List<Forum> list = new ArrayList<>();
//		Iterator<Forum> tempList = forumService.getAll().iterator();
//		while (tempList.hasNext()) {
//			Forum value = tempList.next();
//			if (value.getBoard().equals(board)) {
//				list.add(value);
//			}
//		}
//		System.out.println(list.size());
//		return list;
//	}
	
	@RequestMapping("/search")
	@ResponseBody
	public List<Forum> search(@RequestBody Forum forum0) {
		List<Forum> list = new ArrayList<>();
		String searchWord = forum0.getComment();
		System.out.println(searchWord);
		if(searchWord!=null&&searchWord!="") {
			List<Forum> tempList = forumService.getAll();
			//每行資料逐欄位比對字串
			for(int i =0;i<tempList.size();i++) {
				Boolean flag1 = false;
				Forum forum = tempList.get(i);				
				if(forum.getBoard().toString().contains(searchWord)) {
					flag1 = true;
				}else if(forum.getComment().toString().contains(searchWord)) {
					flag1 = true;
				}else if(forum.getCommentDate().toString().contains(searchWord)) {
					flag1 = true;
				}else if(forum.getId().toString().contains(searchWord)) {
					flag1 = true;
				}else if(forum.getRefCommentId().toString().contains(searchWord)) {
					flag1 = true;
				}else if(forum.getRefId().toString().contains(searchWord)) {
					flag1 = true;
				}else if(forum.getUserName().toString().contains(searchWord)) {
					flag1 = true;
				}else{}
				
				if(flag1) {
					list.add(forum);
				}		
			}			
		}
		return list;
	}
	

	@RequestMapping("/fitComment")
	@ResponseBody
	public List<Forum> fitComment(@RequestBody Forum targetData) {
		return forumService.selectByBoardAndRefId(targetData.getBoard(), targetData.getRefId());
	}
}
