package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import com.java.service.CloudinaryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.java.entity.Sach;
import com.java.service.SachService;

@Controller
public class SachController {
    @Autowired
    private SachService sachService;

    @Autowired
    private CloudinaryService cloudinaryService;

    @PostMapping("/sachs/them")
    public String themSach(@RequestParam("maSach") String maSach,
                           @RequestParam("tenSach") String tenSach,
                           @RequestParam("tacGia") String tacGia,
                           @RequestParam("soLuong") Integer soLuong,
                           @RequestParam("anhFile") MultipartFile anhFile,
                           HttpServletRequest request) {
        try {
            final String imageUrl = cloudinaryService.uploadFile(anhFile);

            Sach sach = new Sach();
            sach.setMaSach(maSach);
            sach.setTenSach(tenSach);
            sach.setTacGia(tacGia);
            sach.setSoLuong(soLuong);
            sach.setAnhSach(imageUrl);

            sachService.themSach(sach);

            return "redirect:/sachs";
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
        }
    }

    @GetMapping("/sachs")
    public String displayBookList(Model model) {
        List<Sach> books = sachService.layTatCaSach();
        model.addAttribute("contentPage", "book-list.jsp");
        model.addAttribute("books", books);
        return "layout";
    }

    @PostMapping("/sachs/xoa")
    public String xoaSach(@RequestParam("maSach") String maSach) {
        sachService.xoaSach(maSach);
        return "redirect:/sachs";
    }

    @PostMapping("/sachs/sua")
    public String capNhatSach(@RequestParam("maSach") String maSach,
                              @RequestParam("tenSach") String tenSach,
                              @RequestParam("tacGia") String tacGia,
                              @RequestParam("soLuong") Integer soLuong,
                              @RequestParam("anhFile") MultipartFile anhFile) {
        try {
            Sach sach = sachService.timSachTheoMa(maSach);
            sach.setTenSach(tenSach);
            sach.setTacGia(tacGia);
            sach.setSoLuong(soLuong);
            if (anhFile != null && !anhFile.isEmpty()) {
                sach.setAnhSach(cloudinaryService.uploadFile(anhFile));
            }
            sachService.themSach(sach);
            return "redirect:/sachs";
        } catch (IOException e) {
            e.printStackTrace();
            return "error";
        }
    }

}
