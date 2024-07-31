package com.bit.springboard.common;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Component
public class StoreFileUtils {
    private final String storeUploadDir = "C:/upload/";

    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("파일이 비어있어요 ㅠㅠ");
        }

        String storeOriginalFilename = file.getOriginalFilename();
        String storeFilePath = storeUploadDir + storeOriginalFilename;

        File dir = new File(storeUploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        Path path = Paths.get(storeFilePath);
        Files.write(path, file.getBytes());

        return storeFilePath;
    }

    public byte[] getFile(String fileName) throws IOException {
        Path path = Paths.get(storeUploadDir + fileName);
        return Files.readAllBytes(path);
    }
}