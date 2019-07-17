package org.iii.seaotter.jayee.web;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import org.iii.seaotter.jayee.entity.SecurityUser;
import org.iii.seaotter.jayee.entity.Temp0716;
import org.iii.seaotter.jayee.service.SecurityUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.Header;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.annotation.SendToUser;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

@Controller
public class GreetingController {
	
	@Autowired
	private SecurityUserService securityUserService;
	
    private SimpMessagingTemplate template;

    @Autowired
    public GreetingController(SimpMessagingTemplate template) {
        this.template = template;
    }

    @RequestMapping("/happy123123")
    public void greet() {
    	System.out.println(123);
      
        this.template.convertAndSend("/topic/greetings", "55688");
    }
    
    @MessageMapping("/chat")
    @SendTo("/topic/greetings")
    public Temp0716 send(Temp0716 text) throws Exception {
    
        return text;
    }
 
    private Gson gson = new Gson();
  
    @MessageMapping("/message")
    @SendToUser("/queue/reply")
    public String processMessageFromClient(
      @Payload String message, 
      Principal principal) throws Exception {
    return gson.fromJson(message, Map.class)
          .get("name").toString();
    }
    
    
    @MessageMapping("/secured/room") 
    public void sendSpecific(
      @Payload Temp0716 msg, 
      Principal user, 
      @Header("simpSessionId") String sessionId) throws Exception { 
          System.out.println(msg);
       
          template.convertAndSend("/app/chat/single/"+msg.getTo(), msg.getContent());
    }
    
    @GetMapping("/findmyfriends")
    @ResponseBody
    public List<SecurityUser> findFriends(@RequestParam(name="userAccount") String userAccount) {
    	List<SecurityUser> myFriedns = null;
    	 SecurityUser currentUser = securityUserService.findUserBean(userAccount);
    	 if(currentUser!=null) {
    	myFriedns = currentUser.getFriends();
    	 }
    	 System.out.println("enter");
    	return myFriedns;
    }

 

}