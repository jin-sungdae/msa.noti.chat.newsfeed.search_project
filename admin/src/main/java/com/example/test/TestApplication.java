package com.example.test;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.PropertySource;

@PropertySource(value = {
		"classpath:datasource.properties"
})
@SpringBootApplication
public class TestApplication {

	public static void main(String[] args) {


		SpringApplication.run(TestApplication.class, args);
	}

}
