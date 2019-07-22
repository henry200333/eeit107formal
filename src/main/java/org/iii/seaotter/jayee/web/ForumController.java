package org.iii.seaotter.jayee.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.service.ForumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/forum")
@ResponseBody
public class ForumController {
	
	@Autowired
	ForumService forumService; 
	
	@RequestMapping("/iwantcomments")
	public List<Forum> loadComment(@Payload Forum inputForum,HttpSession s123){
		List<Forum> loadComments = new ArrayList<Forum>();		
		loadComments=forumService.getBoardRefIDComments(inputForum.getForumBoard(),inputForum.getRefId());
		return loadComments;
	}
	
	@RequestMapping("/likeButtonClick")
	@ResponseBody
	public Forum likeButtonClike(@RequestParam Long id, @RequestParam Long likeType) {
		Forum forum = null;
		if(likeType==1) {
			forum = forumService.likePlusOne(id);
		}else if(likeType==2) {
			forum = forumService.likePlusOneAndDislikeMinusOne(id);
		}	
		return forum;
	}
	
	@RequestMapping("/dislikeButtonClick")
	@ResponseBody
	public Forum dislikeButtonClike(@RequestParam Long id, @RequestParam Long dislikeType) {
		Forum forum = null;
		if(dislikeType==1) {
			forum = forumService.dislikePlusOne(id);
		}else if(dislikeType==2) {
			forum = forumService.dislikePlusOneAndLikeMinusOne(id);
		}	
		return forum;
	}
	
	@RequestMapping("/addCommentReply")
	@ResponseBody
	public Forum addCommentReply(Forum forum) {
		System.out.println(forum);
		forum = forumService.create(forum);
		
		return forum;
	}
	
	@RequestMapping("/editComment")
	@ResponseBody
	public Forum editComment(Forum forum) {
		Forum tempForum = forumService.getById(forum.getId());
		tempForum.setComment(forum.getComment());
		forum = forumService.create(tempForum);	
		System.out.println(forum);
		return forum;
	}
}
