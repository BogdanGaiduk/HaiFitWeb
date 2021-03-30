package com.FitPlanWeb.service;

import com.FitPlanWeb.domain.Message;
import com.FitPlanWeb.repos.MessageRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Component
public class MainService {
    private final MessageRepo messageRepo;

    @Autowired
    public MainService(MessageRepo messageRepo) {
        this.messageRepo = messageRepo;
    }

    public void addPicture(MultipartFile file, String uploadPath, Message message)
            throws IOException {

        /* условие для добавления файла на сервер */
        if (file!=null && !file.getOriginalFilename().isEmpty()){
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()){
                uploadDir.mkdir();
            }

            String uuidFile = UUID.randomUUID().toString();
            String resultFilename = uuidFile + "." + file.getOriginalFilename();

            file.transferTo(new File(uploadPath + "/" + resultFilename));
            message.setFilename(resultFilename);
        }
        messageRepo.save(message);
    }
}