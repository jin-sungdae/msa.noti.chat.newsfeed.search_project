package com.notification.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@PropertySource(value = {
		"classpath:datasource.properties"
})
@SpringBootApplication
public class NotificationApplication {

	public static void main(String[] args) {


		SpringApplication.run(NotificationApplication.class, args);
	}

}
