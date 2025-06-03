package com.java.entity;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.PastOrPresent;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Entity
@Table(name = "SACH")
public class Sach {
    @Id
    @Column(name = "MaSach")
    @NotBlank(message = "MaSach là bắt buộc")
    private String maSach;

    @Column(name = "TenSach")
    private String tenSach;

    @Column(name = "TacGia")
    private String tacGia;

    @Column(name = "SoLuong")
    private Integer soLuong;
    
    @Column(name = "AnhSach")
    private String anhSach;

    public String getAnhSach() {
		return anhSach;
	}

	public void setAnhSach(String anhSach) {
		this.anhSach = anhSach;
	}

	@Column(name = "NamXuatBan")
    
    @PastOrPresent(message = "Năm xuất bản không được là ngày trong tương lai")
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern = "yyyy")
    private Date namXuatBan;

    @Column(name = "DonGia")
    private Double donGia;

    @ManyToOne
    @JoinColumn(name = "MaTheLoai")
    private TheLoaiSach theLoaiSach;

    public TheLoaiSach getTheLoaiSach() {
        return theLoaiSach;
    }

    public void setTheLoaiSach(TheLoaiSach theLoaiSach) {
        this.theLoaiSach = theLoaiSach;
    }

    // Getters and Setters
    public String getMaSach() {
        return maSach;
    }

    public void setMaSach(String maSach) {
        this.maSach = maSach;
    }

    public String getTenSach() {
        return tenSach;
    }

    public void setTenSach(String tenSach) {
        this.tenSach = tenSach;
    }

    public String getTacGia() {
        return tacGia;
    }

    public void setTacGia(String tacGia) {
        this.tacGia = tacGia;
    }

    public Date getNamXuatBan() {
        return namXuatBan;
    }

    public void setNamXuatBan(Date namXuatBan) {
        this.namXuatBan = namXuatBan;
    }

    public Double getDonGia() {
        return donGia;
    }

    public void setDonGia(Double donGia) {
        this.donGia = donGia;
    }

    public Integer getSoLuong() {
        return soLuong;
    }

    public void setSoLuong(Integer soLuong) {
        this.soLuong = soLuong;
    }
}