package com.java.form;

import javax.validation.Valid;

import com.java.entity.KhachHang;
import com.java.entity.MuonTraSach;

public class KhachHangForm {

    @Valid
    private KhachHang khachHang;

    @Valid
    private MuonTraSach muonTraSach;

    // Dùng để binding từ <form:select>
    private String maLoaiKH;
    private String maLoaiSach;

    public KhachHangForm() {
        this.khachHang = new KhachHang();
        this.muonTraSach = new MuonTraSach();
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public MuonTraSach getMuonTraSach() {
        return muonTraSach;
    }

    public void setMuonTraSach(MuonTraSach muonTraSach) {
        this.muonTraSach = muonTraSach;
    }

    public String getMaLoaiKH() {
        return maLoaiKH;
    }

    public void setMaLoaiKH(String maLoaiKH) {
        this.maLoaiKH = maLoaiKH;
    }

    public String getMaLoaiSach() {
        return maLoaiSach;
    }

    public void setMaLoaiSach(String maLoaiSach) {
        this.maLoaiSach = maLoaiSach;
    }
}
