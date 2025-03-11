package com.notification.worker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;
import org.springframework.kafka.annotation.EnableKafka;
import org.springframework.scheduling.annotation.EnableScheduling;

@PropertySource(value = {
		"classpath:datasource.properties"
})
@SpringBootApplication
@EnableScheduling
@EnableKafka
public class NotificationApplication {

	public static void main(String[] args) {


		SpringApplication.run(NotificationApplication.class, args);
	}

}
