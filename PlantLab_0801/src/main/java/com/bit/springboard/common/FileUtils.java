package com.bit.springboard.common;

import com.bit.springboard.dto.GreentalkFileDto;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Component
public class FileUtils {
    public static GreentalkFileDto parserFileInfo(MultipartFile multipartFile, String attachPath) {
        GreentalkFileDto greentalkFileDto = new GreentalkFileDto();

        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        Date nowDate = new Date();

        String nowDateStr = format.format(nowDate);

        UUID uuid =UUID.randomUUID();

        String fileName = uuid.toString() + "_" +nowDateStr + "_" + multipartFile.getOriginalFilename();

        File uploadFile = new File(attachPath + fileName);
        String type = "";

        try {
            multipartFile.transferTo(uploadFile);
            type = Files.probeContentType(uploadFile.toPath());
        } catch(IOException ie) {
            System.out.println(ie.getMessage());
        }

        if(!type.equals("")) {
            if(type.startsWith("image")) {
                greentalkFileDto.setFiletype("image");
            } else {
                greentalkFileDto.setFiletype("etc");
            }
        } else {
            greentalkFileDto.setFiletype("etc");
        }

        greentalkFileDto.setFilename(fileName);
        greentalkFileDto.setFileoriginname(multipartFile.getOriginalFilename());
        greentalkFileDto.setFilepath(attachPath);

        return greentalkFileDto;
    }

    //김시표 쇼핑몰 파일 업로드
    private static final String uploadDir = "C:/upload/";

    public String saveFile(MultipartFile file) throws IOException {
        if (file.isEmpty()) {
            throw new IllegalArgumentException("파일이 비어있어요 ㅠㅠ");
        }

        String originalFilename = file.getOriginalFilename();
        String filePath = uploadDir + originalFilename;

        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        Path path = Paths.get(filePath);
        Files.write(path, file.getBytes());

        return filePath;
    }

    public byte[] getFile(String fileName) throws IOException {
        Path path = Paths.get(uploadDir + fileName);
        return Files.readAllBytes(path);
    }
}