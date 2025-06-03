package com.java.dao;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.entity.KhachHang;
import com.java.entity.LoaiKhachHang;
import com.java.entity.MuonTraSach;
import com.java.entity.Sach;
import com.java.entity.TheLoaiSach;

import java.util.List;

import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;

@Repository
@Transactional
public class KhachHangDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public List<LoaiKhachHang> getAllLoaiKhach() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("FROM LoaiKhachHang", LoaiKhachHang.class).getResultList();
    }


    public List<TheLoaiSach> getAllLoaiSach() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from TheLoaiSach", TheLoaiSach.class).list();
    }

    @Transactional
    public void saveOrUpdateKhachHang(KhachHang khachHang) {
        Session session = sessionFactory.getCurrentSession();
        if (khachHang.getMaKH() == null) {
            session.save(khachHang); // tạo mới
        } else {
            KhachHang existing = session.get(KhachHang.class, khachHang.getMaKH());
            if (existing == null) {
                throw new EntityNotFoundException("Không tìm thấy Khách hàng với MaKH = " + khachHang.getMaKH());
            }
            // Cập nhật các trường cần thiết
            existing.setTenKH(khachHang.getTenKH());
            existing.setDiaChi(khachHang.getDiaChi());
            existing.setSoDT(khachHang.getSoDT());
            existing.setGioiTinh(khachHang.getGioiTinh());
            existing.setTuoi(khachHang.getTuoi());
            existing.setGhiChu(khachHang.getGhiChu());
            existing.setLoaiKhachHang(khachHang.getLoaiKhachHang());
            session.update(existing);
        }
    }

    public void saveMuonTraSach(MuonTraSach muonTraSach) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(muonTraSach);
    }
    public Sach findSachById(String maSach) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Sach.class, maSach);
    }
    public KhachHang findKhachHangById(Integer id) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery(
            "SELECT k FROM KhachHang k JOIN FETCH k.loaiKhachHang WHERE k.maKH = :id", KhachHang.class)
            .setParameter("id", id)
            .uniqueResult();
    }
    public List<KhachHang> timKiemKhachHang(String keyword) {
        Session session = sessionFactory.getCurrentSession();
        String hql = "SELECT DISTINCT k FROM KhachHang k " +
                     "JOIN FETCH k.loaiKhachHang " +
                     "JOIN FETCH k.muonTraSachs m " +
                     "WHERE k.tenKH LIKE :kw OR str(k.maKH) LIKE :kw";

        return session.createQuery(hql, KhachHang.class)
                      .setParameter("kw", "%" + keyword + "%")
                      .getResultList();
    }
    
    public List<KhachHang> getAllKhachHang() {
        Session session = sessionFactory.getCurrentSession();
        String hql = "SELECT DISTINCT k FROM KhachHang k " +
                     "LEFT JOIN FETCH k.loaiKhachHang " +
                     "LEFT JOIN FETCH k.muonTraSachs m " +
                     "LEFT JOIN FETCH m.sach";

        return session.createQuery(hql, KhachHang.class).getResultList();
    }
    public MuonTraSach getMuonTraById(int maMT) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(MuonTraSach.class, maMT);
    }




}