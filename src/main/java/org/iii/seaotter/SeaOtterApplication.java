package org.iii.seaotter;

import javax.sql.DataSource;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;

@SpringBootApplication //限制、標記
public class SeaOtterApplication {

	public static void main(String[] args) {
		
		SpringApplication.run(SeaOtterApplication.class, args);
		
	}
	@Bean
	@ConfigurationProperties(prefix="app.datasource")
	public DataSource dataSource() {
		return DataSourceBuilder.create().build();
	}

}
