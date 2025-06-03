package com.java.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.java.entity.Sach;

@Repository
public class SachDAO {

    @Autowired
    private SessionFactory sessionFactory;

    /**
     * Lấy tất cả sách trong kho
     */
    public List<Sach> getAllSach() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from Sach", Sach.class).list();
    }

    /**
     * Tìm sách theo mã
     */
    public Sach findSachById(String maSach) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(Sach.class, maSach);
    }

    /**
     * Thêm mới hoặc cập nhật sách
     */
    public void saveSach(Sach sach) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(sach);
    }

    /**
     * Xoá sách khỏi kho theo mã
     */
    public void deleteSach(String maSach) {
        Session session = sessionFactory.getCurrentSession();
        Sach sach = session.get(Sach.class, maSach);
        if (sach != null) {
            session.delete(sach);
        }
    }

    /**
     * Kiểm tra mã sách đã tồn tại hay chưa (nếu bạn cần validate trước khi insert)
     */
    public boolean existsById(String maSach) {
        return findSachById(maSach) != null;
    }
}
