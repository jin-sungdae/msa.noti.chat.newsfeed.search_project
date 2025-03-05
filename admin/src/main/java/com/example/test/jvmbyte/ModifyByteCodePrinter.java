package com.example.test.jvmbyte;

import org.objectweb.asm.*;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ModifyByteCodePrinter {
    public static void main(String[] args) throws IOException {




        // 현재 실행 중인 디렉토리 출력 (확인용)
        String rootPath = System.getProperty("user.dir");
        System.out.println("Current directory: " + rootPath);

        // 절대 경로 설정
        String classPath = rootPath + "/src/main/java/com/example/test/jvmbyte/Example.class";
        System.out.println("Loading class from: " + classPath);

        byte[] classBytes = Files.readAllBytes(Paths.get(classPath));



        // 바이트코드 수정
        ClassReader reader = new ClassReader(classBytes);
        ClassWriter writer = new ClassWriter(ClassWriter.COMPUTE_FRAMES | ClassWriter.COMPUTE_MAXS);

        reader.accept(new ClassVisitor(Opcodes.ASM9, writer) {

            @Override
            public MethodVisitor visitMethod(int access, String name, String descriptor, String signature, String[] exceptions) {
                MethodVisitor mv = super.visitMethod(access, name, descriptor, signature, exceptions);
                return new MethodVisitor(Opcodes.ASM9, mv) {
                    @Override
                    public void visitLdcInsn(Object value) {
                        if ("HI".equals(value)) {
                            super.visitLdcInsn("HELLO");
                        } else {
                            super.visitLdcInsn(value);
                        }

                    }
                };
            }
        }, 0);

        // 변경된 바이트코드 저장
        byte[] modifiedClass = writer.toByteArray();
        try (FileOutputStream fos = new FileOutputStream(classPath)) {
            fos.write(modifiedClass);
        }

        System.out.println();
    }
}
