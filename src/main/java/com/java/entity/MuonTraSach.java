package com.java.entity;

import javax.persistence.*;
import javax.validation.constraints.PastOrPresent;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Entity
@Table(name = "MUONTRASACH")
public class MuonTraSach {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "MaMuon")
    private Integer maMuon;

    @ManyToOne
    @JoinColumn(name = "MaKH", nullable = false)
    private KhachHang khachHang;

    @ManyToOne
    @JoinColumn(name = "MaSach", nullable = false)
    private Sach sach;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @PastOrPresent(message = "Ngày mượn không được là ngày trong tương lai")
    @Column(name = "NgayMuon", nullable = false)
    private Date ngayMuon;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "HanTra")
    private Date hanTra;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Temporal(TemporalType.DATE)
    @Column(name = "NgayTra")
    private Date ngayTra;

    @Column(name = "Status")
    private String status;

    @Column(name = "TienPhat")
    private Double tienPhat;

    @Column(name = "GhiChu")
    private String ghiChu;

    // Getters & Setters

    public Integer getMaMuon() {
        return maMuon;
    }

    public void setMaMuon(Integer maMuon) {
        this.maMuon = maMuon;
    }

    public KhachHang getKhachHang() {
        return khachHang;
    }

    public void setKhachHang(KhachHang khachHang) {
        this.khachHang = khachHang;
    }

    public Sach getSach() {
        return sach;
    }

    public void setSach(Sach sach) {
        this.sach = sach;
    }

    public Date getNgayMuon() {
        return ngayMuon;
    }

    public void setNgayMuon(Date ngayMuon) {
        this.ngayMuon = ngayMuon;
    }

    public Date getHanTra() {
        return hanTra;
    }

    public void setHanTra(Date hanTra) {
        this.hanTra = hanTra;
    }

    public Date getNgayTra() {
        return ngayTra;
    }

    public void setNgayTra(Date ngayTra) {
        this.ngayTra = ngayTra;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getTienPhat() {
        return tienPhat;
    }

    public void setTienPhat(Double tienPhat) {
        this.tienPhat = tienPhat;
    }

    public String getGhiChu() {
        return ghiChu;
    }

    public void setGhiChu(String ghiChu) {
        this.ghiChu = ghiChu;
    }
}
