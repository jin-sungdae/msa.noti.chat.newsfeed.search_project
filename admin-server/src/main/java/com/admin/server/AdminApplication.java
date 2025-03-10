package com.admin.server;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;

@PropertySource(value = {
		"classpath:datasource.properties"
})
@SpringBootApplication
public class AdminApplication {

	public static void main(String[] args) {


		SpringApplication.run(AdminApplication.class, args);
	}

}
