package com.notification.worker.monitoring.service;

import com.fasterxml.jackson.databind.deser.std.StringDeserializer;
import com.notification.worker.NotificationApplication;
import com.notification.worker.event.DLQConsumer;
import com.notification.worker.monitoring.config.TestKafkaConfig;
import lombok.extern.slf4j.Slf4j;
import org.apache.kafka.clients.consumer.Consumer;
import org.apache.kafka.clients.consumer.ConsumerConfig;
import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.junit.ClassRule;
import org.junit.Test;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.TestInstance;
import org.junit.jupiter.api.extension.ExtendWith;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import org.springframework.boot.test.context.ConfigDataApplicationContextInitializer;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.Environment;
import org.springframework.core.env.PropertySource;
import org.springframework.kafka.core.KafkaTemplate;
import org.springframework.kafka.test.context.EmbeddedKafka;
import org.springframework.kafka.test.utils.ContainerTestUtils;
import org.springframework.kafka.test.utils.KafkaTestUtils;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.context.junit4.SpringRunner;
import org.testcontainers.containers.KafkaContainer;
import org.testcontainers.utility.DockerImageName;

import java.io.File;
import java.net.URL;
import java.time.Duration;
import java.util.Arrays;
import java.util.Collections;
import java.util.Properties;
import java.util.concurrent.TimeUnit;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Fail.fail;
import static org.hamcrest.Matchers.containsString;
import static org.junit.Assert.assertTrue;
import static org.junit.jupiter.api.Assertions.assertNotNull;

@SpringBootTest(properties = "kafka.topic.notification=test-topic")
public class KafkaConnectionTest {

    @Autowired
    private ApplicationContext applicationContext;

    @Autowired
    private KafkaTemplate<String, String> kafkaTemplate;

    @Autowired
    private DLQConsumer consumerService;

    private final String errorTopic = "error-topic";
    private final String notificationDLQ = "notification-dlq";

    @Autowired
    private Environment environment;

    @Test
    public void checkApplicationPropertiesFile() {
        URL resource = getClass().getClassLoader().getResource("application.properties");
        if (resource == null) {
            System.out.println("`application.properties`가 classpath에서 발견되지 않음!");
            fail("application.properties 파일이 classpath:/ 에 존재하지 않음!");
        } else {
            System.out.println("application.properties 위치: " + resource.getPath());
        }

        File file = new File("src/test/resources/application.properties");
        System.out.println("🚀 파일 존재 여부: " + file.exists());
        System.out.println("🚀 절대 경로: " + file.getAbsolutePath());
    }


    @Test
    public void checkPropertyLoad() {
        String topicName = environment.getProperty("kafka.topic.notification");
        System.out.println("Loaded kafka.topic.notification: " + topicName);
        assertNotNull(topicName, "kafka.topic.notification is null!");
    }

    /**
     * spring-boot-test 에서 properties 못찾는 error
     */
    @Test
    public void debugProperties() {
        System.out.println(" kafka.topic.notification: " + environment.getProperty("kafka.topic.notification"));
        assertNotNull(environment.getProperty("kafka.topic.notification"), "kafka.topic.notification is null!");
    }

    @Test
    public void testApplicationContextManualLoad() {
        ApplicationContext context = new AnnotationConfigApplicationContext(NotificationApplication.class);
        assertNotNull(context, "ApplicationContext is null - Spring context did not load!");
    }

    @Test
    public void checkKafkaTemplateBean() {
        boolean isBeanPresent = applicationContext.containsBean("kafkaTemplate");
        System.out.println("Is KafkaTemplate a bean? " + isBeanPresent);
        assertTrue("KafkaTemplate is not a registered Spring Bean!", isBeanPresent);
    }

    @Test
    public void givenMessageInErrorTopic_whenProcessing_thenMovedToNotificationDLQ() throws Exception {
        // Step 1: "error-topic"으로 메시지 전송
        String message = "This is an error message";
        kafkaTemplate.send(errorTopic, message);

        // Step 2: DLQ Listener가 "notification-dlq"로 메시지 전송할 때까지 대기
        boolean messageMovedToDLQ = consumerService.getDLQLatch().await(10, TimeUnit.SECONDS);

        // Step 3: DLQ에 메시지가 정상적으로 들어갔는지 확인
        assertTrue(messageMovedToDLQ);
        assertThat(consumerService.getDLQPayload()).contains(message);
    }

}
