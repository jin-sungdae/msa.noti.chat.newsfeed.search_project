package com.notification.worker.monitoring.service;


import com.notification.worker.monitoring.KafkaProducerTestHelper;
import com.notification.worker.monitoring.annotation.KafkaTest;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.ProducerRecord;
import org.apache.kafka.clients.producer.RecordMetadata;
import org.junit.jupiter.api.*;

import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;

import static org.assertj.core.api.Assertions.assertThat;


@KafkaTest
public class SimpleTest {

    KafkaProducer<String, String> sut;



    @BeforeEach
    void setUp() {

        sut = KafkaProducerTestHelper.getSimpleProducer();
    }


    @Test
    @DisplayName("동기 전송, 메시지를 보내고 future로 성공 실패 확인")
    public void name() throws ExecutionException, InterruptedException {
        ProducerRecord<String, String> record = new ProducerRecord<>("my-topic", "hello word~!");

        Future<RecordMetadata> future = sut.send(record);

        RecordMetadata actual = future.get();

        assertThat(actual.topic()).isEqualTo("my-topic");
    }
}
