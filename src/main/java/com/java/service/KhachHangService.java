package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.java.dao.KhachHangDAO;
import com.java.dao.SachDAO;
import com.java.entity.KhachHang;
import com.java.entity.LoaiKhachHang;
import com.java.entity.MuonTraSach;
import com.java.entity.Sach;
import com.java.entity.TheLoaiSach;


import java.util.List;

@Service
public class KhachHangService {

    @Autowired
    private KhachHangDAO khachHangDAO;
    @Autowired
    private SachDAO sachDAO;

    @Transactional(readOnly = true)
    public List<LoaiKhachHang> getAllLoaiKhach() {
        return khachHangDAO.getAllLoaiKhach();
    }

    @Transactional(readOnly = true)
    public List<TheLoaiSach> getAllLoaiSach() {
        return khachHangDAO.getAllLoaiSach();
    }

    @Transactional(readOnly = true)
    public List<Sach> getAllSach() {
        return sachDAO.getAllSach();
    }


    @Transactional
    public void saveOrUpdateKhachHang(KhachHang khachHang) {
        khachHangDAO.saveOrUpdateKhachHang(khachHang);
    }

    @Transactional
    public void savemuonsach(MuonTraSach muonTraSach) {
        khachHangDAO.saveMuonTraSach(muonTraSach);
    }

    @Transactional(readOnly = true)
    public Sach getSachById(String maSach) {
        return khachHangDAO.findSachById(maSach);
    }

    @Transactional(readOnly = true)
    public KhachHang getKhachHangById(Integer id) {
        return khachHangDAO.findKhachHangById(id);
    }

    @Transactional(readOnly = true)
    public List<KhachHang> timKiemKhachHang(String keyword) {
        return khachHangDAO.timKiemKhachHang(keyword);
    }

    @Transactional(readOnly = true)
    public List<KhachHang> layTatCaKhachHang() {
        return khachHangDAO.getAllKhachHang();
    }

    @Transactional(readOnly = true)
    public MuonTraSach getMuonTraById(int maMT) {
        return khachHangDAO.getMuonTraById(maMT);
    }


}
