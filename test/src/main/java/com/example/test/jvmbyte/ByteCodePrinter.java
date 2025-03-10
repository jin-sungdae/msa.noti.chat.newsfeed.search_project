package com.example.test.jvmbyte;

import org.objectweb.asm.ClassReader;
import java.io.IOException;

public class ByteCodePrinter {
    public static void main(String[] args) throws IOException {
        ClassReader reader = new ClassReader("com.example.test.ditest.UserService");
        reader.accept(new org.objectweb.asm.util.TraceClassVisitor(new java.io.PrintWriter(System.out)), 0);
    }
}
