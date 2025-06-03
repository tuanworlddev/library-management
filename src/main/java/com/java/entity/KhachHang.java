package com.java.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;

import com.fasterxml.jackson.annotation.JsonIgnore;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "KHACHHANG")
public class KhachHang {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // ✅ Tự động tăng
    @Column(name = "MaKH")
    private Integer maKH;
	
    @Column(name = "TenKH")
    private String tenKH;

    @Column(name = "Tuoi")
    private String tuoi;
    
    @Column(name = "GioiTinh")
    private String gioiTinh;

    @Column(name = "SoDT")
    private String soDT;

    @Column(name = "DiaChi")
    private String diaChi;
    
    @Column(name = "GhiChu")
    private String ghiChu;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "MaLoaiKH")
    private LoaiKhachHang loaiKhachHang;
    @JsonIgnore
    @OneToMany(mappedBy = "khachHang", fetch = FetchType.LAZY)
    private List<MuonTraSach> muonTraSachs= new ArrayList<>();

   

   

    public List<MuonTraSach> getMuonTraSachs() {
		return muonTraSachs;
	}

	public void setMuonTraSachs(List<MuonTraSach> muonTraSachs) {
		this.muonTraSachs = muonTraSachs;
	}

	public Integer getMaKH() {
		return maKH;
	}

	public void setMaKH(Integer maKH) {
		this.maKH = maKH;
	}

	public String getTenKH() {
		return tenKH;
	}

	public void setTenKH(String tenKH) {
		this.tenKH = tenKH;
	}

	public String getTuoi() {
		return tuoi;
	}

	public void setTuoi(String tuoi) {
		this.tuoi = tuoi;
	}

	public String getGioiTinh() {
		return gioiTinh;
	}

	public void setGioiTinh(String gioiTinh) {
		this.gioiTinh = gioiTinh;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public LoaiKhachHang getLoaiKhachHang() {
	    return loaiKhachHang;
	}

	public String getSoDT() {
		return soDT;
	}

	public void setSoDT(String soDT) {
		this.soDT = soDT;
	}

	public String getDiaChi() {
		return diaChi;
	}

	public void setDiaChi(String diaChi) {
		this.diaChi = diaChi;
	}

	public void setLoaiKhachHang(LoaiKhachHang loaiKhachHang) {
	    this.loaiKhachHang = loaiKhachHang;
	}
   

   
}