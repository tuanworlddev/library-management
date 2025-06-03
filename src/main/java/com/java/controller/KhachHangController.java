package com.java.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.validation.Valid;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.entity.KhachHang;
import com.java.entity.LoaiKhachHang;
import com.java.entity.MuonTraSach;
import com.java.entity.Sach;
import com.java.form.KhachHangForm;
import com.java.service.KhachHangService;

import java.util.List;

@Controller
public class KhachHangController {

    @Autowired
    private KhachHangService khachHangService;

    @GetMapping("/muonsach")
    public String showAddForm(Model model) {
        model.addAttribute("contentPage", "muon-sach.jsp");
        model.addAttribute("khachHangForm", new KhachHangForm());
        model.addAttribute("loaiKhachHangs", khachHangService.getAllLoaiKhach());
        model.addAttribute("dsSach", khachHangService.getAllSach());
        return "layout";
    }

    @PostMapping("/muonsach")
    public String addMuonSach(@ModelAttribute("khachHangForm") @Valid KhachHangForm khachHangForm,
                              BindingResult result,
                              Model model) {
        if (result.hasErrors()) {
            // load dữ liệu lại
            return "layout";
        }

        KhachHang khachHang = khachHangForm.getKhachHang();
        MuonTraSach muonTraSach = khachHangForm.getMuonTraSach();

        String maLoaiKH = khachHangForm.getMaLoaiKH();
        LoaiKhachHang loai = new LoaiKhachHang();
        loai.setMaLoaiKH(maLoaiKH);
        khachHang.setLoaiKhachHang(loai);

        Sach sach = khachHangService.getSachById(khachHangForm.getMuonTraSach().getSach().getMaSach());
        if (sach == null) {
            model.addAttribute("error", "Mã sách không tồn tại.");
            // load lại dữ liệu
            return "layout";
        }
        muonTraSach.setSach(sach);
        muonTraSach.setKhachHang(khachHang);

        // Save or update KhachHang theo cách an toàn
        khachHangService.saveOrUpdateKhachHang(khachHang);

        // Lưu muonTraSach
        khachHangService.savemuonsach(muonTraSach);

        return "redirect:/muonsach?success=true";
    }

    @GetMapping("/api/khachhang")
    @ResponseBody
    public ResponseEntity<?> getKhachHangById(@RequestParam("maKH") Integer maKH) {
        KhachHang kh = khachHangService.getKhachHangById(maKH);

        // Giờ bạn có thể thoải mái gọi:
        System.out.println(kh.getLoaiKhachHang().getTenLoaiKH());

        return ResponseEntity.ok(kh);
    }

    // Bấm vào link => chỉ mở form tìm kiếm


    @GetMapping("/timkiem")
    public String timKiemKhachHang(
            @RequestParam(value = "keyword", required = false) String keyword,
            @RequestParam(value = "tatca", required = false) String xemTatCa,
            Model model) {

        List<KhachHang> danhSach = new ArrayList<>();

        model.addAttribute("contentPage", "tim-kiem.jsp");
        if ("true".equals(xemTatCa)) {
            // Xem toàn bộ KH
            danhSach = khachHangService.layTatCaKhachHang();
            model.addAttribute("daTimKiem", true);
        } else if (keyword != null && !keyword.isEmpty()) {
            danhSach = khachHangService.timKiemKhachHang(keyword);
            model.addAttribute("daTimKiem", true);
        } else {
            model.addAttribute("daTimKiem", false);
        }

        model.addAttribute("danhSachKhachHang", danhSach);
        return "layout";
    }

} 
