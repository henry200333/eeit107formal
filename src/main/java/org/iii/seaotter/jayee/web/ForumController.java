package org.iii.seaotter.jayee.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.iii.seaotter.jayee.entity.Forum;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ForumService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/forum")
@ResponseBody
public class ForumController {
	
	@Autowired
	ForumService forumService; 
	
	@Autowired
	SecurityUserService securityUserService;
	
	@RequestMapping("/iwantcomments")
	public List<Forum> loadComment(@Payload Forum inputForum,HttpSession s123){
		List<Forum> loadComments = new ArrayList<Forum>();		
		loadComments=forumService.getBoardRefIDComments(inputForum.getForumBoard(),inputForum.getRefId());
		return loadComments;
	}
	
	@RequestMapping("/likeButtonClick")
	@ResponseBody
	
	public Forum likeButtonClike(@RequestParam Long id, @RequestParam Long likeType,@RequestParam String userName) {
		SecurityUser user = securityUserService.getByUserName(userName);
		 List<Forum> userLikes = user.getForumLikes();
		 List<Forum> userDislikes = user.getForumDislikes();		 
		Forum forum = null;
		if(likeType==1) {
			forum = forumService.likePlusOne(id);
			userLikes.add(forum);
			user.setForumLikes(userLikes);
		}else if(likeType==2) {
			forum = forumService.likePlusOneAndDislikeMinusOne(id);
			userLikes.add(forum);
			user.setForumLikes(userLikes);
			userDislikes.remove(forum);
			user.setForumDislikes(userDislikes);
		}else if(likeType==3) {
			forum = forumService.likeMinusOne(id);
			userLikes.remove(forum);
			user.setForumLikes(userLikes);
		}		
		securityUserService.update(user);
		return forum;
	}
	
	@RequestMapping("/dislikeButtonClick")
	@ResponseBody
	public Forum dislikeButtonClike(@RequestParam Long id, @RequestParam Long dislikeType,@RequestParam String userName) {
		SecurityUser user = securityUserService.getByUserName(userName);
		 List<Forum> userLikes = user.getForumLikes();
		 List<Forum> userDislikes = user.getForumDislikes();
		Forum forum = null;		
		if(dislikeType==1) {
			forum = forumService.dislikePlusOne(id);
			userDislikes.add(forum);
			user.setForumDislikes(userDislikes);
		}else if(dislikeType==2) {
			forum = forumService.dislikePlusOneAndLikeMinusOne(id);
			userDislikes.add(forum);
			user.setForumDislikes(userDislikes);
			userLikes.remove(forum);
			user.setForumLikes(userLikes);
		}else if(dislikeType==3) {
			forum = forumService.dislikeMinusOne(id);
			userDislikes.remove(forum);
			user.setForumDislikes(userDislikes);
		}			
		securityUserService.update(user);
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
	
	@RequestMapping("/deleteComment")
	public void deleteComment(@RequestParam Long id) {
		forumService.deleteById(id);	
	}
	
	@RequestMapping("/getUserLikes")
	@ResponseBody
	public  List<Forum> getUserData(@RequestParam String account) {	
		
		return securityUserService.getByUserName(account).getForumLikes();
	}
	
	@RequestMapping("/getUserDislikes")
	@ResponseBody
	public  List<Forum> getUserDislike(@RequestParam String account) {	
		
		return securityUserService.getByUserName(account).getForumDislikes();
	}
	
@GetMapping("/test0725")
public void test0725(HttpServletResponse resp) throws IOException{
	String  mimetype = "application/x-download";
	resp.setCharacterEncoding("utf-8");
	resp.setHeader("Content-Disposition","attachment; filename=" + "123.xlsx");
	resp.setContentType(mimetype);
	File xlsx = new File("C:/Users/User/Desktop/157.xlsx"); // or whatever your file is
	FileInputStream in = new FileInputStream(xlsx);
	OutputStream out = resp.getOutputStream();

	byte[] buffer= new byte[8192]; // use bigger if you want
	int length = 0;

	while ((length = in.read(buffer)) > 0){
	     out.write(buffer, 0, length);
	}
	resp.flushBuffer();
	in.close();
	out.close();
	
}
	
}
