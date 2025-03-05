package com.example.test.ditest;

import java.util.HashMap;
import java.util.Map;

public class SimpleDIContainer {
    private final Map<Class<?>, Object> beans = new HashMap<>();

    public <T> void register(Class<T> clazz, T instance) {
        beans.put(clazz, instance);
    }

    public <T> T getBean(Class<T> clazz) {
        return clazz.cast(beans.get(clazz));
    }

    public static void main(String[] args) {
        SimpleDIContainer dc = new SimpleDIContainer();

        dc.register(UserService.class, new UserService());

        UserService userService = dc.getBean(UserService.class);
        System.out.println(userService.toString());
    }
}
