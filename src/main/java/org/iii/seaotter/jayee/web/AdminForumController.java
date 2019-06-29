package org.iii.seaotter.jayee.web;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.iii.seaotter.jayee.common.AjaxResponse;
import org.iii.seaotter.jayee.common.AjaxResponseType;
import org.iii.seaotter.jayee.common.Message;
import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.Forum.Board;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
		return "/admin/forum-list";
	}

	@RequestMapping("/add")
	public String addPage() {
		return "/admin/forum-add";
	}

	@RequestMapping("/edit")
	public String editPage(@RequestParam Long id, Model model) {
		Forum forum = forumService.getById(id);
		model.addAttribute("forumParam", forum);
		return "/admin/forum-edit";
	}

	@PostMapping
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

	@PutMapping
	@ResponseBody
	public AjaxResponse<Forum> update(@RequestBody Forum forum, BindingResult bindingResult) {
		AjaxResponse<Forum> result = new AjaxResponse<Forum>();
		if (bindingResult.hasErrors()) {
			System.out.println(bindingResult.getObjectName());
			result.setType(AjaxResponseType.ERROR);
			System.out.println("result with error");
			return result;
		}
		forumService.update(forum);
		result.setType(AjaxResponseType.SUCCESS);
		System.out.println("result with success");
		return result;
	}

	@DeleteMapping("/{id}")
	public String delete(@PathVariable Long id) {
		System.out.println("enter delete");		
		forumService.deleteById(id);
		return "success";
	}

	@RequestMapping("/query")
	@ResponseBody
	public List<Forum> query(@Param("page") Integer page,@Param("size") Integer size) {
		Pageable  pageable = PageRequest.of(page, size);
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
	public List<Forum> search(@RequestParam String searchWord) {
		List<Forum> list = new ArrayList<>();
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

	@RequestMapping("/grid")
	@ResponseBody
	public List<Forum> gridResponseTest(){
		System.out.println("enter grid");
		return forumService.getAll();		
	}
	
}
