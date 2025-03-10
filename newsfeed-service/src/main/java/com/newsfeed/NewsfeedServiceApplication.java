package com.newsfeed;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.PropertySource;


@PropertySource(value = {
        "classpath:datasource.properties",
})
@SpringBootApplication
public class NewsfeedServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(NewsfeedServiceApplication.class, args);
    }

}
