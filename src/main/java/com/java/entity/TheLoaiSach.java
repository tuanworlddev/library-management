package com.java.entity;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name = "THELOAISACH")
public class TheLoaiSach {
    @Id
    @Column(name = "MaLoaiSach")
    private String maLoaiSach;

    @Column(name = "TenLoaiSach")
    private String tenLoaiSach;

    @OneToMany(mappedBy = "theLoaiSach", cascade = CascadeType.ALL)
    private List<Sach> sachs;

    public List<Sach> getSachs() {
        return sachs;
    }

    public void setSachs(List<Sach> sachs) {
        this.sachs = sachs;
    }
    
    // Getters and Setters
    public String getMaLoaiSach() {
        return maLoaiSach;
    }

    public void setMaLoaiSach(String maLoaiSach) {
        this.maLoaiSach = maLoaiSach;
    }

    public String getTenLoaiSach() {
        return tenLoaiSach;
    }

    public void setTenLoaiSach(String tenLoaiSach) {
        this.tenLoaiSach = tenLoaiSach;
    }

   
}