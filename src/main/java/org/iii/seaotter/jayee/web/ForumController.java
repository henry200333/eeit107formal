package org.iii.seaotter.jayee.web;

import java.util.ArrayList;
import java.util.List;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/forum")
@ResponseBody
public class ForumController {
	
	@Autowired
	ForumService forumService; 
	
	@RequestMapping("/iwantcomments")
	public List<Forum> loadComment(@Payload Forum inputForum){
		List<Forum> loadComments = new ArrayList<Forum>();		
		loadComments=forumService.getBoardRefIDComments(inputForum.getForumBoard(),inputForum.getRefId());
		return loadComments;
	}
	
	
}
