package com.java.controller;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.entity.MuonTraSach;
import com.java.service.KhachHangService;

@Controller
public class MuonTraSachController {
    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("/muontrasach/chitiet")
    public String chiTietMuon(@RequestParam("maMT") int maMT, Model model) {
        MuonTraSach muon = khachHangService.getMuonTraById(maMT);
        model.addAttribute("contentPage", "chi-tiet-muon.jsp");
        model.addAttribute("muon", muon);
        return "layout";
    }


    @PostMapping("/muontrasach/phat")
    public String tinhTienPhat(@RequestParam("maMuon") Integer maMuon,
                               @RequestParam("ngayTra") @DateTimeFormat(pattern = "yyyy-MM-dd") Date ngayTra,
                               Model model) {
        MuonTraSach muon = khachHangService.getMuonTraById(maMuon);

        Date hanTra = muon.getHanTra();

        long millisecondsLate = ngayTra.getTime() - hanTra.getTime();
        long daysLate = millisecondsLate / (1000 * 60 * 60 * 24);
        if (daysLate < 0) daysLate = 0; // không cho âm

        Double tienPhat = (double) (daysLate * 10000);

        model.addAttribute("contentPage", "chi-tiet-muon.jsp");

        model.addAttribute("muon", muon);
        model.addAttribute("daysLate", daysLate);
        model.addAttribute("tienPhat", tienPhat);
        model.addAttribute("ngayTra", ngayTra);
        muon.setTienPhat(tienPhat);
        muon.setNgayTra(ngayTra);
        khachHangService.savemuonsach(muon);
        return "layout";
    }

    @PostMapping("/muontrasach/hoantra")
    public String hoanTatTraSach(@RequestParam("maMuon") Integer maMuon
    ) {
        MuonTraSach muon = khachHangService.getMuonTraById(maMuon);

        muon.setStatus("Rồi"); // đánh dấu là đã trả
        // nếu có trường ngày trả
        khachHangService.savemuonsach(muon); // cập nhật DB
        System.out.print("xong");

        return "redirect:/muontrasach/chitiet"; // hoặc trang khác
    }

}