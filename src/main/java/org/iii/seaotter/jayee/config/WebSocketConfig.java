package org.iii.seaotter.jayee.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.ChannelRegistration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@Configuration
@EnableWebSocketMessageBroker
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer{
  
	@Override
	  public void configureMessageBroker(MessageBrokerRegistry config) {
		 config.setApplicationDestinationPrefixes("/app");
    }
 
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        registry.addEndpoint("/ilovejayee").withSockJS();
    }

	@Override
	public void configureClientInboundChannel(ChannelRegistration registration) {
		System.out.println("跳進來");
		WebSocketMessageBrokerConfigurer.super.configureClientInboundChannel(registration);
		
	}

	@Override
	public void configureClientOutboundChannel(ChannelRegistration registration) {
		System.out.println("跳出去");
		WebSocketMessageBrokerConfigurer.super.configureClientOutboundChannel(registration);
		
	}
    
    
    
	
}
