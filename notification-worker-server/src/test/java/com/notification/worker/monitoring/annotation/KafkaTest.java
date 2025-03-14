package com.notification.worker.monitoring.annotation;

import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.kafka.test.context.EmbeddedKafka;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target(ElementType.TYPE)
@Retention(RetentionPolicy.RUNTIME)
@SpringBootTest
@EmbeddedKafka(partitions = 2, brokerProperties = {
        "listeners=PLAINTEXT://localhost:9092",
        "port=9092",
})
public @interface KafkaTest {
    String testDescriptions() default "";
}