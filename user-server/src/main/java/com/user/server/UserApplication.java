package com.user.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.scheduling.annotation.EnableScheduling;

@PropertySource(value = {
		"classpath:datasource.properties"
})
@SpringBootApplication
@EnableScheduling
public class UserApplication {

	public static void main(String[] args) {


		SpringApplication.run(UserApplication.class, args);
	}

}
