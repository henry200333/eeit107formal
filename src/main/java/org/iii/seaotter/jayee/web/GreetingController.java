package org.iii.seaotter.jayee.web;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.ChatMessageStore;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ChatMessageStoreService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class GreetingController {
	
	private static List<String> ONLINE_ACCOUNT = new ArrayList<String>(); 
	
	@Autowired
	ChatMessageStoreService chatMessageStoreService; 
	
	@Autowired
	private SecurityUserService securityUserService;
	
    private SimpMessagingTemplate template;

    @Autowired
    public GreetingController(SimpMessagingTemplate template) {
        this.template = template;
    }
 
  
//    @MessageMapping("/message")
//    @SendToUser("/queue/reply")
//    public String processMessageFromClient(
//      @Payload String message, 
//      Principal principal) throws Exception {
//    return gson.fromJson(message, Map.class)
//          .get("name").toString();
//    }
    
    @MessageMapping("/imonline")
    public void notifyImOnline(@RequestParam(name="userAccount") String userAccount) {
    	//紀錄登入者
    	if(!ONLINE_ACCOUNT.contains(userAccount))
    		ONLINE_ACCOUNT.add(userAccount);
    }
        
    @MessageMapping("/secured/room") 
    public void sendSpecific(
      @Payload ChatMessageStore msg, 
      Principal user, 
      @Header("simpSessionId") String sessionId) throws Exception { 
          System.out.println(msg);   
          
          template.convertAndSend("/app/chat/single/"+msg.getTo(), msg);
          template.convertAndSend("/app/chat/single/"+msg.getFrom(), msg);
    }
    
    @GetMapping("/findmyfriends")
    @ResponseBody
    public List<SecurityUser> findFriends(@RequestParam(name="userAccount") String userAccount) {
    	List<SecurityUser> myFriedns = null;
    	 SecurityUser currentUser = securityUserService.findUserBean(userAccount);
    	 if(currentUser!=null) {
    	myFriedns = currentUser.getFriends();
    	 }
    	return myFriedns;
    }
    
    
    @RequestMapping("/getNewMessages")
	@ResponseBody
	public GridResponse <ChatMessageStore> query(@RequestParam(value="page") Integer page, @RequestParam(value="rows") Integer size,
			@Payload ChatMessageStore chatMessageStore) {
		GridResponse<ChatMessageStore> gridResponse = new GridResponse<ChatMessageStore>();
		Pageable pageable = PageRequest.of(page-1, size);
		Specification<ChatMessageStore> specification = new Specification<ChatMessageStore>() {
			private static final long serialVersionUID = 1L;

			@Override
			public Predicate toPredicate(Root<ChatMessageStore> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();	
//				if (!StringUtils.isEmpty(userName)) {
//					where = cb.and(cb.like(root.get("userName"), "%" + userName + "%"));
//				}
//
//				if (!StringUtils.isEmpty(userName)) {
//					where = cb.or(where,cb.like(root.get("comment"), "%" + userName + "%"));
//				}
//				
//				if (!StringUtils.isEmpty(comment)) {
//					where = cb.and(cb.like(root.get("comment"),"%" + comment + "%"));
//				}
				return where;
			}
		};
		Page<ChatMessageStore> result = chatMessageStoreService.getAll(specification, pageable);
//		System.out.println(result);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setTotal(result.getTotalPages());
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
	};

 

}