package com.java.entity;

import java.util.List;

import javax.persistence.*;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "LOAIKHACHHANG")
public class LoaiKhachHang {
    @Id
    @Column(name = "MaLoaiKH")
    private String maLoaiKH;

    @Column(name = "TenLoaiKH")
    private String tenLoaiKH;

    
    // Getters and Setters
    public String getMaLoaiKH() {
        return maLoaiKH;
    }

    public void setMaLoaiKH(String maLoaiKH) {
        this.maLoaiKH = maLoaiKH;
    }

    public String getTenLoaiKH() {
        return tenLoaiKH;
    }

    public void setTenLoaiKH(String tenLoaiKH) {
        this.tenLoaiKH = tenLoaiKH;
    }
    @JsonIgnore
    @OneToMany(mappedBy = "loaiKhachHang", cascade = CascadeType.ALL)
    private List<KhachHang> khachHangs;

    public List<KhachHang> getKhachHangs() {
        return khachHangs;
    }

    public void setKhachHangs(List<KhachHang> khachHangs) {
        this.khachHangs = khachHangs;
    }
    public LoaiKhachHang() {
        // Constructor mặc định (rất quan trọng)
    }
   
}