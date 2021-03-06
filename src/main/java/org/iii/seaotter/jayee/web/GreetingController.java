package org.iii.seaotter.jayee.web;

import java.security.Principal;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.websocket.OnClose;

import org.iii.seaotter.jayee.common.GridResponse;
import org.iii.seaotter.jayee.entity.ChatMessageStore;
import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.service.ChatMessageStoreService;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class GreetingController {
	
//	private static List<String> ONLINE_ACCOUNT = new ArrayList<String>(); 
	
	@Autowired
	ChatMessageStoreService chatMessageStoreService; 
	
	@Autowired
	private SecurityUserService securityUserService;
	
    private SimpMessagingTemplate template;

    @Autowired
    public GreetingController(SimpMessagingTemplate template) {
        this.template = template;
    }
 
//    @MessageMapping("/offline") 
//    public void offline(@RequestParam String userAccount) {  	
//    	System.out.println(userAccount);
//    	userAccount = userAccount.substring(1, userAccount.length()-1);
//    	if(ONLINE_ACCOUNT.contains(userAccount))
//    		ONLINE_ACCOUNT.remove(userAccount);
//    }
//    
//    
//    @MessageMapping("/imonline")
//    public void notifyImOnline(@RequestParam(name="userAccount") String userAccount) {
//    	//紀錄登入者
//    	if(!ONLINE_ACCOUNT.contains(userAccount))
//    		ONLINE_ACCOUNT.add(userAccount);
//    }
        
    @MessageMapping("/secured/room") 
    public void sendSpecific(
      @Payload ChatMessageStore msg, 
      Principal user, 
      @Header("simpSessionId") String sessionId) throws Exception { 
   
          template.convertAndSend("/app/chat/single/"+msg.getReceiver(), msg);
          template.convertAndSend("/app/chat/single/"+msg.getSender(), msg);
          LocalDateTime localDateTime = LocalDateTime.now();		
  		ZoneId zoneId = ZoneId.systemDefault();
          ZonedDateTime zdt = localDateTime.atZone(zoneId);
          Date date = Date.from(zdt.toInstant());
          msg.setMessageTime(date);
       	chatMessageStoreService.recordMessage(msg);
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
		Sort sort = new Sort(Sort.Direction.DESC,"messageTime");
		Pageable pageable = PageRequest.of(page-1, size,sort);
		Specification<ChatMessageStore> specification = new Specification<ChatMessageStore>() {
			private static final long serialVersionUID = 1L;
			private String sender = chatMessageStore.getSender();
			private String receiver = chatMessageStore.getReceiver();

			@Override
			public Predicate toPredicate(Root<ChatMessageStore> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
				Predicate where = cb.conjunction();	
				if (!StringUtils.isEmpty(sender)&&!StringUtils.isEmpty(receiver)){
					where = cb.and(cb.equal(root.get("sender"),sender),cb.equal(root.get("receiver"),receiver));
					where = cb.or(where,cb.and(cb.equal(root.get("receiver"),sender),cb.equal(root.get("sender"),receiver)));
				}
				return where;
			}
		};
		Page<ChatMessageStore> result = chatMessageStoreService.getAll(specification, pageable);
		gridResponse.setRows(result.getContent());
		gridResponse.setPage(page);
		gridResponse.setTotal(result.getTotalPages());
		gridResponse.setRecords(result.getTotalElements());
		return gridResponse;
	};

}