package com.baizhi.controller;

import com.baizhi.entity.Admin;
import com.baizhi.service.AdminService;
import com.baizhi.util.ImageUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private AdminService adminService;

    //生成验证码
    @RequestMapping("/imageCode")
    public void imageCode(HttpSession session, HttpServletResponse response) throws IOException {
        char[] randomChar = ImageUtil.getRandomChar();
        String code = new String(randomChar);
        session.setAttribute("code", code);

        BufferedImage image = ImageUtil.getImage(randomChar);
        response.setContentType("image/png");
        ImageIO.write(image, "pag", response.getOutputStream());

    }

    @RequestMapping("/login")
    @ResponseBody
    public Map<String, Object> login(String name, String password, HttpSession session, String enCode) {
        Map<String, Object> result = new HashMap<String, Object>();
        try {
            String code = (String) session.getAttribute("code");
            if (!enCode.equalsIgnoreCase(code)) throw new RuntimeException("验证码错误");
            Admin admin = adminService.queryByName(name, password);
            session.setAttribute("admin", admin);
            result.put("success", true);
        } catch (Exception e) {
            result.put("success", true);
            result.put("message", e.getMessage());
        }
        return result;
    }
}
