package org.iii.seaotter.jayee;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.server.standard.ServerEndpointExporter;

@EnableScheduling
@EnableJpaAuditing
@EnableWebSocket
@SpringBootApplication
public class JayeeApp {

	public static void main(String[] args) {
		SpringApplication.run(JayeeApp.class, args);
	}
	 @Bean
	    public ServerEndpointExporter serverEndpointExporter() {
	        return new ServerEndpointExporter();
	    }

}
