package com.baizhi.controller;

import org.apache.catalina.servlet4preview.http.HttpServletRequest;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

@Controller
@RequestMapping("/update")
public class ChapterController {
    @RequestMapping("/add")
    public void update(MultipartFile file, String id, HttpServletRequest  Request){
        //获取文件存储的位置
        String projectPath=Request.getSession().getServletContext().getRealPath("/");
        String audioPuth=projectPath+"audio";
        File audio = new File(audioPuth);
        if(!audio.exists()){
            audio.mkdir();
        }

        //重命名
        String original=file.getOriginalFilename();
       String exception= FilenameUtils.getExtension(original);

        String newName=UUID.randomUUID().toString()+"."+exception;
        //上传到文件夹
        try {
            file.transferTo(new File(audioPuth,newName));
        } catch (IOException e) {
            e.printStackTrace();
        }


        }
    //获取时长,大小，原始文件名，urL，专辑的id ,保存到数据库
    @RequestMapping("/down")
    public void down(String url,String oldName,HttpServletRequest request,HttpServletResponse response) throws IOException {
        //招到对应的下载文件
        String filePath=request.getSession().getServletContext().getRealPath("audio")+url;
        File file=new File(filePath);
        String extension=FilenameUtils.getExtension(url);
       oldName=oldName+"."+extension;
       try{
         oldName= new String(oldName.getBytes("UTF-8"),"ISO-8859-1");
       }catch(UnsupportedEncodingException e){
           e.printStackTrace();
       }
        //设置响应头，设置响应流
        response.setContentType("/audin/mpeg");
        response.setHeader("Content-Disposition","attachment;fileName="+oldName);
        //响应流响应出去
        ServletOutputStream outputStream=response.getOutputStream();
        outputStream.write(FileUtils.readFileToByteArray(file));

    }
}
