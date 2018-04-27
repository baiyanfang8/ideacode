package com.baizhi.controller;

import org.apache.commons.io.FilenameUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@RestController
@RequestMapping("/pic")
public class PicController {
    @RequestMapping("/add")
    public void addPic(MultipartFile file, String status, String desc, HttpServletRequest request){
        /*当前图片的保存位置*/
        String projectPath=request.getSession().getServletContext().getRealPath("/");
        File proFile=new File(projectPath);
        String parent=proFile.getParent();
        File webFile=new File(parent);
        String absolutePath=webFile.getAbsolutePath();
       String uploadPath= absolutePath+"/upload";
       File uploadPathFile=new File(uploadPath);
       if(!uploadPathFile.exists()){
           uploadPathFile.mkdir();
       }
       //防止文件重名
        String originalFilename=file.getOriginalFilename();
        String extension=FilenameUtils.getExtension(originalFilename);
        UUID uuid=UUID.randomUUID();
       String newName= uuid.toString()+"-"+extension;
        try {
            file.transferTo(new File(uploadPath,newName));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
